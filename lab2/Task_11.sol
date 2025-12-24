// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_11 {
    address public owner;
    uint256 public totalUserDeposits;
    uint256 public targetAmount; // целевая сумма, после достижения которой контракт закрывается

    enum Status { Open, Closed }
    Status public contractStatus;

    mapping(address => uint256) public userBalances;

    // События
    event Deposited(address indexed user, uint256 amount, uint256 totalDeposits);
    event Withdrawn(address indexed user, uint256 amount, uint256 totalDeposits);
    event ContractClosed(uint256 totalDeposits);

    constructor(uint256 _targetAmount) {
        owner = msg.sender;
        contractStatus = Status.Open;
        targetAmount = _targetAmount;
    }

    // Модификатор: только владелец
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // Модификатор: контракт закрыт
    modifier whenClosed() {
        require(contractStatus == Status.Closed, "Contract is not closed");
        _;
    }

    // Функция перевода средств
    function deposit() external payable {
        require(contractStatus == Status.Open, "Contract is closed");
        require(msg.value > 0, "Deposit must be greater than zero");

        userBalances[msg.sender] += msg.value;
        totalUserDeposits += msg.value;

        emit Deposited(msg.sender, msg.value, totalUserDeposits);

        if (totalUserDeposits >= targetAmount) {
            contractStatus = Status.Closed;
            emit ContractClosed(totalUserDeposits);
        }
    }

    function withdraw(uint256 amount) external {
        require(contractStatus == Status.Open, "Contract is closed, withdrawals not allowed");
        require(userBalances[msg.sender] >= amount, "Insufficient balance");

        userBalances[msg.sender] -= amount;
        totalUserDeposits -= amount;

        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");

        emit Withdrawn(msg.sender, amount, totalUserDeposits);
    }


    // Только владелец может забрать оставшиеся средства, когда контракт закрыт
    function ownerWithdraw() external onlyOwner whenClosed {
        uint256 balance = address(this).balance;

        (bool sent, ) = owner.call{value: balance}("");
        require(sent, "Failed to send Ether");
    }

}
