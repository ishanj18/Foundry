// Exercise VI - Time Travel & Events in Tests
// Create a simple auction contract where users bid and settle based on time. Use cheatcodes to simulate time and events.

// Concepts You'll Master
// a. vm.warp
// b. vm.expectEmit
// c. event logs
// d. time-based logic

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Auction {
    address public highestBidder;
    uint256 public highestBid;
    uint256 public endTime;
    bool public ended;

    event NewBid(address bidder, uint256 amount);

    event AuctionEnded(address winner, uint256 amount);

    constructor(uint256 duration) {
        endTime = block.timestamp + duration;
    }

    function bid() external payable {
        require(block.timestamp < endTime, "Auction ended");

        require(msg.value > highestBid, "Bid too low");

        highestBidder = msg.sender;
        highestBid = msg.value;

        emit NewBid(msg.sender, msg.value);
    }

    function endAuction() external {
        require(block.timestamp >= endTime, "Auction not ended");

        require(!ended, "Already ended");

        ended = true;

        emit AuctionEnded(highestBidder, highestBid);
    }
}
