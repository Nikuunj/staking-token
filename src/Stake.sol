// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract StakeContract { 

    uint public totalBalance;
    mapping (address => uint) public stakes;

    constructor() {

    }

    function stake() public payable{
        require(msg.value > 0);
        stakes[msg.sender] += msg.value;
        totalBalance += msg.value;
    }

    function unstake(uint _amount) public {
        require(stakes[msg.sender] >= _amount);
        totalBalance -= _amount;
        payable(msg.sender).transfer(_amount);
        stakes[msg.sender] -= _amount;
    }
}
