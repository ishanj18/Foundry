// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Voting.sol";

contract VotingTest is Test {
    Voting voting;

    address user1 = address(1);

    function setUp() public {
        voting = new Voting();

        voting.addProposal("Proposal A");
        voting.addProposal("Proposal B");
    }

    function testAddProposal() public view {
        (string memory name, ) = voting.getProposal(0);

        assertEq(name, "Proposal A");
    }

    function testVote() public {
        vm.prank(user1);

        voting.vote(0);

        (, uint256 votes) = voting.getProposal(0);

        assertEq(votes, 1);
    }

    function testCannotVoteTwice() public {
        vm.startPrank(user1);

        voting.vote(0);

        vm.expectRevert("Already voted");

        voting.vote(1);

        vm.stopPrank();
    }
}
