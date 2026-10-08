# Reputation ($REP) — Chrome Extension

Assigning on-chain reputation to X/Twitter accounts.

## What is included

- Chrome Manifest V3 extension
- Embedded wallet generated locally in the extension
- X profile username detection
- Reputation card injected into X profiles
- Give $REP flow
- Sepolia network configuration
- ERC-20 contracts for REP and IMD
- Reputation contract with X user ID + username hash + category
- Minimal local RPC reads/writes using ethers v6

## limitation

The extension currently uses the X username as the identity key because X's stable numeric user ID is not reliably available from the public DOM.

For production, add an authenticated X API/backend resolver and store the stable X user ID on-chain.

## Setup

1. Install Node.js 20+.
2. Deploy the contracts in `contracts/` to Sepolia.
3. Copy the deployed addresses into `extension/config.js`.
4. From Chrome open `chrome://extensions`.
5. Enable Developer mode.
6. Load unpacked and select the `extension/` directory.

The extension generates an embedded wallet on first use and stores the encrypted/private-key material in Chrome local storage for this MVP. This is NOT production wallet security.

## Recommended next steps

- Replace username identity with stable X user ID.
- Add backend/indexer for reputation aggregation.
- Add anti-Sybil weighting.
- Add reputation categories and score calculation.
- Add REP/IMD Sepolia liquidity.
- Add mainnet deployment only after audit and wallet security hardening.
