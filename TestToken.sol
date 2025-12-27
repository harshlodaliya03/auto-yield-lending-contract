// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TestToken {
    string public name = "TestToken";
    string public symbol = "TT";
    uint8 public decimals = 18;

    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 initialSupply) {
        require(initialSupply > 0, "initial supply must be greater than zero");

        totalSupply = initialSupply;
        balanceOf[msg.sender] = initialSupply;

        emit Transfer(address(0), msg.sender, initialSupply);
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        require(to != address(0), "cannot transfer to zero address");
        require(amount > 0, "transfer amount must be greater than zero");

        uint256 senderBalance = balanceOf[msg.sender];
        require(senderBalance >= amount, "insufficient balance");

        balanceOf[msg.sender] = senderBalance - amount;
        balanceOf[to] += amount;

        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        require(spender != address(0), "cannot approve zero address");

        allowance[msg.sender][spender] = amount;

        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool) {
        require(from != address(0), "invalid sender");
        require(to != address(0), "invalid recipient");
        require(amount > 0, "transfer amount must be greater than zero");

        uint256 currentAllowance = allowance[from][msg.sender];
        require(currentAllowance >= amount, "allowance exceeded");
        require(balanceOf[from] >= amount, "balance too low");

        allowance[from][msg.sender] = currentAllowance - amount;

        balanceOf[from] -= amount;
        balanceOf[to] += amount;

        emit Transfer(from, to, amount);
        return true;
    }
}
