// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.19;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract FeeToken is ERC20, Ownable {
    uint256 private _totalSupply;
    uint8 private _decimals;

    mapping(address => bool) private _minters;

    address private _feeAddress;

    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);

    constructor(string memory name, string memory symbol, uint8 decimals, uint256 totalSupply) ERC20(name, symbol) {
        _decimals = decimals;
        _totalSupply = totalSupply * (10 ** decimals);
        _mint(msg.sender, _totalSupply);
    }

    function decimals() public view override returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    /// 只有被授权的 minter 才能增发代币到指定地址
    function mint(address to, uint256 amount) public onlyMinter {
        _mint(to, amount);
        emit Mint(to, amount);
    }

    /// 允许持有人销毁自己的代币
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
        emit Burn(msg.sender, amount);
    }

    function setFeeAddress(address feeAddress) public onlyOwner {
        require(feeAddress != address(0), "Invalid fee address");
        _feeAddress = feeAddress;
    }

    /// 转账时收取一定手续费
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        uint256 fee = amount / 100; // 1% fee
        uint256 transferAmount = amount - fee;
        _transfer(msg.sender, recipient, transferAmount);
        if (fee > 0) {
            _transfer(msg.sender, _feeAddress, fee);
        }
        return true;
    }

    /// 转账时销毁部分代币
    function transferAndBurn(address recipient, uint256 amount, uint256 burnAmount) public returns (bool) {
        require(burnAmount > 0, "Burn amount must be greater than zero");
        require(burnAmount <= amount, "Burn amount must be less than or equal to the transfer amount");
        uint256 transferAmount = amount - burnAmount;
        _burn(msg.sender, burnAmount);
        _transfer(msg.sender, recipient, transferAmount);
        return true;
    }

    function addMinter(address minter) public onlyOwner {
        _minters[minter] = true;
    }

    function removeMinter(address minter) public onlyOwner {
        _minters[minter] = false;
    }

    modifier onlyMinter() {
        require(_minters[msg.sender], "Caller is not a minter");
        _;
    }
}
