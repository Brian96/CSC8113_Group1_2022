// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.12;

contract DataUsage {
    struct actorInfo {
        uint actorId;
        string serviceName;
        string purpose;
        string operation;
        string[] data;
    }
    mapping(uint => actorInfo) actors;

    function setActor(actorInfo memory actor) public {
        actors[actor.actorId] = actor;
    }

    function getActor(uint actorId) public view returns (actorInfo memory actor) {
        return actors[actorId];
    }
}