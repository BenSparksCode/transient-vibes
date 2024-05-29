// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {TransientVibes} from "src/TransientVibes.sol";
import {NonTransientVibes} from "src/NonTransientVibes.sol";

import {Test, console} from "forge-std/Test.sol";

contract TransientVibesTest is Test {
    TransientVibes public transientVibes;
    NonTransientVibes public nonTransientVibes;
    Spammer public spammer;

    function setUp() public {
        transientVibes = new TransientVibes();
        nonTransientVibes = new NonTransientVibes();
        spammer = new Spammer();
    }

    function test_tstore_x1() public {
        uint256 iterations = 1;
        bytes memory callData = abi.encodeCall(transientVibes.setBalance, 1);
        spammer.spam(address(transientVibes), callData, iterations);
    }

    function test_tstore_x10() public {
        uint256 iterations = 10;
        bytes memory callData = abi.encodeCall(transientVibes.setBalance, 1);
        spammer.spam(address(transientVibes), callData, iterations);
    }

    function test_tstore_x100() public {
        uint256 iterations = 100;
        bytes memory callData = abi.encodeCall(transientVibes.setBalance, 1);
        spammer.spam(address(transientVibes), callData, iterations);
    }

    function test_sstore_x1() public {
        uint256 iterations = 1;
        bytes memory callData = abi.encodeCall(nonTransientVibes.setBalance, 1);
        spammer.spam(address(nonTransientVibes), callData, iterations);
    }

    function test_sstore_x10() public {
        uint256 iterations = 10;
        bytes memory callData = abi.encodeCall(nonTransientVibes.setBalance, 1);
        spammer.spam(address(nonTransientVibes), callData, iterations);
    }

    function test_sstore_x100() public {
        uint256 iterations = 100;
        bytes memory callData = abi.encodeCall(nonTransientVibes.setBalance, 1);
        spammer.spam(address(nonTransientVibes), callData, iterations);
    }

    function test_tload_x1() public {
        uint256 iterations = 1;
        bytes memory callData = abi.encodeWithSelector(transientVibes.getBalance.selector);
        spammer.spam(address(transientVibes), callData, iterations);
    }

    function test_tload_x10() public {
        uint256 iterations = 10;
        bytes memory callData = abi.encodeWithSelector(transientVibes.getBalance.selector);
        spammer.spam(address(transientVibes), callData, iterations);
    }

    function test_tload_x100() public {
        uint256 iterations = 100;
        bytes memory callData = abi.encodeWithSelector(transientVibes.getBalance.selector);
        spammer.spam(address(transientVibes), callData, iterations);
    }

    function test_sload_x1() public {
        uint256 iterations = 1;
        bytes memory callData = abi.encodeWithSelector(nonTransientVibes.getBalance.selector);
        spammer.spam(address(nonTransientVibes), callData, iterations);
    }

    function test_sload_x10() public {
        uint256 iterations = 10;
        bytes memory callData = abi.encodeWithSelector(nonTransientVibes.getBalance.selector);
        spammer.spam(address(nonTransientVibes), callData, iterations);
    }

    function test_sload_x100() public {
        uint256 iterations = 100;
        bytes memory callData = abi.encodeWithSelector(nonTransientVibes.getBalance.selector);
        spammer.spam(address(nonTransientVibes), callData, iterations);
    }

    function test_transientStorageDoesNotPersistAcrossTxs() public {
        assertEq(transientVibes.getBalance(), 0);
        transientVibes.setBalance(100);
        assertEq(transientVibes.getBalance(), 0);
    }

    function test_normalStorageDoesPersistAcrossTxs() public {
        assertEq(nonTransientVibes.getBalance(), 0);
        nonTransientVibes.setBalance(100);
        assertEq(nonTransientVibes.getBalance(), 100);
    }
}

// Calls target function on a target contract n amount of times
contract Spammer {
    function spam(address target, bytes calldata data, uint256 n) public {
        for (uint256 i = 0; i < n; ++i) {
            (bool success,) = target.call(data);
            require(success, "Spammer: call failed");
        }
    }
}
