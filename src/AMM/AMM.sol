// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ConstantSumAMM {
    address public owner;
    uint public balanceA;
    uint public balanceB;
    uint public total;
    constructor() {
        owner = msg.sender;
    }
    function initialize(uint initialA, uint initialB) public {
        require(msg.sender == owner, "Only the owner can initialize");
        require(initialA > 0 && initialB > 0, "Initial amounts must be greater than zero");
        require(balanceA == 0 && balanceB == 0, "Already initialized");
        balanceA = initialA;
        balanceB = initialB;
        total=balanceA+balanceB;
    }
    function price(uint256 denominator) public view returns (uint) {
        require(balanceA > 0, "Balance of Token A must be greater than zero");
        return (balanceB * 10**18) / balanceA; // Assuming 18 decimal places for simplicity
        return total/denominator;
    }
    function tradeAToB(uint amountA) public {
        require(amountA > 0, "Amount of Token A must be greater than zero");
        require(balanceA >= amountA, "Insufficient balance of Token A");
        uint amountB = price()
        balanceA -= amountA;
        balanceB += amountB;
    }
    function tradeBToA(uint amountB) public {
        require(amountB > 0, "Amount of Token B must be greater than zero");
        require(balanceB >= amountB, "Insufficient balance of Token B");
        uint amountA = (balanceA * amountB) / balanceB; // Calculate amount of Token A to receive
        balanceB -= amountB;
        balanceA += amountA;
    }
    function addLiquidity(uint amountA, uint amountB) public {
        require(amountA > 0 && amountB > 0, "Both amounts must be greater than zero");
        balanceA += amountA;
        balanceB += amountB;
    }
    function removeLiquidity(uint amount) public {
        require(amount > 0 && amount <= balanceA, "Invalid amount to remove");
        uint share = (amount * balanceB) / balanceA; // Calculate proportional share of Token B
        balanceA -= amount;
        balanceB -= share;
    }
}






