// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Mapping} from "../src/Mapping.sol";

contract MappingTest {
    Mapping map;
    function setUp() public {
        map = new Mapping();
    }

    function testIterableMappingLibrary() public {}
}
