// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Log {
    struct logInfo{
        uint actorId;
        string operation;
        string[4] data;
        string serviceName;
    }
    logInfo [] logs;
    function setLog(uint actorId, string memory operation, string[4] memory data, string memory serviceName) public{
        logInfo memory log;
        log.actorId = actorId;
        log.operation = operation;
        log.data = data;
        log.serviceName = serviceName;
        logs.push(log);
    }

    function getLog(uint actorId) public view returns (logInfo memory log){
        for(uint i = 0; i < logs.length; i++){
            if(logs[i].actorId == actorId){
                return logs[i];
            }
        }
    }
    
    function updateLog(uint actorId, string memory operation) public {
        logs[actorId].operation = string(abi.encodePacked(logs[actorId].operation, operation));
    }
}