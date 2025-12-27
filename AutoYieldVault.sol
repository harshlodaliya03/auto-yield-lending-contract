// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address user) external view returns (uint256);
}

contract AutoYieldVault {
    IERC20 public immutable depositToken;
    address public owner;

    uint256 public totalDeposits;
    uint256 public rewardRatePerBlock;

    struct UserInfo {
        uint256 balance;
        uint256 lastBlock;
    }

    mapping(address => UserInfo) public users;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(address _token, uint256 _rewardRate) {
        depositToken = IERC20(_token);
        rewardRatePerBlock = _rewardRate;
        owner = msg.sender;
    }

    function deposit(uint256 amount) external {
        require(amount > 0, "Zero deposit");

        _updateYield(msg.sender);

        depositToken.transferFrom(msg.sender, address(this), amount);

        users[msg.sender].balance += amount;
        totalDeposits += amount;
    }

    function withdraw(uint256 amount) external {
        _updateYield(msg.sender);

        require(users[msg.sender].balance >= amount, "Insufficient");

        users[msg.sender].balance -= amount;
        totalDeposits -= amount;

        depositToken.transfer(msg.sender, amount);
    }

    function _updateYield(address user) internal {
        UserInfo storage u = users[user];

        if (u.balance > 0) {
            uint256 blocksPassed = block.number - u.lastBlock;
            uint256 reward = blocksPassed * rewardRatePerBlock * u.balance / 1e18;

            u.balance += reward;
            totalDeposits += reward;
        }

        u.lastBlock = block.number;
    }

    function setRewardRate(uint256 newRate) external onlyOwner {
        rewardRatePerBlock = newRate;
    }
}
