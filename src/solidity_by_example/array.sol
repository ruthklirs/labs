// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Array {
    int256[] public arr;
    uint256[] public initializedArray = [1, 2, 3, 4];
    int256[5] public certainSizeArray;

    function get(uint256 i) public view returns (int256) {
        return arr[i];
    }

    function getArr() external view returns (int256[] memory) {
        return arr;
    }

    function push(int256 i) public {
        arr.push(i);
    }

    function pop() public {
        arr.pop();
    }

    function remove(uint256 i) public {
        delete arr[i];
    }

    function getLengthArr() public view returns (uint256) {
        return arr.length;
    }

    function memoryArray() external {
        uint256[] memory tempArr = new uint256[](5);
    }
}
