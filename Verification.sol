// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./DataUsage.sol";
import "./Agreement.sol";
import "./Log.sol";

contract Verification {

    uint [] violatedActors;

    DataUsage [] actors;
    Agreement dataSubject;
    Log logs;


    function validate() public{
        violatedActors.push(1);
    }

    function getViolatedActors() public view returns (uint[] memory res){
        return violatedActors;
    }

    function setInputs(DataUsage[] memory du, Agreement ds, Log l) public{
        actors = du;
        dataSubject = ds;
        logs = l;
    }
}