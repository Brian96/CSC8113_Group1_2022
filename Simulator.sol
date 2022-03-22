// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./DataUsage.sol";
import "./Agreement.sol";
import "./Log.sol";
import "./Verification.sol";

contract Simulator {

    DataUsage actors;
    Agreement dataSubject;
    Log logs;
    mapping(uint => address) actorAddresses;
    uint u0;
    uint u1;
    constructor() {
        u0 = gasleft();
        actors = DataUsage(0xd9145CCE52D386f254917e481eB44e9943F39138);
        actorAddresses[1] = 0xd9145CCE52D386f254917e481eB44e9943F39138;
        actorCount1();

        //actorCount2();
        //actorCount3();
        //actorCount4();
        //actorCount5();
        u1 = gasleft();
    }

    function actorCount1() private{
        actors.setActor(1, "test", "advertisement", "read", ["name", "address", "1", "2"]);
        dataSubject = Agreement(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8);
        logs = Log(0xf8e81D47203A594245E36C48e151709F0C19fBe8);
        dataSubject.setAgreement(0xd9145CCE52D386f254917e481eB44e9943F39138, "advertisement", true);


        //bool consent = dataSubject.getAgreement(0xd9145CCE52D386f254917e481eB44e9943F39138, "advertisement");
        bool consent = dataSubject.getAgreement(actorAddresses[actors.getDataUsageDetailByActorId(1)[0].actorId], actors.getDataUsageDetailByActorId(1)[0].purpose);
        if(consent) {
            logs.setLog(1, "read", ["name", "address", "1", "2"], "test");
        }

    }

    function actorCount2() private{
        //actors.setActor(1, "test1", "advertisement1", "", ["name", "address"]);
        //actors.setActor(2, "test2", "advertisement2", "", ["name"]);
        dataSubject = new Agreement();
        //dataSubject.setAgreement(2, true);
        //bool consent = dataSubject.getAgreement(2);
        // if(consent) {
        //     actors.updateActorOperation(1, "read");
        //     actors.updateActorOperation(2, "share");
        // }
    }

    function getGasCost() public view returns (uint gas){
        uint res = u0-u1;
        return res;
    }

    function printActor() public view returns (DataUsage du){
        return actors;
    }

    
}