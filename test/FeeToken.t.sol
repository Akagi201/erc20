// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/FeeToken.sol";

contract FeeTokenTest is Test {
    FeeToken public feeToken;
    address public feeAddress;

    function setUp() public {
        feeToken = new FeeToken("FeeToken", "FT", 18, 1000000);
        feeAddress = address(0x200);
        feeToken.setFeeAddress(feeAddress);
    }

    function testInitialTotalSupply() public {
        assertEq(feeToken.totalSupply(), 1000000 * (10 ** 18), "totalSupply should be 1000000");
    }

    function testInitialBalance() public {
        assertEq(feeToken.balanceOf(address(this)), 1000000 * (10 ** 18), "balance should be 1000000");
    }

    function testTransfer() public {
        feeToken.transfer(address(0x100), 1000 * (10 ** 18));
        assertEq(feeToken.balanceOf(address(this)), 999000 * (10 ** 18), "balance should be 999000");
        assertEq(feeToken.balanceOf(feeAddress), 10 * (10 ** 18), "balance should be 999000");
        assertEq(feeToken.balanceOf(address(0x100)), 990 * (10 ** 18), "balance should be 1000");
    }

    function testTransferAndBurn() public {
        feeToken.transferAndBurn(address(0x100), 1000 * (10 ** 18), 100 * (10 ** 18));
        assertEq(feeToken.balanceOf(address(this)), 999000 * (10 ** 18), "balance should be 999000");
        assertEq(feeToken.balanceOf(address(0x100)), 900 * (10 ** 18), "balance should be 1000");
        assertEq(feeToken.totalSupply(), 999900 * (10 ** 18), "totalSupply should be 999000");
    }

    function testMint() public {
        feeToken.addMinter(address(this));
        feeToken.mint(address(0x100), 1000 * (10 ** 18));
        assertEq(feeToken.balanceOf(address(this)), 1000000 * (10 ** 18), "balance should be 1000000");
        assertEq(feeToken.balanceOf(address(0x100)), 1000 * (10 ** 18), "balance should be 1000");
        assertEq(feeToken.totalSupply(), 1001000 * (10 ** 18), "totalSupply should be 1001000");
    }
}
