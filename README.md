# 🚗 RyDe - Decentralized Ride-Sharing Platform PoC

A Proof-of-Concept (PoC) for a custodial, stablecoin-based ride-sharing and vehicle ownership platform built on Cardano using Aiken smart contracts. RyDe demonstrates fractional ownership across multiple vehicle types including cars, motorcycles for delivery, and buses for group transportation. All assets and tokens are held by the platform, and user balances are tracked off-chain for regulatory compliance.

## 🎯 Overview

RyDe demonstrates how blockchain technology can revolutionize transportation by enabling:
- **Fractional vehicle ownership** through NFTs and fungible tokens (all held by the platform)
- **Multi-vehicle platform** supporting cars, motorcycles, and buses
- **Custodial asset management** for regulatory compliance
- **Stablecoin-based transactions** (DJED)
- **Backend ledger for user balances and fiat payouts**

## 🏗️ Architecture

### Smart Contracts (Aiken)
- **Vehicle Minting Policy**: Mints unique NFTs representing physical vehicles (to platform wallet)
- **Ride Booking Validator**: Handles ride requests, payments, and completion (all payments to platform wallet)
- **Multi-Vehicle Support**: Handles different vehicle types and use cases

### Backend Ledger (Simulation)
- **User Balances**: Tracks each user's share ownership and earnings in DJED
- **Fiat Payout Simulation**: Users can request fiat payouts, which are logged and simulated in the backend
- **No direct wallet connect**: All user interactions are off-chain for compliance

## 🚀 What's Built

### ✅ Completed Features

1. **Vehicle NFT Fleet**
   - **Car**: `RYDE_NFT_VEHICLE_001` - 2023 Toyota Camry Hybrid (30,000 DJED)
   - **Motorcycle**: `RYDE_NFT_MOTORCYCLE_001` - 2024 Honda CB300R (8,000 DJED)
   - **Bus**: `RYDE_NFT_BUS_001` - 2023 Mercedes-Benz Sprinter (50,000 DJED)
   - **Policy ID**: `41e0e80d13468b1cb2362d20dd81e789c605a87fc77cecc037cd3c7a`

2. **Fractional Share Tokens**
   - **Car Shares**: `RYDE_SHARE_VEHICLE_001` (30,000 tokens @ 1 DJED each)
   - **Motorcycle Shares**: `RYDE_SHARE_MOTORCYCLE_001` (16,000 tokens @ 0.5 DJED each)
   - **Bus Shares**: `RYDE_SHARE_BUS_001` (25,000 tokens @ 2 DJED each)
   - **Total Shares**: 71,000 across all vehicles

3. **Smart Contract Infrastructure**
   - Vehicle minting policy in Aiken
   - Ride booking validator
   - Multi-vehicle support system

4. **Backend Ledger Simulation**
   - User balances and share ownership tracked in a simple backend ledger (see `backend_ledger_sim.py`)
   - Fiat payout requests are simulated and logged

## 📁 Project Structure

```
Ryde/
├── contracts/                 # Aiken smart contracts
│   ├── lib/
│   │   ├── ryde.aiken        # Main contract
│   │   └── ride_booking.aiken # Ride booking logic
│   ├── plutus.json           # Compiled contract
│   └── aiken.toml           # Project configuration
├── vehicle_metadata.json     # Car NFT metadata
├── share_token_metadata.json # Car share token metadata
├── motorcycle_metadata.json  # Motorcycle NFT metadata
├── motorcycle_share_metadata.json # Motorcycle share metadata
├── bus_metadata.json         # Bus NFT metadata
├── bus_share_metadata.json   # Bus share token metadata
├── backend_ledger_sim.py     # Backend ledger simulation (off-chain)
└── README.md               # This file
```

## 🛠️ Technical Details

### Smart Contract Features

**Vehicle Minting Policy:**
- Validates platform wallet authorization
- Ensures proper NFT minting structure
- Links to vehicle metadata
- Supports multiple vehicle types

**Ride Booking Validator:**
- Validates ride completion
- Ensures all payments go to the platform wallet
- Handles different service types

### Backend Ledger Simulation
- Tracks user share ownership and earnings in DJED
- Simulates fiat payout requests and logs them
- No direct on-chain user balances; all assets are held by the platform

### Vehicle Specifications

#### 🚗 Toyota Camry Hybrid (Car)
- **Use Case**: Personal transportation
- **Value**: 30,000 DJED
- **Shares**: 30,000 @ 1 DJED each
- **Features**: Hybrid fuel efficiency, passenger comfort

#### 🏍️ Honda CB300R (Motorcycle)
- **Use Case**: Food & package delivery
- **Value**: 8,000 DJED
- **Shares**: 16,000 @ 0.5 DJED each
- **Features**: 300cc engine, 50kg capacity, 24/7 operation

#### 🚌 Mercedes-Benz Sprinter (Bus)
- **Use Case**: Group transportation & shuttle services
- **Value**: 50,000 DJED
- **Shares**: 25,000 @ 2 DJED each
- **Features**: 15 passengers, WiFi, wheelchair accessible

### Metadata Standards

**Vehicle NFT Metadata (CIP-25):**
- Vehicle specifications (make, model, year, VIN)
- Estimated value and share information
- Platform-specific attributes
- Service-specific features

**Share Token Metadata:**
- Fractional ownership details
- Revenue sharing rights
- Governance voting rights
- Service-specific information
- Custodial holding by platform

## 🎮 How to Use

1. **Run the backend ledger simulation** (`backend_ledger_sim.py`) to simulate user balances and fiat payout requests.
2. **Mint vehicle NFTs and share tokens** using the provided Aiken contracts and Cardano CLI (all assets go to the platform wallet).
3. **Track user balances and payouts** in the backend ledger (off-chain).

## 🔗 Blockchain Verification

### Preprod Testnet Explorers
- **Cardanoscan**: https://preprod.cardanoscan.io/
- **Cexplorer**: https://preprod.cexplorer.io/

### Search for Your Assets
- Policy ID: `41e0e80d13468b1cb2362d20dd81e789c605a87fc77cecc037cd3c7a`
- Vehicle NFTs: `RYDE_NFT_VEHICLE_001`, `RYDE_NFT_MOTORCYCLE_001`, `RYDE_NFT_BUS_001`
- Share Tokens: `RYDE_SHARE_VEHICLE_001`, `RYDE_SHARE_MOTORCYCLE_001`, `RYDE_SHARE_BUS_001`

## 🚧 PoC Limitations

This is a minimal PoC with the following limitations:
- **Simulated backend ledger** (no real fiat payouts)
- **Basic smart contract validation**
- **Limited vehicle fleet** (3 vehicles)
- **No real-time blockchain integration**
- **All assets held by platform (custodial)**

## 🔮 Future Enhancements

### Phase 2 Features
- **Real blockchain integration** for all vehicle types
- **Share trading marketplace**
- **Governance voting system**
- **Driver verification system**
- **Insurance integration**

### Phase 3 Features
- **Mobile application**
- **Advanced revenue distribution**
- **Cross-chain compatibility**
- **Advanced analytics dashboard**
- **Fleet management system**

## 🛡️ Security Considerations

- **Testnet only**: This PoC runs on Cardano Preprod testnet
- **No real funds**: All transactions use test DJED
- **Basic validation**: Smart contracts have minimal security checks
- **Not production ready**: Requires extensive testing and auditing

## 📚 Resources

### Cardano Development
- [Aiken Documentation](https://aiken-lang.org/)
- [Cardano Developer Portal](https://developers.cardano.org/)
- [CIP-25 Metadata Standard](https://cips.cardano.org/cips/cip25/)

### Tools Used
- **Cardano Tools**: https://cardano-tools.io/
- **Aiken Compiler**: https://aiken-lang.org/

## 🤝 Contributing

This is a PoC demonstration. For production use:
1. Conduct thorough security audits
2. Implement comprehensive testing
3. Add proper error handling
4. Enhance smart contract validation
5. Build production-ready infrastructure

## 📄 License

This project is for educational and demonstration purposes only.

---

**RyDe PoC** - Demonstrating the future of decentralized transportation on Cardano 🚗🏍️🚌⚡ 