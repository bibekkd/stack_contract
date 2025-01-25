// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract StackContract is Ownable {
    mapping (address => uint) stackBalances;
    uint public totalStack;

    constructor() Ownable(msg.sender) {
    }

    function stack() public onlyOwner payable {
        require(msg.value > 0);
        stackBalances[msg.sender] += msg.value;
        totalStack += msg.value;
    }

    function unStack(uint _amount) public {
        uint ownerTotalStackedBalance = stackBalances[msg.sender];
        require(ownerTotalStackedBalance >= _amount);
        payable(msg.sender).transfer(_amount);
        stackBalances[msg.sender] -= _amount;
        totalStack -= _amount;
    }
}