// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Mapping} from "../src/Mapping.sol";

contract MappingTest is Test {
    Mapping map;

    function setUp() public {
        map = new Mapping();
    }

    function test_Mapping() public {
        map.set("abc", 10);
        console.log("Map get abc", map.get("abc"));
        assertEq(map.get("abc"), 9, "abc != 10");
        // assert(map.get("abc") == 9);
    }
}
