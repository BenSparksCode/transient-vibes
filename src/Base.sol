// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

abstract contract Base {
    // ------------------------------------------------------ //
    //                     VIRTUAL GETTERS                    //
    // ------------------------------------------------------ //

    function getBalance() public view virtual returns (uint256);

    function getAge() public view virtual returns (uint128);

    function getAccount() public view virtual returns (address);

    // ------------------------------------------------------ //
    //                      VIRTUAL SETTERS                   //
    // ------------------------------------------------------ //

    function _setBalance(uint256 newBalance) internal virtual;

    function _setAge(uint128 newAge) internal virtual;

    function _setAccount(address newAccount) internal virtual;
}
