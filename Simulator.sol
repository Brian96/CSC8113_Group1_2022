// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./DataUsage.sol";
import "./Agreement.sol";

contract Simulator {
    DataUsage actors;
    Agreement dataSubject;
    uint u0;
    uint u1;
    constructor() {
        u0 = gasleft();
        //actorCount1();
        actorCount2();
        //actorCount3();
        //actorCount4();
        //actorCount5();
        u1 = gasleft();
    }

    function actorCount1() private{
        actors = new DataUsage();
        actors.setActor(1, "test", "advertisement", "", ["Billy Bob", "01-01-1960", "07878780002", "Newcastle upon Tyne"]);
        dataSubject = new Agreement();
        dataSubject.setAgreement(2, true);
        bool consent = dataSubject.getAgreement(2);
        if(consent) {
            actors.updateActorOperation(1, "read");
        }
    }

    function actorCount2() private{
        actors = new DataUsage();
        actors.setActor(1, "test1", "advertisement1", "", ["Billy Bob", "01-01-1960", "07878780002", "Newcastle upon Tyne"]);
        actors.setActor(2, "test2", "advertisement2", "", ["Anne", "01-01-1970", "07878780001", "London"]);
        dataSubject = new Agreement();
        dataSubject.setAgreement(2, true);
        bool consent = dataSubject.getAgreement(2);
        if(consent) {
            actors.updateActorOperation(1, "read");
            actors.updateActorOperation(2, "share");
        }
    }

    function getGasCost() public view returns (uint gas){
        uint res = u0-u1;
        return res;
    }

    
}