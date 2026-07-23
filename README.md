# SimpleStorage

A simple Solidity smart contract built with Foundry while completing Cyfrin's Foundry course.

The contract stores a favorite number, registers people with their preferred numbers, and provides direct lookups through a mapping. This project demonstrates the core Solidity concepts used throughout later smart contract development.

- Author: `0xRrudy`
- Development tools: Solidity and Foundry
- Network environment: local Anvil chain
- Repository: [0xRrudy/foundry-simple-storage](https://github.com/0xRrudy/foundry-simple-storage)

> This project is an educational example for learning Solidity and Foundry. It is not intended for production use.

## Course Completion

This project documents the concepts I practiced while completing Cyfrin's Foundry course.

- Student: `0xRrudy`
- Certificate: [Cyfrin Foundry Course Achievement](https://profiles.cyfrin.io/u/0xrrudy/achievements/foundry)

## Features

- Stores and retrieves a favorite number
- Registers a person's name and favorite number
- Stores registered people in a dynamic array
- Looks up a favorite number by name through a mapping
- Includes a Foundry deployment script
- Runs automated formatting and build checks with GitHub Actions

## How It Works

1. `store()` updates the favorite number stored in contract state.
2. `retrieve()` reads and returns the current favorite number.
3. `addPerson()` adds a `Person` struct to the public array.
4. The same function updates `nameToFavoriteNumber` for direct name-based lookup.

## Project Structure

```text
.
├── src/
│   └── SimpleStorage.sol          # Core storage contract
├── script/
│   └── DeploySimpleStorage.s.sol  # Foundry deployment script
├── .github/
│   └── workflows/
│       └── test.yml               # Continuous integration workflow
├── Promise.md                     # Private key safety commitment
├── foundry.toml                   # Foundry project configuration
└── foundry.lock                   # Locked dependency versions
```

## Prerequisites

The following tools are required:

- Git
- Foundry (`forge`, `cast`, and `anvil`)

Verify that Foundry is installed:

```bash
forge --version
cast --version
anvil --version
```

## Installation

Clone the repository with its submodules:

```bash
git clone --recurse-submodules https://github.com/0xRrudy/foundry-simple-storage.git
cd foundry-simple-storage
```

If the repository was cloned without submodules, initialize them:

```bash
git submodule update --init --recursive
```

Build the project:

```bash
forge build
```

## Local Deployment

### 1. Start Anvil

Start a local blockchain in the first terminal:

```bash
anvil
```

### 2. Deploy SimpleStorage

Use one of the private keys displayed by Anvil. Only use an Anvil development key that does not control real funds.

```bash
forge script script/DeploySimpleStorage.s.sol:DeploySimpleStorage \
  --rpc-url http://127.0.0.1:8545 \
  --private-key <anvil-private-key> \
  --broadcast
```

Copy the deployed contract address from the command output.

## Contract Interaction

Set the deployed contract address:

```bash
export SIMPLE_STORAGE_ADDRESS=<deployed-contract-address>
```

Store a favorite number:

```bash
cast send "$SIMPLE_STORAGE_ADDRESS" "store(uint256)" 42 \
  --rpc-url http://127.0.0.1:8545 \
  --private-key <anvil-private-key>
```

Retrieve the stored number:

```bash
cast call "$SIMPLE_STORAGE_ADDRESS" "retrieve()(uint256)" \
  --rpc-url http://127.0.0.1:8545
```

Add a person:

```bash
cast send "$SIMPLE_STORAGE_ADDRESS" "addPerson(string,uint256)" "Alice" 7 \
  --rpc-url http://127.0.0.1:8545 \
  --private-key <anvil-private-key>
```

Look up a person's favorite number:

```bash
cast call "$SIMPLE_STORAGE_ADDRESS" "nameToFavoriteNumber(string)(uint256)" "Alice" \
  --rpc-url http://127.0.0.1:8545
```

## Core Functions

| Function | Description |
| --- | --- |
| `store(uint256)` | Stores a new favorite number |
| `retrieve()` | Returns the currently stored favorite number |
| `addPerson(string,uint256)` | Registers a name and favorite number |
| `listOfPeople(uint256)` | Returns the person stored at an array index |
| `nameToFavoriteNumber(string)` | Looks up a favorite number by name |

## Commands

| Command | Description |
| --- | --- |
| `forge build` | Compile the contract |
| `forge fmt` | Format Solidity files |
| `forge fmt --check` | Verify Solidity formatting |
| `anvil` | Start a local development chain |

## Private Key Safety

Never commit real private keys or seed phrases. The local `.env` file, build artifacts, and broadcast logs are excluded through `.gitignore`.

See [Promise.md](./Promise.md) for the private key safety commitment made during the course.

## Key Learning Outcomes

- Solidity state variables and visibility
- Structs, dynamic arrays, and mappings
- Public getters and view functions
- Contract deployment with Foundry scripts
- Local blockchain development with Anvil
- Contract interaction with Cast
- Git submodules and reproducible Foundry dependencies
- Continuous integration with GitHub Actions

## License

The Solidity source code in this project is licensed under the MIT License.
