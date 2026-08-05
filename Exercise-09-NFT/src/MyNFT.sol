// Exercise IX - Real Chain Interactions Using Cast
// Deploy an NFT contract, mint tokens, and read metadata all using terminal commands.

// Concepts You'll Master
// a. cast send
// b. cast call
// c. ownerOf

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyNFT {
    string public name = "MyNFT";
    string public symbol = "MNFT";

    mapping(uint256 => address) private owners;

    function mint(uint256 tokenId) public {
        require(owners[tokenId] == address(0), "Token already minted");

        owners[tokenId] = msg.sender;
    }

    function ownerOf(uint256 tokenId) public view returns (address) {
        require(owners[tokenId] != address(0), "Token does not exist");

        return owners[tokenId];
    }

    function tokenURI(uint256 tokenId) public pure returns (string memory) {
        tokenId; // silence warning
        return "https://example.com/metadata.json";
    }
}
