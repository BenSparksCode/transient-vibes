// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {TransientVibes} from "src/TransientVibes.sol";
import {NonTransientVibes} from "src/NonTransientVibes.sol";

import {Test, console} from "forge-std/Test.sol";

contract TransientVibesTest is Test {
    TransientVibes public transientVibes;
    NonTransientVibes public nonTransientVibes;

    function setUp() public {
        transientVibes = new TransientVibes();
        nonTransientVibes = new NonTransientVibes();
    }

    function test_tload_vs_sload() public {}

    function test_tstore_vs_sstore() public {}
}
