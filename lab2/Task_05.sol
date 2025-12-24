// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_05 {
    enum Status {
        Pending,
        Active,
        Inactive
    }

    Status public currentStatus; // Переменная типа Status

    uint[] public temperaturesC; // Массив температур в градусах Цельсия

    function setStatus(Status _status) external {
        currentStatus = _status; // Установка текущего статуса
    }

    function getBalance() public view returns (uint) {
        return uint(currentStatus);
    }

    // Функция для добавления температуры в массив
    function addTemperature(uint _tempC) external {
        temperaturesC.push(_tempC);
    }

    // Функция для конвертации массива температур в Фаренгейты
    function convertToFahrenheit(uint[] memory tempsC) public pure returns (uint[] memory) {
        uint[] memory tempsF = new uint[](tempsC.length);
        for (uint i = 0; i < tempsC.length; i++) {
            tempsF[i] = (tempsC[i] * 9) / 5 + 32; // Формула перевода °C → °F
        }
        return tempsF;
    }

    // Функция для конвертации всех температур, хранящихся в storage
    function convertStoredTemperatures() public view returns (uint[] memory) {
        return convertToFahrenheit(temperaturesC);
    }
}
