// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// tests deployed to 0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84
// this will be the deployer if test deploys contracts

// test functions have to be external or public to be picked up by forge

import "forge-std/Test.sol";
import "../src/EmitContract.sol";

contract EmitContractTest is Test {
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function test_EmitContract() public {
        EmitContract emitter = new EmitContract();

        // 4 topics allowed in emit, 1st 2nd are checked here
        // last data topic is checked because 3rd indexed topic doesn't exist
        vm.expectEmit(true, true, false, true);
        emit Transfer(address(this), address(1337), 1337);
        emitter.t();
    }

    function test_EmitContract_DoNotCheckData() public {
        EmitContract emitter = new EmitContract();

        // 4 topics allowed in emit, 1st 2nd are checked here
        // last data topic is checked because 3rd indexed topic doesn't exist
        vm.expectEmit(true, true, false, false);
        emit Transfer(address(this), address(1337), 1338);
        emitter.t();
    }
}
