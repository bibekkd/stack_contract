// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract ProxyContract {
    address public implementation;

    constructor(address _implementation) {
        implementation = _implementation;
    }

    fallback() external { 
        (bool success, ) = implementation.delegatecall(msg.data);
        require(success, "Delegatecall failed");
    }
}