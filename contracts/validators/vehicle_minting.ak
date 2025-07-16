use cardano/assets.{PolicyId, AssetName, from_asset, tokens, quantity_of}
use cardano/transaction.{Transaction, Input, Output}
use aiken/collection/list
use aiken/collection/dict
use aiken/primitive/bytearray
use aiken/primitive/int

pub type RyDeAction {
  MintVehicle { 
    vehicle_id: ByteArray,
    total_shares: Int,
    vehicle_metadata: VehicleMetadata
  }
  BurnTokens
}

pub type VehicleMetadata {
  make: ByteArray,
  model: ByteArray,
  year: Int,
  vin: ByteArray,
  estimated_value: Int,
  share_price: Int,
}

validator vehicle_minting {
  mint(redeemer: RyDeAction, policy_id: PolicyId, tx: Transaction) {
    when redeemer is {
      MintVehicle { vehicle_id, total_shares, vehicle_metadata } -> {
        let nft_name = bytearray.concat("RYDE_NFT_", vehicle_id)
        let token_name = bytearray.concat("RYDE_SHARE_", vehicle_id)
        let nft_quantity = quantity_of(tx.mint, policy_id, nft_name)
        let nft_valid = nft_quantity == 1
        let share_quantity = quantity_of(tx.mint, policy_id, token_name)
        let shares_valid = share_quantity == total_shares
        let min_shares = 1000
        let max_shares = 100000
        let shares_in_range = total_shares >= min_shares && total_shares <= max_shares
        let min_share_price = 1000000
        let price_valid = vehicle_metadata.share_price >= min_share_price
        let total_value = total_shares * vehicle_metadata.share_price
        let value_valid = total_value == vehicle_metadata.estimated_value
        let vin_valid = bytearray.length(vehicle_metadata.vin) == 17
        let year_valid = vehicle_metadata.year >= 2000 && vehicle_metadata.year <= 2030
        let mint_list = tokens(tx.mint, policy_id) |> dict.to_pairs
        let only_two_tokens = list.length(mint_list) == 2
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
        let mint_list = tokens(tx.mint, policy_id) |> dict.to_pairs
        list.all(mint_list, fn(pair) { 
          when pair is {
            Pair(_, quantity) -> quantity < 0
          }
        })
      }
    }
  }
} 