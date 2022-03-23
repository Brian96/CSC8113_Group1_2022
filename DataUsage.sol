// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract DataUsage {

    uint myActorId;
    
    struct DataUsageDetail { 
        uint actorId;
        string serviceName;
        string purpose;
        string operation;
        string[4] data;
    }

    mapping(uint => DataUsageDetail[]) dataUsageEntries;

    function setActor(uint actorId, string memory sName, string memory purpose, string memory op, string[4] memory data) public {
        DataUsageDetail memory actor;
        actor.actorId = actorId;
        actor.serviceName = sName;
        actor.purpose = purpose;
        actor.operation = op;
        actor.data = data;
        dataUsageEntries[actorId].push(actor);
        myActorId = actorId;
    }

    // function updateActorOperation(uint actorId, string memory sName, string memory op) public {
    //     //require(dataUsageEntries[actorId].isValue, "Invalid actor Id");
    //     for (uint i = 0; i < dataUsageEntries[actorId].length; i++){
    //         if (StringUtils.equal(dataUsageEntries[actorId][i].serviceName, sName)){
    //             dataUsageEntries[actorId][i].operation = op;
    //         }
    //     }
    //     //dataUsageEntries[actorId+sName].operation = string(abi.encodePacked(dataUsageEntries[actorId].operation, op));
    // }

    function getDataUsageDetailByActorId(uint actorId) public view returns (DataUsageDetail[] memory details) {
        return dataUsageEntries[actorId];
    }

    function getDataUsageDetails() public view returns (DataUsageDetail[] memory details) {
        return dataUsageEntries[myActorId];
    }


}