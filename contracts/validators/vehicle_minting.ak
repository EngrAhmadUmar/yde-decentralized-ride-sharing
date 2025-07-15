use cardano/assets.{PolicyId, AssetName, from_asset, tokens, quantity_of}
use cardano/transaction.{Transaction, Input, Output}
use aiken/collection/list
use aiken/collection/dict
use aiken/primitive/bytearray
use aiken/primitive/int

// RyDe Vehicle Minting Policy
// This policy handles the creation of vehicle NFTs and fractional ownership tokens

// Redeemer types for different minting actions
pub type RyDeAction {
  MintVehicle { 
    vehicle_id: ByteArray,
    total_shares: Int,
    vehicle_metadata: VehicleMetadata
  }
  BurnTokens
}

// Vehicle metadata structure
pub type VehicleMetadata {
  make: ByteArray,
  model: ByteArray,
  year: Int,
  vin: ByteArray,
  estimated_value: Int,
  share_price: Int, // In ADA lovelace
}

validator vehicle_minting {
  mint(redeemer: RyDeAction, policy_id: PolicyId, tx: Transaction) {
    when redeemer is {
      MintVehicle { vehicle_id, total_shares, vehicle_metadata } -> {
        // Create asset names
        let nft_name = bytearray.concat("RYDE_NFT_", vehicle_id)
        let token_name = bytearray.concat("RYDE_SHARE_", vehicle_id)
        
        // Check that exactly one NFT is minted
        let nft_quantity = quantity_of(tx.mint, policy_id, nft_name)
        let nft_valid = nft_quantity == 1
        
        // Check that exactly the specified number of shares are minted
        let share_quantity = quantity_of(tx.mint, policy_id, token_name)
        let shares_valid = share_quantity == total_shares
        
        // Validate minimum requirements
        let min_shares = 1000 // Minimum 1000 shares per vehicle
        let max_shares = 100000 // Maximum 100,000 shares per vehicle
        let shares_in_range = total_shares >= min_shares && total_shares <= max_shares
        
        // Validate share price (minimum 1 ADA = 1,000,000 lovelace)
        let min_share_price = 1000000
        let price_valid = vehicle_metadata.share_price >= min_share_price
         
        // Validate that total value makes sense
        let total_value = total_shares * vehicle_metadata.share_price
        let value_valid = total_value == vehicle_metadata.estimated_value
        
        // Validate VIN format (17 characters)
        let vin_valid = bytearray.length(vehicle_metadata.vin) == 17
        
        // Validate year (reasonable range)
        let year_valid = vehicle_metadata.year >= 2000 && vehicle_metadata.year <= 2030
        
        // Ensure only these two tokens are minted in this transaction
        let mint_list = tokens(tx.mint, policy_id) |> dict.to_pairs
        let only_two_tokens = list.length(mint_list) == 2
        
        // Check that the minted tokens are exactly what we expect
        let contains_nft = list.any(mint_list, fn(pair) { 
          when pair is {
            Pair(name, quantity) -> name == nft_name && quantity == 1
          }
        })
        
        let contains_shares = list.any(mint_list, fn(pair) { 
          when pair is {
            Pair(name, quantity) -> name == token_name && quantity == total_shares
          }
        })
        
        // All validations must pass
        nft_valid && 
        shares_valid && 
        shares_in_range && 
        price_valid && 
        value_valid && 
        vin_valid && 
        year_valid && 
        only_two_tokens && 
        contains_nft && 
        contains_shares
      }
      
      BurnTokens -> {
        // For burning, we allow any amount to be burned
        // This enables partial sales or vehicle retirement
        let mint_list = tokens(tx.mint, policy_id) |> dict.to_pairs
        
        // Check that all quantities are negative (burning)
        list.all(mint_list, fn(pair) { 
          when pair is {
            Pair(_, quantity) -> quantity < 0
          }
        })
      }
    }
  }
} 