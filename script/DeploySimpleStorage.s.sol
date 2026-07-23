// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

/// @title DeploySimpleStorage
/// @notice A Foundry script that deploys the SimpleStorage contract.
contract DeploySimpleStorage is Script {
    /// @notice Deploys a new SimpleStorage contract.
    /// @return simpleStorage The deployed SimpleStorage contract instance.
    function run() external returns (SimpleStorage) {
        // Start broadcasting transactions to the network.
        vm.startBroadcast();

        // Instantiate and deploy the SimpleStorage contract.
        SimpleStorage simpleStorage = new SimpleStorage();

        // Stop broadcasting transactions.
        vm.stopBroadcast();

        return simpleStorage;
    }
}
