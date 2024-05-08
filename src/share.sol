pragma solidity ^0.8.0;

contract WalletDistributor {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function distribute// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WalletDistributor {
    event Deposit(address indexed sender, uint256 amount);
    event Withdrawal(address indexed recipient, uint256 amount);
    
    address private owner;

    constructor() {
        owner = msg.sender;
    }
    
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function distribute(address[] memory recipients, uint amount) public payable {
        require(msg.sender == owner, "Only the owner can distribute funds");
        require(recipients.length > 0, "Please specify recipients");
        uint256 amountPerRecipient = amount / recipients.length;
        require(amountPerRecipient > 0, "The amount per recipient is too low");
        
        for (uint i = 0; i < recipients.length; i++) {
            payable(address(recipients[i])).transfer(amountPerRecipient);
        }
    }
}(address[] memory recipients) public payable {
        require(msg.sender == owner, "Only owner can distribute funds");
        require(recipients.length > 0, "No recipients specified");
        uint256 amountPerRecipient = msg.value / recipients.length;
        require(amountPerRecipient > 0, "Amount per recipient is too low");

        for (uint i = 0; i < recipients.length; i++) {
            payable(recipients[i]).transfer(amountPerRecipient);
        }
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }
}