// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleUsage {

    // 1. assertExample: проверяем, что _value не равен 0
    function assertExample(uint256 _value) public pure {
        assert(_value != 0);
    }

    // 2. revertExample: если _condition == false, revert с сообщением
    function revertExample(bool _condition) public pure {
        if (!_condition) {
            revert("Invalid condition");
        }
    }

    // 3. ifElseExample: добавляем ветку else
    function ifElseExample(uint256 _value) public pure returns (string memory) {
        if (_value > 10) {
            return "Value is greater than 10";
        } else {
            return "Value is 10 or less";
        }
    }

    // 4. elseIfExample: исправляем логические условия
    function elseIfExample(uint256 _value) public pure returns (string memory) {
        if (_value > 10) {
            return "Value is greater than 10";
        } else if (_value == 10) {
            return "Value is exactly 10";
        } else {
            return "Value is less than 10";
        }
    }

    // 5. ternaryExample: переписываем с использованием if-else
    function ternaryExample(uint256 _value) public pure returns (string memory) {
        if (_value > 10) {
            return "Value is greater than 10";
        } else {
            return "Value is 10 or less";
        }
    }
}
