// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract Storage {
    uint256 private _balance;
    uint128 private _age;
    address private _account;
    bytes32 private _data;

    function _setBalance(uint256 newBalance) internal {
        _balance = newBalance;
    }

    function getBalance() public view returns (uint256) {
        return _balance;
    }
}
