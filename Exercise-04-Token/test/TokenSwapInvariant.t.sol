// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

import "../src/SimpleToken.sol";
import "../src/TokenSwap.sol";

contract TokenSwapInvariantTest is Test {
    SimpleToken tokenA;
    SimpleToken tokenB;
    TokenSwap swap;

    address user = address(1);

    function setUp() public {
        tokenA = new SimpleToken();
        tokenB = new SimpleToken();

        swap = new TokenSwap(address(tokenA), address(tokenB));

        tokenA.mint(user, 1000);
        tokenB.mint(address(swap), 1000);

        targetContract(address(swap));
    }

    function invariant_TotalSupplyPreserved() public view {
        uint256 totalA = tokenA.balanceOf(user) +
            tokenA.balanceOf(address(swap));

        uint256 totalB = tokenB.balanceOf(user) +
            tokenB.balanceOf(address(swap));

        assertEq(totalA, 1000);
        assertEq(totalB, 1000);
    }
}
