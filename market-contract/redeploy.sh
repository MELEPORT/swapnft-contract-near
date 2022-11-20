cargo check
cargo build
./build.sh
near delete nft-market.test_nft2.testnet test_nft2.testnet
near create-account nft-market.test_nft2.testnet --masterAccount test_nft2.testnet --initialBalance 5
near deploy --wasmFile ../out/market-contract.wasm --accountId nft-market.test_nft2.testnet --initFunction new --initArgs '{"owner_id": "test_nft2.testnet"}'
near view nft-market.test_nft2.testnet get_supply_sales
near view nft-tutorial.test_nft2.testnet nft_supply_for_owner '{"account_id": "test_nft2.testnet"}'
near view nft-tutorial.test_nft2.testnet nft_token '{"token_id": "VBI_NFT#01"}'
near call nft-market.test_nft2.testnet storage_deposit '{"account_id": "test_nft2.testnet"}' --accountId test_nft2.testnet --deposit 0.1
near call nft-tutorial.test_nft2.testnet nft_approve '{"token_id": "VBI_NFT#01", "account_id": "nft-market.test_nft2.testnet", "msg": "{\"sale_conditions\":{\"is_native\":false,\"contract_id\":\"meleport-ft.testnet\",\"decimals\":\"18\",\"amount\":\"1000000000000000000\"}}"}' --accountId test_nft2.testnet --deposit 0.1
near view nft-market.test_nft2.testnet get_sales '{"from_index": "0", "limit": 10}'
# Mint new token
near call nft-market.test_nft2.testnet storage_deposit '{"account_id": "user_owner1.testnet"}' --accountId user_owner1.testnet --deposit 0.1
near call nft-tutorial.test_nft2.testnet nft_mint '{"token_id": "BNB", "receiver_id": "user_owner1.testnet", "metadata": {"title": "BNB", "description": "BNB", "media": "https://s2.coinmarketcap.com/static/img/coins/64x64/1839.png"}}' --deposit 0.1 --accountId user_owner1.testnet
near call nft-tutorial.test_nft2.testnet nft_approve '{"token_id": "BNB", "account_id": "nft-market.test_nft2.testnet", "msg": "{\"sale_conditions\":{\"is_native\":false,\"contract_id\":\"meleport-ft.testnet\",\"decimals\":\"18\",\"amount\":\"1000000000000000000\"}}"}' --accountId user_owner1.testnet --deposit 0.1
near call nft-market.test_nft2.testnet markdown_swap_token '{"nft_contract_id": "nft-tutorial.test_nft2.testnet", "token_id": "BNB", "is_swap": true}' --account_id test_nft2.testnet
near view nft-market.test_nft2.testnet get_sales '{"from_index": "0", "limit": 10}'
cd ../
cd nft-contract/
