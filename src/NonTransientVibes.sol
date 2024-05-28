// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Core} from "./Core.sol";

contract NonTransientVibes is Core {
    uint256 private _balance;
    uint128 private _age;
    address private _account;

    // ------------------------------------------------------ //
    //        PUBLIC VIEW FUNCTIONS - STORAGE VARS            //
    // ------------------------------------------------------ //

    function getBalance() public view override returns (uint256) {
        return _balance;
    }

    function getAge() public view override returns (uint128) {
        return _age;
    }

    function getAccount() public view override returns (address) {
        return _account;
    }

    // ------------------------------------------------------ //
    //       INTERNAL WRITE FUNCTIONS - STORAGE VARS          //
    // ------------------------------------------------------ //

    function _setBalance(uint256 newBalance) internal override {
        _balance = newBalance;
    }

    function _setAge(uint128 newAge) internal override {
        _age = newAge;
    }

    function _setAccount(address newAccount) internal override {
        _account = newAccount;
    }
}
