# Soroban Core

A minimal boilerplate for building Soroban smart contracts on Stellar using Rust.

---

## What's Included

- A simple **token contract** with `init`, `mint`, `transfer`, and `balance`
- Build and deploy scripts
- Unit tests

---

## Project Structure

```
soroban-core/
├── contracts/
│   └── token_contract/   # Token contract (Rust + Soroban SDK)
├── scripts/
│   ├── build.sh          # Compile to WASM
│   └── deploy.sh         # Deploy to testnet
└── README.md
```

---

## Prerequisites

- [Rust](https://rustup.rs/) (stable)
- `wasm32-unknown-unknown` target: `rustup target add wasm32-unknown-unknown`
- [Stellar CLI](https://developers.stellar.org/docs/tools/developer-tools/cli/install-cli)

---

## Build

```bash
./scripts/build.sh
```

Output: `contracts/token_contract/target/wasm32-unknown-unknown/release/token_contract.wasm`

---

## Test

```bash
cargo test
```

---

## Deploy

Set environment variables, then run:

```bash
export SOROBAN_RPC_URL="https://soroban-testnet.stellar.org"
export SOROBAN_NETWORK_PASSPHRASE="Test SDF Network ; September 2015"
export SECRET_KEY="your_secret_key"

./scripts/deploy.sh
```

The script prints the deployed contract ID.

---

## Contract API

| Function | Description |
|---|---|
| `init(admin)` | Initialize contract with an admin |
| `mint(to, amount)` | Mint tokens (admin only) |
| `transfer(from, to, amount)` | Transfer tokens between addresses |
| `balance(addr)` | Get token balance |

---

## License

MIT
