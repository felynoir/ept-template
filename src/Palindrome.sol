// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {IPalindromeChecker} from "./interfaces/IPalindromeChecker.sol";
contract Palindrome is IPalindromeChecker {
    function isPalindrome(string memory str) public pure returns (bool) {
        return true;
    }
}
