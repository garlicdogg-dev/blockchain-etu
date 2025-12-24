// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_03 {
    struct Person {
        string name;
        uint8 age;
    }

    Person[] public people; // Массив структур

    function addPerson(string memory _name, uint8 _age) external {
        people.push(Person(_name, _age)); // Добавление новой структуры в массив
    }
   
    function getUser(uint index) public view returns (string memory, uint8) {
        Person memory person = people[index];
        return (person.name, person.age);
    }

    // Новая функция: вычисление факториала числа n с помощью цикла while
    function generateFactorial(uint n) public pure returns (uint256) {
        require(n >= 0, "n must be non-negative");

        uint256 result = 1;
        uint256 i = 1;

        while (i <= n) {
            result *= i;
            i++;
        }

        return result;
    }
}
