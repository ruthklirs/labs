// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract simpleStorge {
    uint256 public num;

    function set(uint256 _num) public {
        num = _num;
    }

    function get() public view returns (uint256) {
        return num;
    }
}
