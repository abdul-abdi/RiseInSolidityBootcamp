// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


contract Example {


    address owner;
    address user;


    struct Counter {
        uint number;
        string description;
    }


    Counter counter;


    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can increment or decrement the counter");
        _;
    }

    // modifier onlyUser() {
    //     require(msg.sender == user, "Only user can call this function");
    //     _;
    // }


    constructor(uint initial_value, string memory description) {
        owner = msg.sender;
        counter = Counter(initial_value, description);
    }


    function increment_counter() external  onlyOwner {
        counter.number += 1;
    }


    function decrement_counter() external  onlyOwner {
        counter.number -= 1;
    }

    // function change_description(string memory newDescription) public onlyUser {
    //     counter.description = newDescription;
    // }


    function get_counter_value() external  view returns(uint) {
        return counter.number;
    }

    function get_description() public view returns(string memory){
        return counter.description;
    }
}
