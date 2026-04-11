#!/usr/bin/env bash
set -e

# Required env vars:
#   SOROBAN_RPC_URL       - e.g. https://soroban-testnet.stellar.org
#   SOROBAN_NETWORK_PASSPHRASE - e.g. "Test SDF Network ; September 2015"
#   SECRET_KEY            - deployer secret key

: "${SOROBAN_RPC_URL:?Set SOROBAN_RPC_URL}"
: "${SOROBAN_NETWORK_PASSPHRASE:?Set SOROBAN_NETWORK_PASSPHRASE}"
: "${SECRET_KEY:?Set SECRET_KEY}"

WASM="contracts/token_contract/target/wasm32-unknown-unknown/release/token_contract.wasm"

if [ ! -f "$WASM" ]; then
  echo "WASM not found. Run ./scripts/build.sh first."
  exit 1
fi

echo "Deploying token_contract to testnet..."

CONTRACT_ID=$(stellar contract deploy \
  --wasm "$WASM" \
  --source "$SECRET_KEY" \
  --rpc-url "$SOROBAN_RPC_URL" \
  --network-passphrase "$SOROBAN_NETWORK_PASSPHRASE")

echo "Contract deployed!"
echo "Contract ID: $CONTRACT_ID"
