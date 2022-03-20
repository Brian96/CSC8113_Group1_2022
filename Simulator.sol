// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./DataUsage.sol";
import "./Agreement.sol";

contract Simulator {
    DataUsage actor;
    Agreement dataSubject;
    constructor() {
        actor = new DataUsage();
        actor.setActor(1, "test", "advertisement", "", ["verified successfully", "verified failed", "not clear"]);
        dataSubject.setAgreement(2, true);
        actor.updateActorOperation(1, "read");
        actor.updateActorOperation(2, "share");
    }
}