// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Mapping {
    mapping(address => uint256) public myMap;

    function remove(address addr) public {
        delete myMap[addr];
    }

    function get(address addr) public returns (uint256) {
        return myMap[addr];
    }

    function set(address addr, uint256 x) public {
        myMap[addr] = x;
    }
}

contract Nested {
    mapping(address => mapping(uint256 => bool)) public myMap;

    function remove(address addr, uint256 i) public {
        delete myMap[addr][i];
    }

    function get(address addr, uint256 i) public returns (bool) {
        return myMap[addr][i];
    }

    function set(address addr, uint256 i, bool boo) public {
        myMap[addr][i] = boo;
    }
}
