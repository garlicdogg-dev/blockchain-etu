// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_09 {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Пример 3: Работа с фиксированным массивом байтов
    function getFixedByteArraySum(bytes1[4] memory _data) public pure returns (uint8) {
        uint8 sum = 0;
        for (uint8 i = 0; i < _data.length; i++) {
            sum += uint8(_data[i]);
        }
        return sum;
    }

    function getFixedByteArrayAverage(bytes1[4] memory _data) public pure returns (uint8) {
        uint16 sum = 0;
        for (uint8 i = 0; i < _data.length; i++) {
            sum += uint8(_data[i]);
        }
        return uint8(sum / _data.length);
    }

    // --- Новый функционал для пользователей ---
    struct User {
        uint256 id;
        string name;
    }

    User[] public users;

    // События
    event UserAdded(uint256 indexed userId, string message);
    event UserRemoved(uint256 indexed userId, string message);

    // Добавление пользователя
    function addUser(string memory _name) external {
        uint256 userId = users.length;
        users.push(User(userId, _name));
        emit UserAdded(userId, "User was added");
    }

    // Удаление последнего пользователя (пример)
    function removeLastUser() external {
        require(users.length > 0, "No users to remove");
        uint256 userId = users[users.length - 1].id;
        users.pop();
        emit UserRemoved(userId, "User was removed");
    }

    // Получить пользователя по индексу
    function getUser(uint256 index) external view returns (uint256, string memory) {
        require(index < users.length, "Index out of bounds");
        User memory user = users[index];
        return (user.id, user.name);
    }

    // Получить количество пользователей
    function getUserCount() external view returns (uint256) {
        return users.length;
    }
}
