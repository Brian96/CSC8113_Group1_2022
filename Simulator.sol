// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./DataUsage.sol";
import "./Agreement.sol";
import "./Log.sol";
import "./Verification.sol";

contract Simulator {

    DataUsage [] actors;
    Agreement dataSubject;
    Log logs;
    
    uint u0;
    uint u1;

    mapping(uint => address) actorAddresses;
    mapping(uint => address) userAddresses;
    mapping(uint => address) logAddresses;
    constructor() {
        u0 = gasleft();
        
        actorAddresses[1] = 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8;
        userAddresses[1] = 0xd9145CCE52D386f254917e481eB44e9943F39138;
        logAddresses[1] = 0xf8e81D47203A594245E36C48e151709F0C19fBe8;
        actorCount(1);

        //actorCount2();
        //actorCount3();
        //actorCount4();
        //actorCount5();
        u1 = gasleft();
    }

    function actorCount(uint maxActor) private{
        maxActor++;
        for (uint i = 1; i <= maxActor; i++){
            actors.push(DataUsage(actorAddresses[1]));
            actors[i-1].setActor(i, "test", "advertisement", "read", ["name", "address", "1", "3"]);
            //actors[0].setActor();
        }
        
        
        dataSubject = Agreement(userAddresses[1]);
        logs = Log(logAddresses[1]);

        for (uint i = 1; i < maxActor; i++){
            if (i%2 ==1){
                dataSubject.setAgreement(actorAddresses[i], "advertisement", true);
            }
            else{
                dataSubject.setAgreement(actorAddresses[i], "advertisement", false);
            }
            
        }
        

        for (uint i = 1; i <= maxActor; i++){
            bool consent = dataSubject.getAgreement(actorAddresses[actors[i-1].getDataUsageDetailByActorId(1)[0].actorId], actors[i-1].getDataUsageDetailByActorId(1)[0].purpose);
            if(consent) {
                logs.setLog(i, "read", ["name", "address", "1", "2"], "test");
            }
        }
        //bool consent = dataSubject.getAgreement(0xd9145CCE52D386f254917e481eB44e9943F39138, "advertisement");
        



    }

    function getGasCost() public view returns (uint gas){
        uint res = u0-u1;
        return res;
    }

    function printActor() public view returns (DataUsage du){
        return actors[0];
    }

    
}