// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BatchTransfer {
    function batchSend(
        address[] calldata recipients,
        uint256[] calldata amounts
    ) external payable {
        require(recipients.length == amounts.length, "Length mismatch");

        uint256 total;

        for (uint256 i = 0; i < amounts.length; i++) {
            total += amounts[i];
        }

        require(msg.value == total, "Incorrect ETH sent");

        // for (uint256 i = 0; i < recipients.length; i++) {
        //     (bool success, ) = payable(recipients[i]).call{value: amounts[i]}(
        //         ""
        //     );
        //     require(success, "ETH transfer failed");
        // }

        //       Generate Gas Snapshot
        // forge snapshot

        //Optimized Version

        uint256 length = recipients.length;

        for (uint256 i; i < length; ) {
            (bool success, ) = payable(recipients[i]).call{value: amounts[i]}(
                ""
            );

            require(success, "ETH transfer failed");

            unchecked {
                ++i;
            }
        }

        //Instead of repeatedly reading:
        // recipients.length
        // the length is stored once.
        // And:
        // unchecked {
        //     ++i;
        // }
        // avoids overflow checks.
        // Less gas is used.
    }
}

// Check for Risky Patterns
// Run:
// forge geiger
