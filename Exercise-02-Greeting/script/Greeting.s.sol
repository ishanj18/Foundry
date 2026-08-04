// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {Greeting} from "../src/Greeting.sol";

contract DeployGreeting is Script {
    function run() public {
        vm.startBroadcast();

        new Greeting();

        vm.stopBroadcast();
    }
}

// To Deploy:-
// forge script script/DeployGreeting.s.sol \
// --rpc-url http://127.0.0.1:8545 \
// --private-key <PRIVATE_KEY> \
// --broadcast

// Read Greeting Using Cast:-
// cast call CONTRACT_ADDRESS \
// "greeting()(string)" \
// --rpc-url http://127.0.0.1:8545

// Update Greeting Using Cast:-
// cast send CONTRACT_ADDRESS \
// "setGreeting(string)" \
// "Hello Foundry" \
// --private-key PRIVATE_KEY \
// --rpc-url http://127.0.0.1:8545

// Read Again:-
// cast call CONTRACT_ADDRESS \
// "greeting()(string)" \
// --rpc-url http://127.0.0.1:8545
