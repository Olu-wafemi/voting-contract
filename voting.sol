// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Ballot {
    struct Voter{
        uint size;
        address delegate;
        bool has_voted;
        uint vote;
    }

    address public admin;

    struct Candidates {
        bytes32 firstname;
        bytes32 lastname;
        uint age;
        uint votecount;

    }

    mapping(address => Voter) public voters;

    Candidates[] public candidates;

    constructor(bytes32[] memory firstname, lastname, age){
        admin = msg.sender
        voters[admin].size = 1;

        for (uint i = 0; i < candidateNames.length; i++){
            candidates.push(Candidate({
                firstname: firstname,
                lastname: lastname,
                age: age,
                voteCount: 0
            }))

        }

        
    }

    function assignvotingright(address voter_address) external{


        require(msg.sender == admin);
        require(!voters[voter_address].voted);
        require(voters[voter_address].weight == 0);
        voters[voter_address].weight = 1

    }
}