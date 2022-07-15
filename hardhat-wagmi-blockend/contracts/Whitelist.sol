//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

contract Whitelist {
    // The owner of the contract
    address owner;

    // Stores the whitelisted addresses.
    // Creates a mapping that receives the user's address and returns if they are whitelisted or not.
    mapping(address => bool) whitelistedAddresses;

    // Validate only the owner can call the function
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Error: Only owner can call this function"
        );
        _;
    }

    // Adds an address to the whitelist
    function addUserAddressToWhitelist(address _addressToWhitelist)
        public
        onlyOwner
    {
        // Checks the caller is not already part of the whitelist.
        require(
            !whitelistedAddresses[_addressToWhitelist],
            "Error: Sender already whitelisted"
        );

        // Set whitelist boolean to true.
        // Addresses are set to false by default.
        whitelistedAddresses[_addressToWhitelist] = true;
    }

    // Verifies the users address is on the whitelist
    function verifyUserAddress(address _whitelistedAddress)
        public
        view
        returns (bool)
    {
        // Verifying if the user has been whitelisted
        bool userIsWhitelisted = whitelistedAddresses[_whitelistedAddress];
        return userIsWhitelisted;
    }

    // Is the user whitelisted?
    function isWhitelisted(address _whitelistedAddress)
        public
        view
        returns (bool)
    {
        // Verifying if the user has been whitelisted
        return whitelistedAddresses[_whitelistedAddress];
    }

    // Remove user from whitelist
    function removeUserAddressFromWhitelist(address _addressToRemove)
        public
        onlyOwner
    {
        // Validate the caller is already part of the whitelist.
        require(
            whitelistedAddresses[_addressToRemove],
            "Error: Sender is not whitelisted"
        );

        // Set whitelist boolean to false.
        whitelistedAddresses[_addressToRemove] = false;
    }

    // Get the owner of the contract
    function getOwner() public view returns (address) {
        return owner;
    }
}
