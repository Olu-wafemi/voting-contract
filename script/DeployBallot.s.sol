//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

import {Ballot} from "../src/voting.sol";

contract DeployBallot is Script {
    function run() external returns (Ballot) {
        vm.startBroadcast();
        bytes32[2] memory names;
        names[0] = keccak256(abi.encodePacked("Brs"));
        names[1] = keccak256(abi.encodePacked("Sis"));
        Ballot ballot = new Ballot(names);
        vm.stopBroadcast();

        return ballot;
    }
}
