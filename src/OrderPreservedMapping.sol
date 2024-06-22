// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library OrderPreservedMapping {
    struct Map {
        uint256 tmp;
    }

    function get(
        Map storage map,
        string memory key
    ) public view returns (uint256) {
        return map.tmp;
    }

    function listValues(Map memory map) public pure returns (uint256[] memory) {
        uint256[] memory values = new uint256[](1);
        values[0] = map.tmp;
        return values;
    }

    function set(Map storage map, string memory key, uint256 val) public {
        map.tmp = val;
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
