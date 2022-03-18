// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.12;

contract Agreement {
    mapping(uint => bool) public userConsent;
    struct agreementInfo{
        uint userId;
        uint consent;
    }
    event DataConsent(
        address indexed from,
        agreementInfo userConsent
    );
    mapping(uint => agreementInfo) agreements;

    function setAgreement(agreementInfo memory agreement) private {
        agreements[agreement.userId] = agreement;
    }
    function getAgreement(uint userId) public view returns (agreementInfo memory agreement){
        return agreements[userId];
    }

    function submitConsent(agreementInfo memory user) external {
        agreements[user.userId] = user;
        emit DataConsent(msg.sender, agreements[user.userId]);
    }
}