// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract StackContract is Ownable {
    uint public amount;
    address payable public stackingAddress;
    mapping (address => uint) stackBalances;

    constructor() Ownable(msg.sender) {
        stackingAddress = payable(msg.sender);
    }

    function stack(uint _amount) public onlyOwner payable {
        stackBalances[msg.sender] += _amount;
    }

    function unStack(uint _amount) public {
        uint totalStackBalance = stackBalances[msg.sender];
        require(totalStackBalance >= _amount);
        uint remainingBalance = stackBalances[msg.sender] - _amount;
        stackBalances[msg.sender] = remainingBalance;
    }
}