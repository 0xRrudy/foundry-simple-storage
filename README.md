# SimpleStorage

A simple Solidity smart contract for storing a favorite number and mapping individual users to their preferred numbers.

## Features

- **Store & Retrieve Numbers:** Easily update and view the global favorite number.
- **User Preference Registration:** Add a user by name alongside their favorite number.
- **Lookup Functionality:** Query any user's favorite number by their name using a mapping.

## Getting Started

### Prerequisites

Make sure you have [Foundry](https://getfoundry.sh/) installed.

### Installation

Clone the repository and navigate into the project directory:

git clone <REPOSITORY_URL>
cd <PROJECT_FOLDER>

Build the contracts:

forge build

## Local Deployment

First, spin up a local Anvil node in a separate terminal:
```
anvil
```
In a new terminal window, execute the deployment script:
```
forge script script/DeploySimpleStorage.s.sol:DeploySimpleStorage \
  --rpc-url [http://127.0.0.1:8545](http://127.0.0.1:8545) \
  --private-key <PRIVATE_KEY> \
  --broadcast
```
## Core Functions

store(uint256)                   // Stores a new favorite number
retrieve()                       // Returns the currently stored favorite number
addPerson(string, uint256)       // Adds a person's name and their favorite number
nameToFavoriteNumber(string)     // Looks up a favorite number by person's name

## License

MIT
