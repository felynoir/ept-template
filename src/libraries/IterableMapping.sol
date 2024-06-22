// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// edited from https://solidity-by-example.org/app/iterable-mapping/
library IterableMapping {
    // Iterable mapping from string to uint;
    struct Map {
        string[] keys;
        mapping(string => uint256) values;
        mapping(string => bool) inserted;
    }

    function get(
        Map storage map,
        string memory key
    ) public view returns (uint256) {
        return map.values[key];
    }

    function getKeyAtIndex(
        Map storage map,
        uint256 index
    ) public view returns (string memory) {
        return map.keys[index];
    }

    function size(Map storage map) public view returns (uint256) {
        return map.keys.length;
    }

    function set(Map storage map, string memory key, uint256 val) public {
        if (map.inserted[key]) {
            map.values[key] = val;
        } else {
            map.inserted[key] = true;
            map.values[key] = val;
            map.keys.push(key);
        }
    }
}
