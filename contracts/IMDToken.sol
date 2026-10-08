// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract IMDToken is ERC20 {
    constructor(uint256 supply) ERC20("IMD", "IMD") { _mint(msg.sender, supply); }
}
