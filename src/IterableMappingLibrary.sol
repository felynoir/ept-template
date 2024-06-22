// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library IterableMappingLibrary {
    struct Map {
        uint8 tmp;
    }

    function get(
        Map storage map,
        string memory key
    ) public view returns (uint256) {
        // implementation
    }

    function listValues(Map memory map) public view returns (uint256[] memory) {
        // implementation
    }

    function set(Map storage map, string memory key, uint256 val) public {
        // implementation
    }
}

contract UseMapping {
    IterableMappingLibrary.Map map;

    function getValue(string memory key) public view returns (uint256) {
        return get(map, key);
    }
}

contract UseLibraryMapping {
    // using IterableMappingLibrary for IterableMappingLibrary.Map;
    IterableMappingLibrary.Map;

    function getValue(string memory key) public view returns (uint256) {}
}
