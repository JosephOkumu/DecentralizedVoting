// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Base contract for ownership
contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
}

// Main voting contract
contract VotingSystem is Ownable {
    // Candidate structure
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Mappings
    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public voters;

    // State variables
    uint public nextCandidateId;
    uint public totalCandidates;

    // Events
    event CandidateAdded(uint indexed candidateId, string name);
    event Voted(address indexed voter, uint indexed candidateId);

    // Add a new candidate (only owner)
    function addCandidate(string calldata name) external onlyOwner {
        uint candidateId = nextCandidateId;
        candidates[candidateId] = Candidate(candidateId, name, 0);
        nextCandidateId++;
        totalCandidates++;
        emit CandidateAdded(candidateId, name);
    }

    // Vote for a candidate
    function vote(uint candidateId) external {
        require(!voters[msg.sender], "You have already voted");
        require(candidateId < nextCandidateId, "Invalid candidate ID");

        candidates[candidateId].voteCount++;
        voters[msg.sender] = true;

        emit Voted(msg.sender, candidateId);
    }

    // Get candidate details
    function getCandidate(uint candidateId) public view returns (string memory name, uint voteCount) {
        require(candidateId < nextCandidateId, "Invalid candidate ID");
        Candidate memory candidate = candidates[candidateId];
        return (candidate.name, candidate.voteCount);
    }

    // Get total number of candidates
    function getTotalCandidates() public view returns (uint) {
        return totalCandidates;
    }
}