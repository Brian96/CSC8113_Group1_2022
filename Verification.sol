// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./DataUsage.sol";
import "./Agreement.sol";
import "./Log.sol";

contract Verification {

    bool [] violatedActors;
    uint [] vioList;

    DataUsage [] actors;
    Agreement dataSubject;
    Log logs;


    function validate() public{
        Log.logInfo [] memory totalLogs = logs.getLogs();
        for(uint i = 0; i < totalLogs.length; i++){
            Log.logInfo memory curLog = totalLogs[i];
            bool cons = dataSubject.getAgreement(address(actors[curLog.actorId-1]), curLog.serviceName);
            if (!cons){
                if (violatedActors[curLog.actorId-1] != true){
                    violatedActors[curLog.actorId-1] = true;
                    vioList.push(curLog.actorId);
                }
                
            }
        }
    }

    function getViolatedActors() public view returns (uint[] memory res){
        return vioList;
    }

    function setInputs(DataUsage[] memory du, Agreement ds, Log l) public{
        actors = du;
        dataSubject = ds;
        logs = l;
        violatedActors = new bool[] (du.length);
    }
}