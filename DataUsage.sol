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
    mapping(string => actorInfo) actors;

    function setActor(actorInfo memory actor) public {
        actors[actor.actorId] = actor;
    }

    function getActor(string memory actorId) public view returns (actorInfo memory actor) {
        return actors[actorId];
    }
}