# Real Estate Tokenization Smart Contract

Production-ready ERC20 smart contract for tokenizing real estate assets into transferable blockchain shares.

---

## Overview
RealEstate is an ERC20-based token representing fractional ownership of real estate assets.  
The contract provides secure minting and burning controlled exclusively by the owner.

---

## Features
- ERC20 compliant
- Custom decimals support
- Owner-restricted mint & burn
- Clean architecture
- Gas-efficient design
- Fully testable with Foundry

---

## Tech Stack
- Solidity ^0.8.20
- Foundry
- OpenZeppelin

---

## Contract Architecture
RealEstate
 ├─ ERC20
 └─ Ownable

---

## Testing
Run tests:
forge test

---

## Deployment
Deploy locally:
anvil

Deploy to network:
forge script script/DeployRealEstate.s.sol --broadcast

---

## Security Design
- Uses audited OpenZeppelin libraries
- Access control via Ownable
- Solidity 0.8 overflow protection

---

## Use Case
Tokenization of real estate assets into blockchain-based transferable ownership shares.

---

## Author
Jacob Adelzadeh  
Smart Contract Developer | Solidity Engineer
