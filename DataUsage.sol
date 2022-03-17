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

    event DataCollection(
        address indexed from,
        actorInfo info
    );

    mapping(uint => actorInfo) actors;

    function setActor(actorInfo memory actor) private {
        actors[actor.actorId] = actor;
    }

    function getActor(uint actorId) public view returns (actorInfo memory actor) {
        return actors[actorId];
    }

    function submitPurpose(actorInfo memory actor) external {
        actors[actor.actorId] = actor;
        emit DataCollection(msg.sender, actors[actor.actorId]);
    }
}