
near deploy --wasmFile res/fungible_token.wasm --accountId $ID
near call $ID new '{"owner_id": "'$ID'", "total_supply": "1000000000000000000000000", "metadata": { "spec": "ft-1.0.0", "name": "Meleport Token", "symbol": "MeP", "decimals": 18 }}' --accountId $ID

ID = meleport-ft.testnet