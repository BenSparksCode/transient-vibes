// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Base} from "./Base.sol";

abstract contract Core is Base {
    function setBalance(uint256 newBal) public {
        _setBalance(newBal);
    }

    function setAge(uint128 newAge) public {
        _setAge(newAge);
    }

    function setAccount(address newAccount) public {
        _setAccount(newAccount);
    }
}
