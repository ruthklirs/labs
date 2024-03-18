pragma solidity ^0.8.0;

contract AssemblyExample {
    uint256 public storedData;

    function manipulateData(uint256 value1, uint256 value2) public {
        // MSTORE: Store value1 at memory location 0x00
        assembly {
            mstore(0x00, value1)
        }

        // MLOAD: Load value1 from memory location 0x00
        assembly {
            storedData := mload(0x00)
        }

        // PUSH [1 - 32]: Push 1 onto the stack
        assembly {
            push 1
        }

        // ADD: Add value1 to value2
        assembly {
            add
        }

        // LT: Compare value1 and value2
        bool isLessThan;
        assembly {
            lt
            isLessThan := mload(0x00)
        }

        // SSTORE: Store comparison result in storage
        assembly {
            sstore(0x00, isLessThan)
        }

        // SLOAD: Load comparison result from storage
        assembly {
            isLessThan := sload(0x00)
        }
    }
}
