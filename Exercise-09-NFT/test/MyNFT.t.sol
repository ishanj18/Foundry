// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/MyNFT.sol";

contract MyNFTTest is Test {
    MyNFT nft;

    address alice = address(1);

    function setUp() public {
        nft = new MyNFT();
    }

    function testMint() public {
        vm.prank(alice);

        nft.mint(1);

        assertEq(nft.ownerOf(1), alice);
    }

    function testCannotMintTwice() public {
        vm.startPrank(alice);

        nft.mint(1);

        vm.expectRevert("Token already minted");

        nft.mint(1);

        vm.stopPrank();
    }
}
