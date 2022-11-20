ID_NFT=nft-meleport-contract-deploy1.testnet
ID=user_owner1.testnet
# Mint for alice_player.testnet
near call $ID_NFT nft_mint '{"token_id": "USP_S", "receiver_id": "alice_player.testnet", "metadata": {"title": "USP-S | Cortex", "description": "CSGO", "media": "https://s.swap.gg/pGNypAIF_HPhoh6hWGxKF.jpg"}}' --deposit 0.1 --accountId test_nft2.testnet

near call $ID_NFT nft_mint '{"token_id": "Souvenir_Galil_AR", "receiver_id": "alice_player.testnet", "metadata": {"title": "Souvenir Galil AR | Cold Fusion", "description": "CSGO", "media": "https://s.swap.gg/qeeaEmiMVpU8OozhoUCMM.jpg"}}' --deposit 0.1 --accountId test_nft2.testnet

near call $ID_NFT nft_mint '{"token_id": "AWP", "receiver_id": "alice_player.testnet", "metadata": {"title": "AWP_Phobos", "description": "CSGO", "media": "https://s.swap.gg/-_2ujV4oEfeSnJer_32Fx.jpg"}}' --deposit 0.1 --accountId test_nft2.testnet

near call $ID_NFT nft_mint '{"token_id": "StatTrak_SSG_08", "receiver_id": "alice_player.testnet", "metadata": {"title": "StatTrak_SSG_08", "description": "CSGO", "media": "https://s.swap.gg/ZlkLcAm64tErF0mzsyZ6q.jpg"}}' --deposit 0.1 --accountId test_nft2.testnet

near call $ID_NFT nft_mint '{"token_id": "Provocation_of_Ruin", "receiver_id": "alice_player.testnet", "metadata": {"title": "Provocation_of_Ruin", "description": "DOTA", "media": "https://github.com/xuvadumong/MELEPORT_DemoGame/blob/main/Source_Img/DOTA01.png?raw=true"}}' --deposit 0.1 --accountId test_nft2.testnet

near call $ID_NFT nft_mint '{"token_id": "Artificer_Hammer", "receiver_id": "alice_player.testnet", "metadata": {"title": "Artificer_Hammer", "description": "DOTA", "media": "https://github.com/xuvadumong/MELEPORT_DemoGame/blob/main/Source_Img/DOTA02.png?raw=true"}}' --deposit 0.1 --accountId test_nft2.testnet





