# Voting Smart Contract

## Overview
This repository contains a Solidity-based smart contract for conducting decentralized and secure voting on the Ethereum blockchain. The contract allows for transparent, tamper-proof voting processes with features for adding candidates, casting votes, and retrieving results.

## Features
- **Candidate Management:** Add candidates for voting.
- **Voter Authentication:** Ensure only eligible voters can vote.
- **Secure Voting:** Each voter can vote only once.
- **Result Transparency:** Retrieve vote counts for each candidate.

## Prerequisites
1. **Node.js** and **npm**: Install Node.js and npm for dependency management.
2. **Truffle Framework**: Install Truffle for smart contract development and testing.
3. **Ganache**: Use Ganache for local Ethereum blockchain simulation.
4. **Metamask**: A browser extension to interact with the Ethereum blockchain.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/Olu-wafemi/voting-contract.git
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Compile the smart contract:
   ```bash
   truffle compile
   ```
4. Deploy the contract to a local blockchain (Ganache):
   ```bash
   truffle migrate
   ```

## Usage
### 1. Adding Candidates
The contract owner can add candidates by calling the `addCandidate` function:
```solidity
function addCandidate(string memory _name) public onlyOwner
```

### 2. Casting Votes
Registered voters can vote for their preferred candidate:
```solidity
function vote(uint _candidateId) public
```

### 3. Retrieving Results
Anyone can view the vote count for a candidate:
```solidity
function getCandidateVotes(uint _candidateId) public view returns (uint)
```

### 4. Registering Voters
The contract owner registers voters by adding their addresses:
```solidity
function registerVoter(address _voterAddress) public onlyOwner
```

## Contract Interaction
- Use **Truffle Console** or tools like **Remix IDE** for direct interaction with the contract.
- Frontend applications can interact with the contract using **Web3.js** or **Ethers.js**.

## Testing
Run unit tests to verify the contract functionality:
```bash
truffle test
```

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contributing
Pull requests are welcome. For major changes, please open an issue to discuss the proposed changes.

## Acknowledgments
- [Ethereum Documentation](https://ethereum.org/en/developers/)
- [Truffle Suite](https://trufflesuite.com/)
- [OpenZeppelin](https://openzeppelin.com/)
