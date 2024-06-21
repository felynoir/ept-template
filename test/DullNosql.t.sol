// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {DullNoSql} from "../src/DullNoSql.sol";

contract CounterTest is Test {
    DullNoSql nosql;
    function setUp() public {
        nosql = new DullNoSql();
    }
    function test_AddDocument() public {
        uint doc1 = nosql.addDocument("abc", 0, "key1", 10);
        // It's new document and index start with 1 (0 is reserved).
        assertEq(doc1, 1);
        assertEq(nosql.addDocument("abc", 1, "key2", 50), doc1);

        uint doc2 = nosql.addDocument("abc", 0, "key1", 20);
        assertEq(doc2, 2);

        uint[] memory expectedResult = new uint[](2);
        expectedResult[0] = 10;
        expectedResult[1] = 20;

        assertEq(nosql.getDocumentValues("abc", "key1"), expectedResult);

        // we reuse var here
        expectedResult = new uint[](1);
        expectedResult[0] = 50;

        // Hmm what wrong here? it's shouldn't return [50,0] why 0 come out
        assertNotEq(nosql.getDocumentValues("abc", "key2"), expectedResult);
    }

    function test_UpdateDocuments() public {}

    function test_DeleteDocuments() public {}
}
