// Exercise VIII - Solidity Deployment Scripts
// Deploy a voting contract where proposals can be added and voted on, using a Solidity script to automate deployment.

// Concepts You'll Master
// a. forge script
// b. forge create
// c. broadcasting

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        string name;
        uint256 voteCount;
    }

    Proposal[] public proposals;

    mapping(address => bool) public hasVoted;

    function addProposal(string memory _name) public {
        proposals.push(Proposal({name: _name, voteCount: 0}));
    }

    function vote(uint256 proposalIndex) public {
        require(!hasVoted[msg.sender], "Already voted");
        require(proposalIndex < proposals.length, "Invalid proposal");

        proposals[proposalIndex].voteCount++;
        hasVoted[msg.sender] = true;
    }

    function getProposal(
        uint256 index
    ) public view returns (string memory, uint256) {
        Proposal memory p = proposals[index];
        return (p.name, p.voteCount);
    }
}
