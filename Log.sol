pragma solidity 0.8.12;

contract Log {
    struct LogInfo{
        uint actorId;
        string operation;
        string[] data;
        string serviceName;
    }
}