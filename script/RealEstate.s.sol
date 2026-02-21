// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/RealEstate.sol";

contract DeployRealEstate is Script {

    function run() external {

        vm.startBroadcast();

        new RealEstate(
            "Dubai Property Token",
            "DPT",
            6
        );

        vm.stopBroadcast();
    }
}
