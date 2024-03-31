// pragma solidity ^0.8.20;

// import "@hack/gabaim.sol";
// import "foundry-huff/HuffDeployer.sol";
// import "forge-std/Test.sol";
// import "forge-std/console.sol";

// contract GabaimTest is Test {
//     Gabaim public gabaim;

//     // Setup the testing environment.
//     function setUp() public {
//         gabaim = new Gabaim();
//         payable(address(gabaim)).transfer(1000);
     
//     }
    
//    function testDeposit() public {
//         uint initialBalance = address(gabaim).balance;
//         uint amount = 100 wei;
// address adr2= address(123456);
// vm.prank(adr2);
//  vm.deal(address(adr2), amount);
//         // Send Ether to the Gabaim contract
//         payable(address(gabaim)).transfer(amount);

//         // Check if the balance has increased
//         assertEq(address(gabaim).balance, initialBalance + amount, "Balance should increase after deposit");
//    vm.stopPrank();
//     }
   
//     function testWithdraw() public payable {
//     uint initialBalance = gabaim.getBalance();
//     address adr1= address(1234);
//     vm.prank(adr1);
//     console.log("initialBalance",initialBalance);
//     uint amount = 100 wei;
//     gabaim.withdraw{value: amount}(amount);
//     assertEq(gabaim.getBalance(), initialBalance - amount, "Balance should decrease after withdrawal");
//     vm.stopPrank();
// }

//     function testWithdrawNotMoney() external {
//        uint sum = 2000;
      
//         address adr1= address(1234);
//         vm.prank(adr1);
//         uint before = address(gabaim).balance;
        
//         if (before >= sum) {
//         gabaim.withdraw(sum);
//         uint afterwithdraw = address(gabaim).balance;
//         assertEq(afterwithdraw, before - sum);
//         }
//         vm.stopPrank();
       
//     }
//       function testNotOwnerWithdraw() public {
//         payable(address(gabaim)).transfer(100);
       
//         gabaim.withdraw(100);
//     }
// }

pragma solidity ^0.8.20;

import "@hack/gabaim.sol";
import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract GabaimTest is Test {
    Gabaim public gabaim;

    // Setup the testing environment.
    function setUp() public {
        gabaim = new Gabaim();
        payable(address(gabaim)).transfer(1000);
    }

    // Test adding authorized persons
   function testAddAuthorizedPerson() public {
    // Define a new authorized person
    address newAuth = address(0x456);

    // Check if the new authorized person already exists in any of the three slots
    bool alreadyExists = false;
    if (gabaim.auth1() == newAuth || gabaim.auth2() == newAuth || gabaim.auth3() == newAuth) {
        alreadyExists = true;
    }

    // If the new authorized person doesn't exist, add it
    if (!alreadyExists) {
        gabaim.addAuthorizedPerson(newAuth);
    }

    // Assertions
    if (alreadyExists) {
       assertEq("The address already exists among the authorized persons");
    } else {
        assertEq(gabaim.auth1(), newAuth, "First authorized person should be added successfully");
    }

     }



    // Test repeated addition of authorized persons
    function testRepeatedAddAuthorizedPerson() public {
        address existingAuth = gabaim.auth1();
        gabaim.addAuthorizedPerson(existingAuth);
        assertEq(gabaim.auth1(),existingAuth, "Adding existing authorized person should not change authorization status for auth1");
        assertEq(gabaim.auth2(), existingAuth, "Adding existing authorized person should not change authorization status for auth2");
        assertEq(gabaim.auth3(), existingAuth, "Adding existing authorized person should not change authorization status for auth3");
    }

    // Test withdrawal limits
    function testWithdrawalLimits() public {
        // Set withdrawal limit to 200 wei
        uint withdrawalLimit = 200;
        gabaim.withdraw(withdrawalLimit);
        assertEq(gabaim.getBalance(), 800, "Balance should decrease by withdrawal limit");
    }

    // Test withdrawal edge cases
    function testWithdrawalEdgeCases() public {
        uint initialBalance = gabaim.getBalance();
        
        // Trying to withdraw more than contract balance
        uint amount = initialBalance + 100; 
        gabaim.withdraw(amount);
        assertEq(gabaim.getBalance(), initialBalance, "Balance should remain unchanged if trying to withdraw more than contract balance");

        // Trying to withdraw when balance is insufficient
        uint insufficientAmount = initialBalance + 100; 
        gabaim.withdraw(insufficientAmount);
        assertEq(gabaim.getBalance(), initialBalance, "Balance should remain unchanged if trying to withdraw when balance is insufficient");
    }

    // Test contract balance
    function testContractBalance() public {
        // After deposits and withdrawals, contract balance should match expected value
        // gabaim.deposit{value: 500}();
        gabaim.withdraw(300);
        assertEq(gabaim.getBalance(), 1200, "Contract balance should match expected value");
    }
}
