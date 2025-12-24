// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_06 {
    uint256 public constant MAX_UINT = type(uint256).max;
    
    function getMaxUint256() external pure returns (uint256) {
        return MAX_UINT;
    }

    function getMaxUint8() external pure returns (uint8) {
        return type(uint8).max;
    }

    // Массив 7 цветов радуги
    string[7] private rainbowColors = [
        "Red",
        "Orange",
        "Yellow",
        "Green",
        "Blue",
        "Indigo",
        "Violet"
    ];

    // Функция возвращает все цвета радуги
    function getRainbowColors() external view returns (string[7] memory) {
        return rainbowColors;
    }
}
