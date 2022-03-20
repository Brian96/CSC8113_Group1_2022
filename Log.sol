// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Log {
    struct LogInfo{
        uint actorId;
        string operation;
        string[] data;
        string serviceName;
    }
}