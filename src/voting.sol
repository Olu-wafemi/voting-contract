// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Ballot {
    struct Voter {
        uint256 size; //number of votes available
        address delegate;
        bool has_voted;
        uint256 vote;
    }

    address public admin;

    struct Candidates {
        bytes32 name;
        uint256 voteCount;
    }

    struct Winner {
        bytes32 name;
    }

    bytes32[] winner;

    mapping(address => Voter) public voters;

    Candidates[] public candidates;
    uint256 winnervotecount;

    constructor(bytes32[2] memory names) {
        admin = msg.sender;
        voters[admin].size = 1;

        for (uint256 i = 0; i < names.length; i++) {
            candidates.push(Candidates({name: names[i], voteCount: 0}));
        }
    }

    function assignvotingright(address voter_address) external {
        require(msg.sender == admin);
        require(!voters[voter_address].has_voted);
        require(voters[voter_address].size == 0);
        voters[voter_address].size = 1;
    }

    function vote(uint256 index) external {
        Voter storage participant = voters[msg.sender];
        require(participant.size != 0);
        require(!participant.has_voted);
        participant.has_voted = true;
        participant.vote = index;

        candidates[index].voteCount += participant.size;
    }

    function getWinner() public view returns (uint256 countvotewins_) {
        uint256 countvotewins = 0;
        for (uint256 i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > countvotewins) {
                countvotewins_ = candidates[i].voteCount;
            }
        }
    }

    function winnerName() external returns (bytes32[] memory winner_) {
        for (uint256 i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount == getWinner()) {
                winner.push(candidates[i].name);
            }
        }
        winner_ = winner;
    }
}
