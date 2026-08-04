// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Greeting} from "../src/Greeting.sol";

contract GreetingTest is Test {
    Greeting greeting;

    function setUp() public {
        greeting = new Greeting();
    }

    function testInitialGreeting() public view {
        assertEq(greeting.greeting(), "Hello World");
    }

    function testUpdateGreeting() public {
        greeting.setGreeting("Hello Foundry");

        assertEq(greeting.greeting(), "Hello Foundry");
    }
}

// For local ethereum:-
// use anvil
