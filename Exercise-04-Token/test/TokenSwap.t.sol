// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../src/SimpleToken.sol";

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
