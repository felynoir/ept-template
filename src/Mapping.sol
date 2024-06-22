// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// forge test -vv --match-path test/Mapping.t.sol
// forge test -vv --match-test test_Mapping

contract Mapping {
    mapping(string => uint256) private map;

    // returns (string memory value)
    // returns (string memory)
    function get(string memory key) public view returns (uint256 value) {
        value = map[key]; // equal to -> return map[key];
    }

    function set(string memory key, uint256 value) public {
        map[key] = value;
    }
}
