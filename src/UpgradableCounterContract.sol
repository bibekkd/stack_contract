// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;


contract CounterContract {
    uint public totalCount = 0;
    address implementation;

    constructor(address _implementation) {
        implementation = _implementation;
    }

    function increase() public {
        implementation.delegatecall(msg.data);
    }

    function decrease() public {
        implementation.delegatecall(msg.data);
    }

    function increaseByTwo() public {
        implementation.delegatecall(msg.data);
    }

    function decreaseByTwo() public {
        implementation.delegatecall(msg.data);
    }

    function setImplementation(address _implementation) public {
        implementation = _implementation;
    }
}


contract CounterImplementationV1 {
    uint public totalCount = 0;

    function increase() public {
        totalCount += 1;
    }

    function decrease() public {
        totalCount -= 1;
    }
}


contract CounterImplementationV2 {
    uint public totalCount = 0;

    function increase() public {
        totalCount += 2;
    }

    function decrease() public {
        totalCount -= 2;
    }
}


contract CounterImplementationV3 {
    uint public totalCount = 0;

    function increase() public {
        totalCount += 1;
    }

    function decrease() public {
        totalCount -= 1;
    }

    function increaseByTwo() public {
        totalCount += 2;
    }

    function decreaseByTwo() public {
        totalCount -= 2;
    }
}


