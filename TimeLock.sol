// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeLock {

    struct Deposit {
        uint256 amount;
        uint256 unlockTime;
    }

    mapping(address => Deposit) public deposits;

    function depositFunds(uint256 _lockTimeInSeconds) public payable {
        require(msg.value > 0, "Must send Ether");

        deposits[msg.sender] = Deposit({
            amount: msg.value,
            unlockTime: block.timestamp + _lockTimeInSeconds
        });
    }

    function withdraw() public {
        Deposit memory userDeposit = deposits[msg.sender];

        require(userDeposit.amount > 0, "No funds deposited");
        require(block.timestamp >= userDeposit.unlockTime, "Funds are still locked");

        uint256 amount = userDeposit.amount;

        deposits[msg.sender].amount = 0;

        (bool success, ) = payable(msg.sender).call{value: amount}("");
require(success, "Transfer failed");

    }

    function getDepositDetails() public view returns (uint256, uint256) {
        Deposit memory userDeposit = deposits[msg.sender];
        return (userDeposit.amount, userDeposit.unlockTime);
    }
}
