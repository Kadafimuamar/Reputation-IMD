// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Reputation is Ownable {
    IERC20 public immutable REP;

    struct UserStats {
        uint256 received;
        uint256 givers;
    }

    mapping(bytes32 => UserStats) public users;
    mapping(bytes32 => mapping(address => uint256)) public given;
    mapping(bytes32 => mapping(address => bool)) public hasGiven;
    mapping(bytes32 => mapping(address => uint8)) public category;

    event ReputationGiven(
        bytes32 indexed xUser,
        address indexed giver,
        uint256 amount,
        uint8 category
    );

    constructor(address repToken) Ownable(msg.sender) {
        REP = IERC20(repToken);
    }

    function giveReputation(bytes32 xUser, uint256 amount, uint8 reason) external {
        require(amount > 0, "amount=0");
        require(reason <= 5, "bad category");
        require(REP.transferFrom(msg.sender, address(this), amount), "REP transfer failed");

        if (!hasGiven[xUser][msg.sender]) {
            hasGiven[xUser][msg.sender] = true;
            users[xUser].givers += 1;
        }

        given[xUser][msg.sender] += amount;
        category[xUser][msg.sender] = reason;
        users[xUser].received += amount;

        emit ReputationGiven(xUser, msg.sender, amount, reason);
    }

    function reputationOf(bytes32 xUser) external view returns (uint256 received, uint256 givers) {
        UserStats memory s = users[xUser];
        return (s.received, s.givers);
    }

    function withdraw(address to, uint256 amount) external onlyOwner {
        require(REP.transfer(to, amount), "transfer failed");
    }
}
