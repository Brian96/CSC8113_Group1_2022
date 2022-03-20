// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract DataUsage {
    struct actorInfo { 
        uint actorId;
        string serviceName;
        string purpose;
        string operation;
        string[4] data;
    }

    mapping(uint => actorInfo) actors;

    function setActor(uint actorId, string memory sName, string memory purpose, string memory op, string[4] memory data) public {
        actorInfo memory actor;
        actor.actorId = actorId;
        actor.serviceName = sName;
        actor.purpose = purpose;
        actor.operation = op;
        actor.data = data;
        actors[actorId] = actor;
    }
    function updateActorOperation(uint actorId, string memory op) public {
        actors[actorId].operation = string(abi.encodePacked(actors[actorId].operation, op));
    }
    function getActorPurpose(uint actorId) public view returns (string memory purpose) {
        return actors[actorId].purpose;
    }
}