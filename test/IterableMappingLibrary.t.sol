// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {UseLibraryMapping} from "../src/IterableMappingLibrary.sol";

contract MappingTest {
    UseLibraryMapping a;

    function setUp() public {
        a = new UseLibraryMapping();
    }

    function testTmpValue() public {
        a.setValue("", 10);
        assert(a.getValue("") == 10);
    }
}
