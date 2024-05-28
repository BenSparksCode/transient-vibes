// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Core} from "./Core.sol";

contract TransientVibes is Core {
    bytes32 private constant _BALANCE_SLOT = keccak256("_balance");
    bytes32 private constant _AGE_SLOT = keccak256("_age");
    bytes32 private constant _ACCOUNT_SLOT = keccak256("_account");

    // ------------------------------------------------------ //
    //        PUBLIC VIEW FUNCTIONS - TRANSIENT VARS          //
    // ------------------------------------------------------ //

    function getBalance() public view override returns (uint256) {
        return uint256(_tload(_BALANCE_SLOT));
    }

    function getAge() public view override returns (uint128) {
        return uint128(uint256(_tload(_AGE_SLOT)));
    }

    function getAccount() public view override returns (address) {
        return address(bytes20(_tload(_ACCOUNT_SLOT)));
    }

    // ------------------------------------------------------ //
    //       INTERNAL WRITE FUNCTIONS - TRANSIENT VARS        //
    // ------------------------------------------------------ //

    function _setBalance(uint256 newBalance) internal override {
        _tstore(_BALANCE_SLOT, bytes32(newBalance));
    }

    function _setAge(uint128 newAge) internal override {
        _tstore(_AGE_SLOT, bytes32(uint256(newAge)));
    }

    function _setAccount(address newAccount) internal override {
        _tstore(_ACCOUNT_SLOT, bytes32(bytes20(newAccount)));
    }

    // ------------------------------------------------------ //
    //                  TSTORE / TLOAD HELPERS                //
    // ------------------------------------------------------ //

    function _tstore(bytes32 slot, bytes32 value) private {
        assembly {
            tstore(slot, value)
        }
    }

    function _tload(bytes32 slot) private view returns (bytes32) {
        bytes32 value;
        assembly {
            value := tload(slot)
        }
        return value;
    }
}
