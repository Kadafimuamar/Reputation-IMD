// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract ReputationToken is ERC20 {
    constructor(uint256 supply) ERC20("Reputation Ticker", "REP") { _mint(msg.sender, supply); }
}
