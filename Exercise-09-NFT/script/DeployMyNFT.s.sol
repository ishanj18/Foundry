// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/MyNFT.sol";

contract DeployMyNFT is Script {
    function run() public {
        vm.startBroadcast();

        new MyNFT();

        vm.stopBroadcast();
    }
}

// forge script script/DeployMyNFT.s.sol \
// --rpc-url http://127.0.0.1:8545 \
// --private-key YOUR_ANVIL_PRIVATE_KEY \
// --broadcast
// the deployed contract address.

// Mint NFT Using cast send
// Mint NFT #1:
// cast send CONTRACT_ADDRESS \
// "mint(uint256)" \
// 1 \
// --private-key YOUR_ANVIL_PRIVATE_KEY \
// --rpc-url http://127.0.0.1:8545
// This creates NFT #1.

// Check Owner Using cast call
// cast call CONTRACT_ADDRESS \
// "ownerOf(uint256)(address)" \
// 1 \
// --rpc-url http://127.0.0.1:8545

// Read NFT Name
// cast call CONTRACT_ADDRESS \
// "name()(string)" \
// --rpc-url http://127.0.0.1:8545

// Read NFT Symbol
// cast call CONTRACT_ADDRESS \
// "symbol()(string)" \
// --rpc-url http://127.0.0.1:8545

// Read Metadata
// cast call CONTRACT_ADDRESS \
// "tokenURI(uint256)(string)" \
// 1 \
// --rpc-url http://127.0.0.1:8545
