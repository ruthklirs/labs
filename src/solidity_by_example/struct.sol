// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Struct {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) public {
        todos.push(Todo(_text, false));
        todos.push(Todo({text: _text, completed: false}));
        Todo memory todo;
        todo.text = _text;
        todos.push(todo);
    }

    function get(uint256 i) public view returns (Todo memory) {
        return todos[i];
    }

    function update(uint256 i, string memory text) public {
        todos[i].text = text;
    }

    function completed(uint256 i) public {
        todos[i].completed = !todos[i].completed;
    }
}
