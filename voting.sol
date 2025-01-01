// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Ballot {
    struct Voter{
        uint size;
        address delegate;
        bool has_voted;
        uint vote;
    }
}