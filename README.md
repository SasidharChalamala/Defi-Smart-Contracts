# Portfolio of Smart Contracts

This repository contains core smart contracts developed, tested, and deployed to the Sepolia testnet.

## Projects Included

### 1. Simple AMM (Automated Market Maker)
*   **Description**: A decentralized exchange prototype implementing the constant product formula (x * y = k).
*   **Key Challenge Solved**: Handled fixed-point math scaling (10^18) in Solidity to prevent integer division rounding errors and managed safe state updates for reserves to eliminate reentrancy risks.

### 2. ERC-20 Token & NFT Contracts
*   **Description**: Standard-compliant tokens built to understand asset minting and transfer logic on the Ethereum Virtual Machine (EVM).

## Tech Stack
*   **Languages**: Solidity, Python
*   **Tools**: Remix IDE
*   **Deployment Networks**: Remix VM, Sepolia Testnet
