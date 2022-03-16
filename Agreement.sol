// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.12;

contract Agreement {
    mapping(uint => bool) public userConsent;
    struct agreementInfo{
        uint256 hashAddr;
        uint userId;
        uint consent;
    }
    mapping(uint => agreementInfo) agreements;

    function setAgreement(agreementInfo memory agreement) public {
        agreements[agreement.userId] = agreement;
    }
    function getAgreement(uint userId) public view returns (agreementInfo memory agreement){
        return agreements[userId];
    }
}