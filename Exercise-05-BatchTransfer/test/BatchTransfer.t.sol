// Exercise V - Gas Reports & Optimization
// Send ETH to multiple users and optimize for low gas consumption. Benchmark improvements using Foundry gas tools.

// Concepts You'll Master
// a. Gas snapshots
// b. forge snapshot
// c. forge geiger
// d. optimizer settings

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/BatchTransfer.sol";

contract BatchTransferTest is Test {
    BatchTransfer batchTransfer;

    address user1 = address(1);
    address user2 = address(2);
    address user3 = address(3);

    function setUp() public {
        batchTransfer = new BatchTransfer();
    }

    function testBatchSend() public {
        address[] memory recipients = new address[](3);

        recipients[0] = user1;
        recipients[1] = user2;
        recipients[2] = user3;

        uint256[] memory amounts = new uint256[](3);

        amounts[0] = 1 ether;
        amounts[1] = 2 ether;
        amounts[2] = 3 ether;

        batchTransfer.batchSend{value: 6 ether}(recipients, amounts);

        assertEq(user1.balance, 1 ether);

        assertEq(user2.balance, 2 ether);

        assertEq(user3.balance, 3 ether);
    }
}
