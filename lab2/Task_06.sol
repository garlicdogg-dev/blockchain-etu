// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_02 {
    uint[] public dynamicArray; // Динамический массив
    uint[5] public fixedArray;  // Фиксированный массив из 5 элементов

    function addToDynamicArray(uint _value) external {
        dynamicArray.push(_value); // Добавление элемента в динамический массив
    }

    function sumArray() public view returns (uint) {
        uint sum = 0;

        for (uint i = 0; i < dynamicArray.length; i++) {
            sum += dynamicArray[i];
        }

        return sum;
    }

    // Новая функция: генерация массива квадратов чисел от 1 до n
    function generateSquares(uint n) public pure returns (uint[] memory) {
        uint[] memory squares = new uint[](n);

        for (uint i = 0; i < n; i++) {
            squares[i] = (i + 1) * (i + 1);
        }

        return squares;
    }
}
