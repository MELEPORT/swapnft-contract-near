# nft-market.test_nft2.testnet

# Market contract: nft-market-meleport1.testnet
# NFT contract: nft-meleport-contract-deploy1.testnet

ID_MARKET=nft-market-meleport1.testnet
ID_NFT=nft-meleport-contract-deploy1.testnet
ID=user_owner1.testnet

cargo check
cargo build
./build.sh

# near delete $ID_MARKET test_nft2.testnet
# near delete $ID_NFT test_nft2.testnet

near deploy --wasmFile ../out/nft-contract.wasm --accountId $ID_NFT --initFunction new_default_metadata --initArgs '{"owner_id": "test_nft2.testnet"}'
near view $ID_NFT nft_total_supply
near call $ID_NFT nft_mint '{"token_id": "VBI_NFT#01", "receiver_id": "test_nft2.testnet", "metadata": {"title": "NEAR LOGO", "description": "NEAR LOGGO", "media": "https://s2.coinmarketcap.com/static/img/coins/64x64/6535.png"}}' --deposit 0.1 --accountId test_nft2.testnet
near view $ID_NFT nft_token '{"token_id": "VBI_NFT#01"}'
near call $ID_NFT nft_transfer '{"receiver_id": "user_owner1.testnet", "token_id": "VBI_NFT#01", "approval_id": 0}' --accountId test_nft2.testnet --depositYocto 1
near call $ID_NFT nft_approve '{"token_id": "VBI_NFT#01", "account_id": "test_nft2.testnet"}' --deposit 0.1 --accountId user_owner1.testnet
near call $ID_NFT nft_transfer '{"receiver_id": "test_nft2.testnet", "token_id": "VBI_NFT#01", "approval_id": 0}' --depositYocto 1 --accountId test_nft2.testnet

cd ../
cd market-contract/
cargo check
cargo build
./build.sh
./redeploypublic.sh
