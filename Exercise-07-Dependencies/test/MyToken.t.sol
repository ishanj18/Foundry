// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/MyToken.sol";

contract MyTokenTest is Test {
    MyToken token;

    address alice = address(1);

    function setUp() public {
        token = new MyToken();
    }

    function testMint() public {
        token.mint(alice, 1000);

        assertEq(token.balanceOf(alice), 1000);
    }

    function testOnlyOwnerCanMint() public {
        vm.prank(alice);

        vm.expectRevert();

        token.mint(alice, 1000);
    }
}
