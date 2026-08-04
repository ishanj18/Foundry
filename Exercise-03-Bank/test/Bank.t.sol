// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Bank.sol";

contract BankTest is Test {
    Bank bank;

    address user = address(1);

    function setUp() public {
        bank = new Bank();

        // Give user 10 ETH for testing
        vm.deal(user, 10 ether);
    }

    function testDeposit() public {
        vm.prank(user);

        bank.deposit{value: 2 ether}();

        assertEq(bank.balances(user), 2 ether);
    }

    function testWithdraw() public {
        vm.startPrank(user);

        bank.deposit{value: 5 ether}();

        bank.withdraw(2 ether);

        assertEq(bank.balances(user), 3 ether);

        vm.stopPrank();
    }

    function testWithdrawEntireBalance() public {
        vm.startPrank(user);

        bank.deposit{value: 5 ether}();

        bank.withdraw(5 ether);

        assertEq(bank.balances(user), 0);

        vm.stopPrank();
    }

    function testRevertWhenWithdrawWithoutDeposit() public {
        vm.prank(user);

        vm.expectRevert("Insufficient balance");

        bank.withdraw(1 ether);
    }

    function testRevertWhenWithdrawMoreThanBalance() public {
        vm.startPrank(user);

        bank.deposit{value: 1 ether}();

        vm.expectRevert("Insufficient balance");

        bank.withdraw(5 ether);

        vm.stopPrank();
    }

    function testRevertWhenDepositZero() public {
        vm.prank(user);

        vm.expectRevert("Deposit amount must be greater than 0");

        bank.deposit{value: 0}();
    }
}
