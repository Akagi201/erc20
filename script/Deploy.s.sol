// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.19;

import {CREATE3Script} from "./base/CREATE3Script.sol";
import {FeeToken} from "../src/FeeToken.sol";

contract DeployScript is CREATE3Script {
    constructor() CREATE3Script(vm.envString("VERSION")) {}

    function run() external returns (FeeToken f) {
        uint256 deployerPrivateKey = uint256(vm.envBytes32("PRIVATE_KEY"));

        uint256 param = 123;

        vm.startBroadcast(deployerPrivateKey);

        f = FeeToken(
            create3.deploy(
                getCreate3ContractSalt("FeeToken"), bytes.concat(type(FeeToken).creationCode, abi.encode(param))
            )
        );

        vm.stopBroadcast();
    }
}
