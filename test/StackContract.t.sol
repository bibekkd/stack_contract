// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/StakeContract.sol";

contract TestContract is Test {
    StakeContract c;

    function setUp() public {
        c = new StakeContract();
    }

    function testStack() public {
        uint value = 10 ether;
        c.stack{value: value}(value);
        assert(c.totalStake() == value);
    }

    function testFailStake() public {
        uint value = 10 ether;
        c.stack(value);
        assert(c.totalStake() == value);
    }

    function testUnstake() public {
        uint value = 10 ether;
        vm.startPrank(0x1028303967f763912C539A14919F29f5DFAfFEBC);
        vm.deal(0x1028303967f763912C539A14919F29f5DFAfFEBC, value);
        c.stack{value: value}(value);
        c.unStack(value);
        assert(c.totalStake() == 0);
    }
}
