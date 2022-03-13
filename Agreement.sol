// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.12;

contract Agreement {
    mapping(uint => bool) public userConsent;
    struct agreementInfo{
        uint256 hashAddr;
        uint userId;
        uint consent;
    }
}