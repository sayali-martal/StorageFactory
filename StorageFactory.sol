// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage {

    SimpleStorage[] public simpleStorageArray;

    // Deploy contract on blockchain with another contract
    function createSimpleStorageContract() public {
        // New object of type SimpleStorage with no input parameters 
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Need address and ABI to interact with another contract
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    }
}
