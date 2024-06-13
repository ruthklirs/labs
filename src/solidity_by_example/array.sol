// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Array {
    int256[] public arr;
    uint256[] public initializedArray = [1, 2, 3, 4];
    int256[5] public certainSizeArray;

    function get(uint256 i) public view returns(int256){
        return arr[i];
    }

    
    function getArr() external view returns(int256[] memory){
        return arr;
        
    }
}
