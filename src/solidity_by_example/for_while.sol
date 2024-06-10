// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Loop {
    function forLoop() public {
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                continue;
            }
            if (i == 5) {
                break;
            }
        }
    }

    function whileLoop(uint256 i) public {
        while (i < 5) {
            i++;
        }
    }
}
