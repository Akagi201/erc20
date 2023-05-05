# erc20

a simple erc20 token contract

## Features

- 支持项目方增发的功能
- 支持销毁的功能
- 支持交易收取手续费至项目方配置的地址
- 支持交易销毁部分代币的功能

## Local Test

```sh
❯ make test
forge test -vvvv
[⠢] Compiling...
No files changed, compilation skipped

Running 5 tests for test/FeeToken.t.sol:FeeTokenTest
[PASS] testInitialBalance() (gas: 7878)
Traces:
  [7878] FeeTokenTest::testInitialBalance()
    ├─ [2605] FeeToken::balanceOf(FeeTokenTest: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496]) [staticcall]
    │   └─ ← 1000000000000000000000000
    └─ ← ()

[PASS] testInitialTotalSupply() (gas: 7632)
Traces:
  [7632] FeeTokenTest::testInitialTotalSupply()
    ├─ [2327] FeeToken::totalSupply() [staticcall]
    │   └─ ← 1000000000000000000000000
    └─ ← ()

[PASS] testMint() (gas: 71853)
Traces:
  [71853] FeeTokenTest::testMint()
    ├─ [24724] FeeToken::addMinter(FeeTokenTest: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496])
    │   └─ ← ()
    ├─ [36243] FeeToken::mint(0x0000000000000000000000000000000000000100, 1000000000000000000000)
    │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: 0x0000000000000000000000000000000000000100, value: 1000000000000000000000)
    │   ├─ emit Mint(to: 0x0000000000000000000000000000000000000100, amount: 1000000000000000000000)
    │   └─ ← ()
    ├─ [2605] FeeToken::balanceOf(FeeTokenTest: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496]) [staticcall]
    │   └─ ← 1000000000000000000000000
    ├─ [605] FeeToken::balanceOf(0x0000000000000000000000000000000000000100) [staticcall]
    │   └─ ← 1000000000000000000000
    ├─ [327] FeeToken::totalSupply() [staticcall]
    │   └─ ← 1001000000000000000000000
    └─ ← ()

[PASS] testTransfer() (gas: 67339)
Traces:
  [67339] FeeTokenTest::testTransfer()
    ├─ [56523] FeeToken::transfer(0x0000000000000000000000000000000000000100, 1000000000000000000000)
    │   ├─ emit Transfer(from: FeeTokenTest: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496], to: 0x0000000000000000000000000000000000000100, value: 990000000000000000000)
    │   ├─ emit Transfer(from: FeeTokenTest: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496], to: 0x0000000000000000000000000000000000000200, value: 10000000000000000000)
    │   └─ ← true
    ├─ [605] FeeToken::balanceOf(FeeTokenTest: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496]) [staticcall]
    │   └─ ← 999000000000000000000000
    ├─ [605] FeeToken::balanceOf(0x0000000000000000000000000000000000000200) [staticcall]
    │   └─ ← 10000000000000000000
    ├─ [605] FeeToken::balanceOf(0x0000000000000000000000000000000000000100) [staticcall]
    │   └─ ← 990000000000000000000
    └─ ← ()

[PASS] testTransferAndBurn() (gas: 50692)
Traces:
  [50692] FeeTokenTest::testTransferAndBurn()
    ├─ [42279] FeeToken::transferAndBurn(0x0000000000000000000000000000000000000100, 1000000000000000000000, 100000000000000000000)
    │   ├─ emit Transfer(from: FeeTokenTest: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496], to: 0x0000000000000000000000000000000000000000, value: 100000000000000000000)
    │   ├─ emit Transfer(from: FeeTokenTest: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496], to: 0x0000000000000000000000000000000000000100, value: 900000000000000000000)
    │   └─ ← true
    ├─ [605] FeeToken::balanceOf(FeeTokenTest: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496]) [staticcall]
    │   └─ ← 999000000000000000000000
    ├─ [605] FeeToken::balanceOf(0x0000000000000000000000000000000000000100) [staticcall]
    │   └─ ← 900000000000000000000
    ├─ [327] FeeToken::totalSupply() [staticcall]
    │   └─ ← 999900000000000000000000
    └─ ← ()

Test result: ok. 5 passed; 0 failed; finished in 725.25µs
```

## Deploy

sepolia

```sh
[⠆] Compiling...
No files changed, compilation skipped
Deployer: 0x258ce53268BEaA9BA97fA6b7790d7555ae4044fc
Deployed to: 0xE91BED8Fb432d94fc13A89815fd0cCC3fF6E8208
Transaction hash: 0x9cb5bdd5abdae23b05d789a47226a2c39c388035ae17258faebc9ecd0c23a750
Starting contract verification...
Waiting for etherscan to detect contract deployment...
Start verifying contract `0xe91bed8fb432d94fc13a89815fd0ccc3ff6e8208` deployed on sepolia

Submitting verification for [src/FeeToken.sol:FeeToken] "0xE91BED8Fb432d94fc13A89815fd0cCC3fF6E8208".

Submitting verification for [src/FeeToken.sol:FeeToken] "0xE91BED8Fb432d94fc13A89815fd0cCC3fF6E8208".

Submitting verification for [src/FeeToken.sol:FeeToken] "0xE91BED8Fb432d94fc13A89815fd0cCC3fF6E8208".

Submitting verification for [src/FeeToken.sol:FeeToken] "0xE91BED8Fb432d94fc13A89815fd0cCC3fF6E8208".
Submitted contract for verification:
        Response: `OK`
        GUID: `fyuwai7cjrswgrntnbcaqr5kvbkbj9gdvdejsxx2yvbycjmrb3`
        URL:
        https://sepolia.etherscan.io/address/0xe91bed8fb432d94fc13a89815fd0ccc3ff6e8208
Contract verification status:
Response: `NOTOK`
Details: `Pending in queue`
Contract verification status:
Response: `OK`
Details: `Pass - Verified`
Contract successfully verified
```

goerli

```sh
[⠆] Compiling...
No files changed, compilation skipped
Deployer: 0x258ce53268BEaA9BA97fA6b7790d7555ae4044fc
Deployed to: 0x31D20C015AFDF3909Bc2E1369909D041d2c323BB
Transaction hash: 0x5431d23dde164057a4656f813afcd141ceb6b22dc90c71cd3e5651c64e393d3a
Starting contract verification...
Waiting for etherscan to detect contract deployment...
Start verifying contract `0x31d20c015afdf3909bc2e1369909d041d2c323bb` deployed on goerli

Submitting verification for [src/FeeToken.sol:FeeToken] "0x31D20C015AFDF3909Bc2E1369909D041d2c323BB".

Submitting verification for [src/FeeToken.sol:FeeToken] "0x31D20C015AFDF3909Bc2E1369909D041d2c323BB".

Submitting verification for [src/FeeToken.sol:FeeToken] "0x31D20C015AFDF3909Bc2E1369909D041d2c323BB".
Submitted contract for verification:
        Response: `OK`
        GUID: `9zy4pwepzvcfzm8qcyifkeippqakrebr92hv3uh7vfhvdij81w`
        URL:
        https://goerli.etherscan.io/address/0x31d20c015afdf3909bc2e1369909d041d2c323bb
Contract verification status:
Response: `NOTOK`
Details: `Pending in queue`
Contract verification status:
Response: `OK`
Details: `Pass - Verified`
Contract successfully verified
```
