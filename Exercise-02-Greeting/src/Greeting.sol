// Exercise II - Tools of the Trade – Cast, Anvil, Chisel
// Create a greeting contract where you can read and update the greeting using terminal commands, showing off Cast and Anvil in action.
// Concepts You'll Master
// a. Cast CLI read/write
// b. Anvil local chains
// c. Chisel REPL

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Greeting {
    string public greeting;

    constructor() {
        greeting = "Hello World";
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }
}
