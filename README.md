# 🚗 RyDe - Decentralized Ride-Sharing Platform PoC

A Proof-of-Concept (PoC) for a decentralized ride-sharing and vehicle ownership platform built on Cardano using Aiken smart contracts. RyDe demonstrates fractional ownership across multiple vehicle types including cars, motorcycles for delivery, and buses for group transportation.

## 🎯 Overview

RyDe demonstrates how blockchain technology can revolutionize transportation by enabling:
- **Fractional vehicle ownership** through NFTs and fungible tokens
- **Multi-vehicle platform** supporting cars, motorcycles, and buses
- **Decentralized ride booking** with smart contract validation
- **Automatic revenue distribution** to vehicle shareholders
- **Transparent governance** for platform decisions

## 🏗️ Architecture

### Smart Contracts (Aiken)
- **Vehicle Minting Policy**: Mints unique NFTs representing physical vehicles
- **Ride Booking Validator**: Handles ride requests, payments, and completion
- **Revenue Distribution**: Automatically distributes ride profits to shareholders
- **Multi-Vehicle Support**: Handles different vehicle types and use cases

### Frontend
- **Responsive HTML Interface**: Demonstrates the platform functionality
- **Multi-Vehicle Booking**: Separate booking forms for each vehicle type
- **Vehicle NFT Display**: Shows all minted vehicle information
- **Service-Specific Features**: Delivery options for motorcycles, group transport for buses

## 🚀 What's Built

### ✅ Completed Features

1. **Vehicle NFT Fleet**
   - **Car**: `RYDE_NFT_VEHICLE_001` - 2023 Toyota Camry Hybrid (30,000 ADA)
   - **Motorcycle**: `RYDE_NFT_MOTORCYCLE_001` - 2024 Honda CB300R (8,000 ADA)
   - **Bus**: `RYDE_NFT_BUS_001` - 2023 Mercedes-Benz Sprinter (50,000 ADA)
   - **Policy ID**: `41e0e80d13468b1cb2362d20dd81e789c605a87fc77cecc037cd3c7a`

2. **Fractional Share Tokens**
   - **Car Shares**: `RYDE_SHARE_VEHICLE_001` (30,000 tokens @ 1 ADA each)
   - **Motorcycle Shares**: `RYDE_SHARE_MOTORCYCLE_001` (16,000 tokens @ 0.5 ADA each)
   - **Bus Shares**: `RYDE_SHARE_BUS_001` (25,000 tokens @ 2 ADA each)
   - **Total Shares**: 71,000 across all vehicles

3. **Smart Contract Infrastructure**
   - Vehicle minting policy in Aiken
   - Ride booking validator
   - Revenue distribution logic (5% platform fee)
   - Multi-vehicle support system

4. **Frontend Interface**
   - Vehicle fleet display
   - Service-specific booking forms
   - Platform statistics dashboard
   - Real-time booking simulation

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
├── index.html               # Frontend interface
└── README.md               # This file
```

## 🛠️ Technical Details

### Smart Contract Features

**Vehicle Minting Policy:**
- Validates vehicle owner authorization
- Ensures proper NFT minting structure
- Links to vehicle metadata
- Supports multiple vehicle types

**Ride Booking Validator:**
- Validates ride completion
- Calculates revenue distribution (95% to owner, 5% platform fee)
- Ensures proper payment outputs
- Handles different service types

### Vehicle Specifications

#### 🚗 Toyota Camry Hybrid (Car)
- **Use Case**: Personal transportation
- **Value**: 30,000 ADA
- **Shares**: 30,000 @ 1 ADA each
- **Features**: Hybrid fuel efficiency, passenger comfort

#### 🏍️ Honda CB300R (Motorcycle)
- **Use Case**: Food & package delivery
- **Value**: 8,000 ADA
- **Shares**: 16,000 @ 0.5 ADA each
- **Features**: 300cc engine, 50kg capacity, 24/7 operation

#### 🚌 Mercedes-Benz Sprinter (Bus)
- **Use Case**: Group transportation & shuttle services
- **Value**: 50,000 ADA
- **Shares**: 25,000 @ 2 ADA each
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

## 🎮 How to Use

### 1. View the Vehicle Fleet
- Open `index.html` in your browser
- See all three vehicles with their details
- View platform statistics

### 2. Book Different Services
- **Car**: Standard ride booking with pickup/destination
- **Motorcycle**: Delivery booking with package type selection
- **Bus**: Group transport with passenger count and service type

### 3. Check Your Wallet
- Open your Nami wallet
- Look for all vehicle NFTs in your assets
- Check for share tokens (if minted as fungible tokens)

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
- **Simulated booking** (no actual blockchain transactions)
- **Basic smart contract validation**
- **Limited vehicle fleet** (3 vehicles)
- **No real-time blockchain integration**

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
- **No real funds**: All transactions use test ADA
- **Basic validation**: Smart contracts have minimal security checks
- **Not production ready**: Requires extensive testing and auditing

## 📚 Resources

### Cardano Development
- [Aiken Documentation](https://aiken-lang.org/)
- [Cardano Developer Portal](https://developers.cardano.org/)
- [CIP-25 Metadata Standard](https://cips.cardano.org/cips/cip25/)

### Tools Used
- **Cardano Tools**: https://cardano-tools.io/
- **Nami Wallet**: https://namiwallet.io/
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