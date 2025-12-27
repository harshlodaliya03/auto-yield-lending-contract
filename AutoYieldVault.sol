// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20Minimal {
    function transfer(address to, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract LendingVault {
    IERC20Minimal public immutable asset;
    address public owner;

    uint256 public lenderRatePerBlock;
    uint256 public borrowerRatePerBlock;

    struct Account {
        uint256 collateral;
        uint256 debt;
        uint256 lastAccruedBlock;
    }

    mapping(address => Account) private accounts;

    uint256 public totalCollateral;
    uint256 public totalDebt;

    modifier onlyOwner() {
        require(msg.sender == owner, "unauthorized");
        _;
    }

    constructor(
        address asset_,
        uint256 lenderRate_,
        uint256 borrowerRate_
    ) {
        require(asset_ != address(0), "zero address");
        asset = IERC20Minimal(asset_);
        lenderRatePerBlock = lenderRate_;
        borrowerRatePerBlock = borrowerRate_;
        owner = msg.sender;
    }

   //USER ACTIONS

    function supply(uint256 amount) external {
        require(amount > 0, "invalid amount");

        _accrue(msg.sender);

        accounts[msg.sender].collateral += amount;
        totalCollateral += amount;

        require(
            asset.transferFrom(msg.sender, address(this), amount),
            "transfer failed"
        );
    }

    function withdraw(uint256 amount) external {
        _accrue(msg.sender);

        Account storage user = accounts[msg.sender];
        require(amount <= user.collateral, "exceeds collateral");
        require(
            user.debt <= (user.collateral - amount) / 2,
            "would break collateral ratio"
        );

        user.collateral -= amount;
        totalCollateral -= amount;

        require(asset.transfer(msg.sender, amount), "transfer failed");
    }

    function borrow(uint256 amount) external {
        _accrue(msg.sender);

        Account storage user = accounts[msg.sender];
        uint256 maxBorrow = user.collateral / 2;

        require(user.debt + amount <= maxBorrow, "insufficient collateral");
        require(
            asset.balanceOf(address(this)) >= amount,
            "insufficient liquidity"
        );

        user.debt += amount;
        totalDebt += amount;

        require(asset.transfer(msg.sender, amount), "transfer failed");
    }

    function repay(uint256 amount) external {
        _accrue(msg.sender);

        Account storage user = accounts[msg.sender];
        require(amount > 0 && amount <= user.debt, "invalid repay");

        user.debt -= amount;
        totalDebt -= amount;

        require(
            asset.transferFrom(msg.sender, address(this), amount),
            "transfer failed"
        );
    }


    function _accrue(address userAddr) internal {
        Account storage user = accounts[userAddr];

        if (user.lastAccruedBlock == 0) {
            user.lastAccruedBlock = block.number;
            return;
        }

        uint256 elapsed = block.number - user.lastAccruedBlock;

        if (elapsed == 0) return;

        if (user.collateral > 0) {
            uint256 yieldAccrued =
                (user.collateral * lenderRatePerBlock * elapsed) / 1e18;
            user.collateral += yieldAccrued;
            totalCollateral += yieldAccrued;
        }

        if (user.debt > 0) {
            uint256 interestAccrued =
                (user.debt * borrowerRatePerBlock * elapsed) / 1e18;
            user.debt += interestAccrued;
            totalDebt += interestAccrued;
        }

        user.lastAccruedBlock = block.number;
    }


    function updateRates(
        uint256 newLenderRate,
        uint256 newBorrowerRate
    ) external onlyOwner {
        lenderRatePerBlock = newLenderRate;
        borrowerRatePerBlock = newBorrowerRate;
    }

    function getAccount(address user)
        external
        view
        returns (uint256 collateral, uint256 debt)
    {
        Account storage a = accounts[user];
        return (a.collateral, a.debt);
    }
}
