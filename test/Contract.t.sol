// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Stake.sol";

contract TestContract is Test {
    StakeContract c;

    function setUp() public {
        c = new StakeContract();
    }

    function testStake() public {

    }

    function testUnstake() public {
        uint value = 10 ether;
        vm.deal(0x03Ff46a0573c22eFe805FD8DA1537d67a76d82Ae, value);
        vm.startPrank(0x03Ff46a0573c22eFe805FD8DA1537d67a76d82Ae);
        c.stake{value : value}();
        c.unstake(value);
        assert(c.totalBalance() == 0);
    }
}
