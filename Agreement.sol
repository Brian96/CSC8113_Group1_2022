// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Agreement {
    mapping(uint => bool) public userConsent;

    function setAgreement(uint userId, bool consent) public {
        userConsent[userId] = consent;
    }
    function getAgreement(uint userId) public view returns (bool consent){
        return userConsent[userId];
    }
}