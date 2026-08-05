// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Auction.sol";

contract AuctionTest is Test {
    Auction auction;

    address alice = address(1);
    address bob = address(2);

    event NewBid(address bidder, uint256 amount);

    event AuctionEnded(address winner, uint256 amount);

    function setUp() public {
        auction = new Auction(7 days);

        vm.deal(alice, 10 ether);
        vm.deal(bob, 10 ether);
    }

    function testPlaceBid() public {
        vm.prank(alice);

        auction.bid{value: 1 ether}();

        assertEq(auction.highestBidder(), alice);

        assertEq(auction.highestBid(), 1 ether);
    }

    function testExpectEmit() public {
        vm.prank(alice);

        vm.expectEmit(true, false, false, true);

        emit NewBid(alice, 1 ether);

        auction.bid{value: 1 ether}();
    }

    function testCannotBidAfterAuctionEnds() public {
        vm.warp(block.timestamp + 8 days);

        vm.prank(alice);

        vm.expectRevert("Auction ended");

        auction.bid{value: 1 ether}();
    }

    function testEndAuction() public {
        vm.prank(alice);
        auction.bid{value: 1 ether}();

        vm.warp(block.timestamp + 8 days);

        vm.expectEmit(true, false, false, true);

        emit AuctionEnded(alice, 1 ether);

        auction.endAuction();

        assertTrue(auction.ended());
    }
}
