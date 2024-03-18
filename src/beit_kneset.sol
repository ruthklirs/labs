pragma solidity >=0.6.12 <0.9.0;
contract ReceiveEther {
    // Event to log the deposit to blockchain
    event Deposit(address indexed sender, uint256 amount);
    // Event to log the withdrawal from the contract
    event Withdrawal(address indexed recipient, uint256 amount);
    address private owner;
    address private authorizedWithdrawer1;
    address private authorizedWithdrawer2;
    address private authorizedWithdrawer3;
    constructor(address _authorizedWithdrawer1, address _authorizedWithdrawer2, address _authorizedWithdrawer3) {
        require(_authorizedWithdrawer1 != address(0) && _authorizedWithdrawer2 != address(0) && _authorizedWithdrawer3 != address(0), "Authorized withdrawers cannot be zero address");
        owner = msg.sender;
        authorizedWithdrawer1 = _authorizedWithdrawer1;
        authorizedWithdrawer2 = _authorizedWithdrawer2;
        authorizedWithdrawer3 = _authorizedWithdrawer3;
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
        return (_address == owner || _address == authorizedWithdrawer1 || _address == authorizedWithdrawer2 || _address == authorizedWithdrawer3);
    }
}















