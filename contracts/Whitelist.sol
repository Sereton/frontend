//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;


contract Whitelist {
    uint8 public maxWhitelistedAddresses;

    mapping(address=>bool) public whitelistedAdresses;
    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) public {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAdresses[msg.sender], "Address already whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Max whitelisted addresses reached");

        whitelistedAdresses[msg.sender] = true;
        numAddressesWhitelisted++;
    }
}