#!/usr/bin/env bash
set -e

echo "Building token_contract..."

cargo build --manifest-path contracts/token_contract/Cargo.toml \
  --target wasm32-unknown-unknown \
  --release

WASM_PATH="contracts/token_contract/target/wasm32-unknown-unknown/release/token_contract.wasm"

echo "Build complete: $WASM_PATH"
