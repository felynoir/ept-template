// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {UseOrderPreservedMapping} from "../src/OrderPreservedMapping.sol";

contract MappingTest {
    UseOrderPreservedMapping a;

    function setUp() public {
        a = new UseOrderPreservedMapping();
    }

    function testTmpValue() public {
        a.setValue("", 10);
        assert(a.getValue("") == 10);
    }
}
