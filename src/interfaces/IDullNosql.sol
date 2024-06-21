// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IDullNoSql {
    error NoDocumentExist();

    /// if index is 0 it mean create new document, if not it will add/update value for that key
    /// If document doesn't exist it will revert
    /// returns index of document
    function addDocument(
        string memory collectionName,
        uint index,
        string memory key,
        uint value
    ) external returns (uint documentIndex);

    /// If returns true [key] is being update (>= 1 document), if not there is no existing key
    function updateDocuments(
        string memory collectionName,
        string memory key,
        uint value
    ) external returns (bool updated);

    /// returns all document's value of that [key] or empty
    /// order is not matter
    function getDocumentValues(
        string memory collectionName,
        string memory key
    ) external returns (uint[] memory);

    /// If returns true [key] is being delete (>= 1 document), if not there is no existing key
    function deleteDocuments(
        string memory collectionName,
        string memory key
    ) external returns (bool deleted);
}
