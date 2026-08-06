// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);

    function transfer(address to, uint256 amount) external returns (bool);
}

contract MainnetForkTest is Test {
    IERC20 usdc;

    // USDC Mainnet Contract
    address constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    // Example USDC-rich address
    address constant WHALE = 0x55FE002aefF02F77364de339a1292923A15844B8;

    address user = makeAddr("user");

    function setUp() public {
        vm.createSelectFork(vm.envString("MAINNET_RPC_URL"));

        usdc = IERC20(USDC);
    }

    function testImpersonateWhaleAndTransferUSDC() public {
        uint256 amount = 1000 * 1e6;

        uint256 beforeBalance = usdc.balanceOf(user);

        vm.startPrank(WHALE);

        usdc.transfer(user, amount);

        vm.stopPrank();

        uint256 afterBalance = usdc.balanceOf(user);

        assertEq(afterBalance, beforeBalance + amount);
    }
}

// Create a .env file in the root of Exercise-10-MainnetFork.
// touch .env
// Open it and add:
// MAINNET_RPC_URL=https://eth-mainnet.g.alchemy.com/v2/YOUR_API_KEY
// Replace YOUR_API_KEY with your actual Alchemy or Infura key.

// Export it in the terminal
// export MAINNET_RPC_URL="https://eth-mainnet.g.alchemy.com/v2/YOUR_API_KEY"
// Then run:
// forge test -vvvv
