// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Will {
    address owner;
    uint fortune;
    bool deceased = false;

    // list of beneficiaries of inheritance
    address payable[] beneficiaries;

    // map through inheritance
    mapping (address => uint) inheritance;
    
    event BeneficiaryAdded(address indexed beneficiary, uint amount);
    event Sent(address from, address to, uint amount);

    constructor() payable {
        owner = msg.sender;
        fortune = msg.value;
        deceased = false;
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "only the owner can call this function");
        _;
    }

    modifier mustBeDeceased(){
        require(deceased == true);
        _;
    }

    // set inheritance for each beneficiary
    function addBeneficieries(address payable wallet, uint amount) public onlyOwner {
        require(amount > 0, "The amount must be greater than 0");

        beneficiaries.push(wallet);
        inheritance[wallet] = amount;

        emit BeneficiaryAdded(wallet, amount);
    }

    function getBeneficiaryCount() external view returns (uint){
       return beneficiaries.length;
    }

    // pay each beneficiary based on their wallets
    function payout() private mustBeDeceased {
        for(uint i = 0; i < beneficiaries.length; i++){
            // transfer funds from contract address to receiver address
            address payable beneficiary = beneficiaries[i];
            uint amount = inheritance[beneficiary]; // Retrieve the amount for this beneficiary
            beneficiary.transfer(amount);

            emit Sent(owner, beneficiary, amount); // Emit event for this transfer
        }

    }

    // switch function
    function hasDeceased() public onlyOwner {
        deceased = true;
        payout();
    }

}