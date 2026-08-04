// Exercise III - Testing Basics in Solidity
// Build a simple bank where users deposit and withdraw. Write tests to ensure the logic works and edge cases are handled.

// Concepts You'll Master
// a. forge test
// b. assertEq
// c. expectRevert
// d. test coverage

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Bank {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");

        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;

        (bool success, ) = payable(msg.sender).call{value: amount}("");

        require(success, "Transfer failed");
    }

    function getBalance(address user) public view returns (uint256) {
        return balances[user];
    }
}
