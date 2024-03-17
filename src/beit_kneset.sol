pragma solidity >=0.6.12 <0.9.0;
contract ReceiveEther {
    // Event to log the deposit to blockchain
    event Deposit(address indexed sender, uint256 amount);
    // Event to log the withdrawal from the contract
    event Withdrawal(address indexed recipient, uint256 amount);
    address private owner;
    address[] private authorizedWithdrawers;
    constructor(address[] memory _authorizedWithdrawers) {
        require(_authorizedWithdrawers.length == 3, "Exactly three authorized withdrawers required");
        owner = msg.sender;
        authorizedWithdrawers = _authorizedWithdrawers;
    }
    // Function to receive Ether
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }
    // Function to check the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    // Function to withdraw Ether from the contract
    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdrawal amount must be greater than 0");
        require(amount <= address(this).balance, "Insufficient contract balance");
        require(isAuthorized(msg.sender), "You are not allowed to withdraw");
        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }
    // Function to check if an address is authorized to withdraw
    function isAuthorized(address _address) private view returns (bool) {
        if (_address == owner) {
            return true;
        }
        for (uint256 i = 0; i < authorizedWithdrawers.length; i++) {
            if (_address == authorizedWithdrawers[i]) {
                return true;
            }
        }
        return false;
    }
}






