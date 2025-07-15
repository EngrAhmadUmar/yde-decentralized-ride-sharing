# RyDe Vehicle Minting Guide

## Overview
This guide walks through minting the first vehicle assets for the RyDe platform using our compiled Aiken smart contract.

## Key Information

### PolicyID
```
41e0e80d13468b1cb2362d20dd81e789c605a87fc77cecc037cd3c7a
```

### Vehicle Details
- **Vehicle ID**: VEHICLE_001
- **Make**: Toyota
- **Model**: Camry Hybrid  
- **Year**: 2023
- **VIN**: 4T1B11HK5KU123456
- **Estimated Value**: 30,000,000 lovelace (30 ADA)
- **Share Price**: 1,000,000 lovelace (1 ADA per share)
- **Total Shares**: 30,000

### Assets to Mint
1. **Vehicle NFT**: `RYDE_NFT_VEHICLE_001` (Quantity: 1)
2. **Fractional Shares**: `RYDE_SHARE_VEHICLE_001` (Quantity: 30,000)

## Prerequisites

### 1. Install cardano-cli
```bash
# Option 1: Using official installer (if available)
curl -sSL https://get.cardano.org/install-cardano-cli | bash

# Option 2: Download from GitHub releases
# Visit: https://github.com/IntersectMBO/cardano-cli/releases
# Download the appropriate binary for your system
```

### 2. Set up Cardano Preprod Environment
```bash
# Set environment variables
export CARDANO_NODE_SOCKET_PATH=/path/to/cardano-node.socket
export CARDANO_NETWORK="--testnet-magic 1"  # For Preprod testnet

# Or use environment file
echo "export CARDANO_NODE_SOCKET_PATH=/path/to/cardano-node.socket" >> ~/.bashrc
echo "export CARDANO_NETWORK=\"--testnet-magic 1\"" >> ~/.bashrc
source ~/.bashrc
```

### 3. Prepare Wallet
- Ensure your Nami wallet has sufficient ADA for minting fees
- Export your wallet's payment address and signing key

## Minting Process

### Step 1: Prepare the Redeemer
Create a redeemer file for the minting transaction:

```json
{
  "constructor": 0,
  "fields": [
    {
      "bytes": "56454849434c455f303031"
    },
    {
      "int": 30000
    },
    {
      "constructor": 0,
      "fields": [
        {
          "bytes": "546f796f7461"
        },
        {
          "bytes": "43616d727920487962726964"
        },
        {
          "int": 2023
        },
        {
          "bytes": "345431423131484b354b55313233343536"
        },
        {
          "int": 30000000
        },
        {
          "int": 1000000
        }
      ]
    }
  ]
}
```

### Step 2: Build the Minting Transaction
```bash
# Build transaction with minting
cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 1 \
  --tx-in <input-utxo> \
  --tx-out <your-address>+<min-ada>+"1 <policy-id>.RYDE_NFT_VEHICLE_001 + 30000 <policy-id>.RYDE_SHARE_VEHICLE_001" \
  --mint "1 <policy-id>.RYDE_NFT_VEHICLE_001 + 30000 <policy-id>.RYDE_SHARE_VEHICLE_001" \
  --mint-script-file validators/vehicle_minting.ak \
  --mint-redeemer-file redeemer.json \
  --metadata-json-file vehicle_metadata.json \
  --change-address <your-address> \
  --out-file tx.raw
```

### Step 3: Sign and Submit
```bash
# Sign the transaction
cardano-cli transaction sign \
  --tx-body-file tx.raw \
  --signing-key-file <your-signing-key> \
  --testnet-magic 1 \
  --out-file tx.signed

# Submit the transaction
cardano-cli transaction submit \
  --tx-file tx.signed \
  --testnet-magic 1
```

## Verification

### Check Transaction Status
```bash
# Get transaction hash from the signed file
cardano-cli transaction txid --tx-file tx.signed

# Query the transaction
cardano-cli query utxo --address <your-address> --testnet-magic 1
```

### Verify Asset Creation
```bash
# Check if assets were minted correctly
cardano-cli query utxo --address <your-address> --testnet-magic 1 | grep "RYDE"
```

## Expected Results

After successful minting, you should see:
1. **1 Vehicle NFT** (`RYDE_NFT_VEHICLE_001`) in your wallet
2. **30,000 Fractional Shares** (`RYDE_SHARE_VEHICLE_001`) in your wallet
3. **Transaction metadata** containing vehicle information
4. **Policy validation** ensuring all business rules were followed

## Business Logic Validation

Our smart contract ensures:
- ✅ Exactly 1 NFT and 30,000 shares are minted
- ✅ Share price is at least 1 ADA (1,000,000 lovelace)
- ✅ Total value matches (shares × share_price = estimated_value)
- ✅ VIN is exactly 17 characters
- ✅ Vehicle year is between 2000-2030
- ✅ Only the specified tokens are minted in the transaction

## Next Steps

1. **Test the minting process** with small amounts first
2. **Verify asset transfer** between different wallet addresses
3. **Test burning functionality** for partial sales
4. **Implement governance features** using the fractional shares
5. **Build the frontend** to interact with the smart contract

## Troubleshooting

### Common Issues
- **Insufficient ADA**: Ensure wallet has enough ADA for fees
- **Policy validation failure**: Check redeemer format and business rules
- **Network connectivity**: Verify connection to Preprod testnet
- **Script compilation**: Ensure Aiken contract compiles without errors

### Getting Help
- Check Cardano documentation: https://docs.cardano.org/
- Aiken documentation: https://aiken-lang.org/
- RyDe project repository: [Your repository URL] 