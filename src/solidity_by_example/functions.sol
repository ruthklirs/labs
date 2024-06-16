// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Functions {
    function func1(uint256 i) public view returns (uint256, bool) {
        return (i + 5, false);
    }

    function func2(uint256 i) public view returns (uint256 x, bool b) {
        return (i + 5, false);
    }

    function func3(uint256 i) public view returns (uint256 x, bool b) {
        x = i + 5;
        b = true;
    }
}
