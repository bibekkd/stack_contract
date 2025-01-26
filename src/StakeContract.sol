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

contract StakeContract {
    mapping (address => uint) stakeBalances;
    uint public totalStake;

    constructor() {
    }

    function stack(uint _amount) public payable {
        require(_amount > 0);
        require(_amount == msg.value);
        stakeBalances[msg.sender] += _amount;
        totalStake += _amount;
    }

    function unStack(uint _amount) public {
        uint ownerTotalStackedBalance = stakeBalances[msg.sender];
        require(ownerTotalStackedBalance >= _amount);
        payable(msg.sender).transfer(_amount / 2);
        stakeBalances[msg.sender] -= _amount;
        totalStake -= _amount;
    }
}