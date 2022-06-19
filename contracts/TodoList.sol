// SPDX-License-Identifier: MIT
pragma solidity >=0.5.16 <0.9.0;

contract TodoList {
    uint256 public taskCount = 0; // no of the todolist using state variables with intial value of 0.

    struct Task {
        uint256 id;
        string content;
        bool completed;
    }

    mapping(uint256 => Task) public tasks; // creating a database analogous to blockchain.

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    event TaskCompleted(
        uint id,
        bool completed
    );


    constructor() public {
        createTask("Checkout my app code on github");
    }

    function createTask(string memory _content) public {
        //function to create tasks
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
}
