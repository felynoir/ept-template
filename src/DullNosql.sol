// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IDullNoSql} from "./interfaces/IDullNoSql.sol";
import {IterableMapping} from "./libraries/IterableMapping.sol";

contract DullNoSql is IDullNoSql {
    using IterableMapping for IterableMapping.Map;

    struct Collection {
        IterableMapping.Map[] documents;
    }

    // We can just use mapping(string => IterabledMapping.Map[]) too
    mapping(string => Collection) private collections;

    function addDocument(
        string memory collectionName,
        uint index,
        string memory key,
        uint value
    ) external returns (uint documentIndex) {
        Collection storage collection = collections[collectionName];
        uint size = collection.documents.length;
        if (index == 0) {
            // we can't push mapping or struct of mapping here because it not support copied of data
            // neither collection.documents[size] = document
            // nor collection.documents.push(document) work
            // we can only access through reference and edit
            collection.documents.push();
            IterableMapping.Map storage document = collection.documents[size];
            document.set(key, value);

            return size + 1;
        } else if (index <= size) {
            IterableMapping.Map storage document = collection.documents[
                size - 1
            ];
            document.set(key, value);
            return index;
        } else {
            revert NoDocumentExist();
        }
    }

    function getDocumentValues(
        string memory collectionName,
        string memory key
    ) external view returns (uint[] memory) {
        Collection storage collection = collections[collectionName];
        uint[] memory values = new uint[](collection.documents.length);
        uint valueCount = 0;

        for (uint i = 0; i < collection.documents.length; i++) {
            uint value = collection.documents[i].get(key);

            values[valueCount] = value;
            valueCount++;
        }

        // Resize the array to fit the actual number of found values
        uint[] memory trimmedValues = new uint[](valueCount);
        for (uint j = 0; j < valueCount; j++) {
            trimmedValues[j] = values[j];
        }

        return trimmedValues;
    }

    function updateDocuments(
        string memory collectionName,
        string memory key,
        uint value
    ) external returns (bool updated) {}

    function deleteDocuments(
        string memory collectionName,
        string memory key
    ) external returns (bool deleted) {}
}
