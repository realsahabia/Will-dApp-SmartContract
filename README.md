# Will Smart Contract

This is a basic Will smart contract that facilitates the distribution of an owner's fortune to designated beneficiaries upon the owner's demise.

## Features

- Add beneficiaries along with the amounts they are set to inherit.
- Mark the owner as deceased to trigger the distribution of the fortune to the beneficiaries.
- Transfer funds to beneficiaries securely upon the owner's demise.

## Usage

### Interacting with the Contract

1. Deploy the Contract: Deploy the Will contract on an Ethereum network of your choice.

2. Add Beneficiaries: As the owner of the contract, use the `addBeneficiaries` function to add beneficiaries along with the amounts they are set to inherit.

3. Mark the Owner as Deceased: When the owner passes away, call the `hasDeceased` function to trigger the distribution of the fortune to the beneficiaries.

4. Claim Inheritance: Beneficiaries can claim their inheritance by withdrawing the transferred funds from the contract.
