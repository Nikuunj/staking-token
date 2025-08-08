// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract StakeContract { 

    uint public totalBalance;
    mapping (address => uint) public stakes;
    address public implementation;

    constructor(address _implementation) {
        implementation = _implementation;
    }
    
    fallback() external payable {
        (bool success, ) = implementation.delegatecall(msg.data);
        require(success, "Delegatecall failed");
    }

    function setImplementation(address _implementation) public {
        implementation = _implementation;
    }
}
