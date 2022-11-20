# nft-market.test_nft2.testnet

# Market contract: nft-market-meleport1.testnet
# NFT contract: nft-meleport-contract-deploy1.testnet
ID_MARKET=nft-market-meleport1.testnet
ID_NFT=nft-meleport-contract-deploy1.testnet
ID=user_owner1.testnet
cargo check
cargo build
./build.sh

near deploy --wasmFile ../out/market-contract.wasm --accountId $ID_MARKET --initFunction new --initArgs '{"owner_id": "test_nft2.testnet"}'
near view $ID_MARKET get_supply_sales
near view $ID_NFT nft_supply_for_owner '{"account_id": "test_nft2.testnet"}'
near view $ID_NFT nft_token '{"token_id": "VBI_NFT#01"}'
near call $ID_MARKET storage_deposit '{"account_id": "test_nft2.testnet"}' --accountId test_nft2.testnet --deposit 0.1
near call $ID_NFT nft_approve '{"token_id": "VBI_NFT#01", "account_id": "nft-market-meleport1.testnet", "msg": "{\"sale_conditions\":{\"is_native\":false,\"contract_id\":\"meleport-ft.testnet\",\"decimals\":\"18\",\"amount\":\"1000000000000000000\"}}"}' --accountId test_nft2.testnet --deposit 0.1
near view $ID_MARKET get_sales '{"from_index": "0", "limit": 10}'
# Mint new token
near call $ID_MARKET storage_deposit '{"account_id": "user_owner1.testnet"}' --accountId user_owner1.testnet --deposit 0.1
near call $ID_NFT nft_mint '{"token_id": "BNB", "receiver_id": "user_owner1.testnet", "metadata": {"title": "BNB", "description": "BNB", "media": "https://s2.coinmarketcap.com/static/img/coins/64x64/1839.png"}}' --deposit 0.1 --accountId user_owner1.testnet
near call $ID_NFT nft_approve '{"token_id": "BNB", "account_id": "nft-market-meleport1.testnet", "msg": "{\"sale_conditions\":{\"is_native\":false,\"contract_id\":\"meleport-ft.testnet\",\"decimals\":\"18\",\"amount\":\"1000000000000000000\"}}"}' --accountId user_owner1.testnet --deposit 0.1
near call $ID_MARKET markdown_swap_token '{"nft_contract_id": "$ID_NFT", "token_id": "BNB", "is_swap": true}' --account_id test_nft2.testnet
near view $ID_MARKET get_sales '{"from_index": "0", "limit": 10}'
cd ../
cd nft-contract/