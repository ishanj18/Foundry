// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/Voting.sol";

contract DeployVoting is Script {
    function run() public {
        vm.startBroadcast();

        Voting voting = new Voting();

        voting.addProposal("Proposal A");
        voting.addProposal("Proposal B");
        voting.addProposal("Proposal C");

        vm.stopBroadcast();
    }
}

// Broadcast Deployment
// Copy one of Anvil's private keys and run:
// forge script script/DeployVoting.s.sol \
// --rpc-url http://127.0.0.1:8545 \
// --private-key YOUR_PRIVATE_KEY \
// --broadcast

// forge script
// forge script script/DeployVoting.s.sol
// Runs the deployment script.

// forge create
// You could deploy the contract directly with:
// forge create src/Voting.sol:Voting \
// --rpc-url http://127.0.0.1:8545 \
// --private-key YOUR_PRIVATE_KEY
