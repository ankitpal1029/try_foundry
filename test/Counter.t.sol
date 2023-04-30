// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// tests deployed to 0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84
// this will be the deployer if test deploys contracts

// test functions have to be external or public to be picked up by forge

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
