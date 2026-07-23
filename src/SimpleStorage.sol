// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @author 0xRrudy
 * @title SimpleStorage
 * @notice A simple Solidity smart contract to store and manage a uint256 value and user preferences.
 * @dev Demonstrates state variables, structs, arrays, mappings, and basic read/write functions.
 */
contract SimpleStorage {
    /// @notice The current favorite number stored in the contract.
    uint256 myFavoriteNumber;

    /// @notice Stores a person's name and favorite number.
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    /// @notice A dynamic array of registered people with an index-based public getter.
    Person[] public listOfPeople;

    /// @notice Maps a person's name to their favorite number.
    mapping(string => uint256) public nameToFavoriteNumber;

    /**
     * @notice Updates the stored favorite number.
     * @param _favoriteNumber The new number to store.
     */
    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    /**
     * @notice Retrieves the currently stored favorite number.
     * @return The currently stored favorite number.
     */
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    /**
     * @notice Adds a new person and maps their name to their favorite number.
     * @param _name The name of the person to add.
     * @param _favoriteNumber The favorite number associated with the person.
     */
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
