// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SavingWallet {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Not owner");
        require(address(this).balance >= _amount, "Insufficient balance");
        payable(owner).transfer(_amount);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
