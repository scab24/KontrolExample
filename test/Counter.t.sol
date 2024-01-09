// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";
import "kontrol-cheatcodes/KontrolCheats.sol";

contract CounterTest is Test, KontrolCheats {
   Counter public counter;

   function setUp() public {
       counter = new Counter();
       counter.setNumber(0, false);
   }

   function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

   function testSetNumber(uint256 x, bool inLuck) public {
       kevm.infiniteGas();
       counter.setNumber(x, inLuck);
       assertEq(counter.number(), x);
   }
}