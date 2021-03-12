pragma solidity ^0.5.0;

// lvl 2: tiered split
contract TieredProfitSplitter {
    address payable lead_singer; // original singer and songwriter
    address payable lead_guitarist; // original guitarist and songwriter
    address payable lead_drummer; // original lead_drummer
    address payable lead_bassguitarist; //replacement bass guitar player

    constructor(address payable _one, address payable _two, address payable _three, address payable _four) public {
        lead_singer = _one;
        lead_guitarist = _two;
        lead_drummer = _three;
        lead_bassguitarist = _four;
    }

    // Should always return 0! Use this to test your `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;

    
        // for lead singer 
        amount = points * 30; // "30%" distribution
        total += amount;
        lead_singer.transfer(amount);

       
        // for lead guitarist
        amount = points * 30; // "30%" distribution
        total += amount;
        lead_guitarist.transfer(amount);

        // for lead drummer 

        amount = points * 25; // "25%" distribution
        total += amount;
        lead_drummer.transfer(amount);

         // for lead bass guitarist

        amount = points * 15; // "15%" distribution
        total += amount;
        lead_drummer.transfer(amount);

        lead_singer.transfer(msg.value - total); // lead singer gets the remaining wei
    }

    function() external payable {
        deposit();
    }
}
