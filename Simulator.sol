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
    Verification v;
    
    uint u0;
    uint u1;

    mapping(uint => address) actorAddresses;
    mapping(uint => address) userAddresses;
    mapping(uint => address) logAddresses;
    mapping(uint => address) verificationAddress;
    constructor() {
        
        
        actorAddresses[1] = 0xd9145CCE52D386f254917e481eB44e9943F39138;
        userAddresses[1] = 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8;
        logAddresses[1] = 0xf8e81D47203A594245E36C48e151709F0C19fBe8;
        verificationAddress[1] = 0xDA0bab807633f07f013f94DD0E6A4F96F8742B53;


        u0 = gasleft();
        preset(1);
        logAndValidation(1);

        //actorCount2();
        //actorCount3();
        //actorCount4();
        //actorCount5();
        u1 = gasleft();
    }


    //set the purposed and data required of actors with number of maxActor
    function preset(uint maxActor) private{
        if (maxActor == 1){
            for (uint i = 1; i <= maxActor; i++){   //preset values to actors (DataUsage Contract)
                actors.push(DataUsage(actorAddresses[1]));
                actors[i-1].setActor(i, "test", "advertisement", "read", ["name", "address", "1", "3"]);
            }
            
            //assign existing smart contract to user, log, and verifier
            dataSubject = Agreement(userAddresses[1]);
            logs = Log(logAddresses[1]);
            v = Verification(verificationAddress[1]);

            //set the consent information of users
            for (uint i = 1; i < maxActor; i++){
                if (i%2 ==1){
                    dataSubject.setAgreement(actorAddresses[i], "test", false);
                }
                else{
                    dataSubject.setAgreement(actorAddresses[i], "test", false);
                }
                
            }

            //pass actor, user, log to the verifier in order for autotesting
            v.setInputs(actors, dataSubject, logs);

        }
    }


    //write values to log, and verify if the logs comply to GDPR
    function logAndValidation(uint maxActor) private{
        //for each actors, check if the user allows the purpose of data
        for (uint i = 1; i <= maxActor; i++){
            bool consent = dataSubject.getAgreement(actorAddresses[actors[i-1].getDataUsageDetailByActorId(1)[0].actorId], actors[i-1].getDataUsageDetailByActorId(1)[0].purpose);
            if(consent) {
                logs.setLog(i, actors[i-1].getDataUsageDetailByActorId(1)[0].operation, actors[i-1].getDataUsageDetailByActorId(1)[0].data, actors[i-1].getDataUsageDetailByActorId(1)[0].serviceName);
            }
        }
        //bool consent = dataSubject.getAgreement(0xd9145CCE52D386f254917e481eB44e9943F39138, "advertisement");

        //start the validation
        v.validate();

    }

    //return the gas cost based on the value collected from the constructor
    function getGasCost() public view returns (uint gas){
        uint res = u0-u1;
        return res;
    }

    //for debugging use, print the first actor
    function printActor() public view returns (DataUsage du){
        return actors[0];
    }

    
}