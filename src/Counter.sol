// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;

    error TooBigNumber();

    function setNumber(uint256 newNumber) public {
        require(newNumber < 10, "Counter: new number is too big");
        number = newNumber;
    }

    function setNumberBis(uint256 newNumber) public {
        if(newNumber >= 10){
            revert TooBigNumber();
        }
        number = newNumber;
    }
}
