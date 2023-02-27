// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../lib/forge-std/src/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    error TooBigNumber();

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function testSetNumber(uint256 x) public {
        if(x >= 10) {
            vm.expectRevert("Counter: new number is too big");
            counter.setNumber(x);
            return;
        }
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testSetNumberBis(uint256 x) public {
        if(x >= 10) {
            vm.expectRevert(abi.encodeWithSelector(TooBigNumber.selector));
            counter.setNumberBis(x);
            return;
        }
        else {
            counter.setNumberBis(x);
            assertEq(counter.number(), x);
        }
    }

    function testSetNumberSpecific() public {
        counter.setNumber(9);
        assertEq(counter.number(), 9);
    }

    function testSetNumberSpecificFail() public {
        vm.expectRevert("Counter: new number is too big");
        counter.setNumber(42);
    }

    function testSetNumberBisSpecific() public {
        counter.setNumberBis(9);
        assertEq(counter.number(), 9);
    }

    function testSetNumberBisSpecificFail() public {
        vm.expectRevert(abi.encodeWithSelector(TooBigNumber.selector));
        counter.setNumberBis(42);
    }

}
