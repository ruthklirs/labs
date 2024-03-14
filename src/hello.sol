// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract ReceiveEther {
   address payable public owner;
    constructor() {
       owner = payable(msg.sender); // Set the contract deployer as the owner
    }

    // Event to log the deposit to bkokchein
    event Deposit(address sender, uint256 amount);
    event Withdraw(address sender, uint256 amount);

    // Function to receive Ether happen when you get ether in deploy
    //external - can accet it from everywhere
    //payable - get eth
    receive() external payable {
        require(
            msg.sender.balance >= msg.value,
            "Insufficient balance to send Ether"
        );
        // Emit an event to log the deposit
        emit Deposit(msg.sender, msg.value);
    }

    // Function to check the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

     // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Function to withdraw Ether from the contract's balance
    function withdraw(uint256 amount) public onlyOwner {
        require(amount <= address(this).balance, "Insufficient balance in the contract");
        owner.transfer(amount); // Transfer Ether to the owner
        emit Withdraw(msg.sender, amount);
    }
}
