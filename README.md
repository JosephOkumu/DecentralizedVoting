# DecentralizedVoting
A decentralized voting system smart contract.

## Overview

A Solidity smart contract for a decentralized voting system that allows:
- Owner to register candidates
- Users to cast votes (one vote per address)
- Public view of voting results

## Features

- **Ownership Control**: Only owner can add candidates
- **Anti-Double Voting**: Prevents multiple votes from same address
- **Transparent Results**: Anyone can view candidate details and vote counts


### Requirements
Solidity ^0.8.0

EVM-compatible network

### Security
✔ Owner-restricted candidate addition
✔ Prevention of double voting
✔ Input validation for candidate IDs

### License
MIT