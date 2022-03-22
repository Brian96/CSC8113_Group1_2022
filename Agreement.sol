// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Agreement {

    mapping(address => mapping(string => bool)) public userConsent;
    //mapping(string => bool) public userConsent; //String combination of actorid + purpose

    function setAgreement(address actor, string memory purpose, bool consent) public {
        userConsent[actor][purpose] = consent;
    }
    function getAgreement(address actor, string memory purpose) public view returns (bool consent){
        return userConsent[actor][purpose];
    }
}