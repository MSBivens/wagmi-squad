//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

/** 
    @title A restricted whitelist
    @author Mike Bivens
    @notice Addresses can only be added to this whitelist by the owner of the contract
*/
contract Whitelist {
    // @notice The owner of the contract
    address owner;

    // @notice Stores the whitelisted addresses.
    // @dev Creates a mapping that receives the user's address and returns if they are whitelisted or not.
    mapping(address => bool) whitelistedAddresses;

    // @notice Validate only the owner can call the function
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Error: Only owner can call this function"
        );
        _;
    }

    // @notice Adds an address to the whitelist
    function addUserAddressToWhitelist(address _addressToWhitelist)
        public
        onlyOwner
    {
        // @notice Checks the caller is not already part of the whitelist.
        require(
            !whitelistedAddresses[_addressToWhitelist],
            "Error: Sender already whitelisted"
        );

        // @dev Set whitelist boolean to true.
        // @notice Addresses are set to false by default.
        whitelistedAddresses[_addressToWhitelist] = true;
    }

    // @notice Verifies the users address is on the whitelist
    function verifyUserAddress(address _whitelistedAddress)
        public
        view
        returns (bool)
    {
        // @notice Verifying if the user has been whitelisted
        bool userIsWhitelisted = whitelistedAddresses[_whitelistedAddress];
        return userIsWhitelisted;
    }

    // @notice Checks if the user is whitelisted
    function isWhitelisted(address _whitelistedAddress)
        public
        view
        returns (bool)
    {
        // @notice Verifying if the user has been whitelisted
        return whitelistedAddresses[_whitelistedAddress];
    }

    // @notice Remove user from whitelist
    function removeUserAddressFromWhitelist(address _addressToRemove)
        public
        onlyOwner
    {
        // @notice Validate the caller is already part of the whitelist.
        require(
            whitelistedAddresses[_addressToRemove],
            "Error: Sender is not whitelisted"
        );

        // @notice Set whitelist boolean to false.
        whitelistedAddresses[_addressToRemove] = false;
    }

    // @notice Get the owner of the contract
    function getOwner() public view returns (address) {
        return owner;
    }
}
