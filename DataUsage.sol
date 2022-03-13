// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.12;

contract DataUsage {
    struct actorInfo {
        string actorId;
        string serviceName;
        string purpose;
        string operation;
        string[] data;
    }
}