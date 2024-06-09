// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Primitives{
    bool public boo = true;
    uint8 public u8 = 1;
    uint256 public u256=456;
    uint256 public uin256=123;

    //negative
    int8 public =-1;
    int uint256 public u256=456;
    int uint256 public uin256=123;

    //min and max of int - negative numbers
    int256 = public minInt type(int256).min;
    int256 = public maxInt type(int256).max;

    address public addr1 = address(123);

     bytes1 a = 0xb5; //  [10110101]
     bytes1 b = 0x56; //  [01010110]

    //defult var - 0
     bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}