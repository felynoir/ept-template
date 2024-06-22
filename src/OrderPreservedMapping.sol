// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library OrderPreservedMapping {
    // a map type
    struct Map {
        // TODO: add fields here
        bool tmp; // remove this line
    }

    // get a value from the map
    function get(
        Map storage map,
        string memory key
    ) public view returns (uint256) {
        // TODO: add logic here
    }

    // list all values in the map ordered by insertion
    function listValues(Map memory map) public pure returns (uint256[] memory) {
        // TODO: add logic here
    }

    // set a value in the map
    function set(Map storage map, string memory key, uint256 val) public {
        // TODO: add logic here
    }

    function size(Map memory map) public pure returns (uint256) {
        // TODO: add logic here
    }
}

contract UseOrderPreservedMapping {
    using OrderPreservedMapping for OrderPreservedMapping.Map;
    OrderPreservedMapping.Map map;

    function setValue(string memory key, uint256 value) public {
        map.set(key, value);
    }

    function getValue(string memory key) public view returns (uint256) {
        return map.get(key);
    }
}
