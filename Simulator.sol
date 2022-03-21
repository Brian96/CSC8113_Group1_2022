// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./DataUsage.sol";
import "./Agreement.sol";

contract Simulator {
    DataUsage actor;
    Agreement dataSubject;
    uint u0;
    uint u1;
    constructor() {
        u0 = gasleft();
        actor = new DataUsage();
        actor.setActor(1, "test", "advertisement", "", ["Billy Bob", "01-01-1960", "07878780002", "Newcastle upon Tyne"]);
        dataSubject = new Agreement();
        dataSubject.setAgreement(2, true);
        bool consent = dataSubject.getAgreement(2);
        if(consent) {
            actor.updateActorOperation(1, "read");
            actor.updateActorOperation(2, "share");
        }


        u1 = gasleft();
    }

    function getGasCost() public view returns (uint gas){
        uint res = u0-u1;
        return res;
    }

    
}