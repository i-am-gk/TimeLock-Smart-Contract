# TimeLock Smart Contract

This project is a Solidity-based smart contract that allows users to lock their Ether for a specific amount of time and withdraw it only after the unlock time has passed.

## Features

- Users can deposit Ether with a custom lock time
- Funds remain locked until the specified time
- Users cannot withdraw before unlock time
- Secure withdrawal after time expires
- View deposit details anytime

## Functions

### depositFunds(uint256 _lockTimeInSeconds)

Allows user to deposit Ether and set lock duration.

### withdraw()

Allows user to withdraw funds after unlock time.

### getDepositDetails()

Returns:
- deposited amount
- unlock timestamp

## Tools Used

- Solidity
- Remix IDE
- Ethereum Virtual Machine

## Author

GitHub: https://github.com/i-am-gk
