// Exercise IV - Fuzzing and Property Testing
// Implement a 1:1 token swap and validate it works for any valid input using fuzz tests.

// Concepts You'll Master
// a. Fuzz testing
// b. assume
// c. invariant testing

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./SimpleToken.sol";

contract TokenSwap {
    SimpleToken public tokenA;
    SimpleToken public tokenB;

    constructor(address _tokenA, address _tokenB) {
        tokenA = SimpleToken(_tokenA);
        tokenB = SimpleToken(_tokenB);
    }

    function swapAToB(uint256 amount) public {
        require(amount > 0, "Invalid amount");

        tokenA.transfer(msg.sender, address(this), amount);

        tokenB.transfer(address(this), msg.sender, amount);
    }
}
