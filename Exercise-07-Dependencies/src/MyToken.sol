// Exercise VII - Managing Dependencies
// Build a mintable token using OpenZeppelin. Learn to install and manage dependencies cleanly.

// Concepts You'll Master
// a. forge install
// b. remappings.txt
// c. OpenZeppelin imports

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor() ERC20("MyToken", "MTK") Ownable(msg.sender) {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
