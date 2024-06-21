// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {IterableMapping} from "../src/libraries/IterableMapping.sol";

contract TestIterableMap {
    using IterableMapping for IterableMapping.Map;

    IterableMapping.Map private map;

    function testIterableMap() public {
        map.set("a", 0);
        map.set("b", 100);
        map.set("c", 200); // insert
        map.set("c", 200); // update
        map.set("d", 300);

        for (uint256 i = 0; i < map.size(); i++) {
            string memory key = map.getKeyAtIndex(i);
            assert(map.get(key) == i * 100);
        }

        map.remove("b");

        // keys = [a,d,c]
        assert(map.size() == 3);
        assert(
            keccak256(abi.encodePacked(map.getKeyAtIndex(0))) ==
                keccak256(abi.encodePacked("a"))
        );
        assert(
            keccak256(abi.encodePacked(map.getKeyAtIndex(1))) ==
                keccak256(abi.encodePacked("d"))
        );
        assert(
            keccak256(abi.encodePacked(map.getKeyAtIndex(2))) ==
                keccak256(abi.encodePacked("c"))
        );
    }
}
