// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Enum {
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status;

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    function reset() public {
        delete status;
    }

    function cancel() public {
        status = Status.Canceled;
    }
}
