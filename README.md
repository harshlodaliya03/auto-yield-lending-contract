<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
</head>
<body>

  <h1>Auto-Yield Vault</h1>

  <p>
    This project is a simple auto-yield vault written in Solidity. 
    It demonstrates basic DeFi concepts such as ERC-20 approvals, token deposits,
    yield generation over time, and withdrawals.
  </p>

  <p>
    The contracts were developed and tested using <strong>Remix IDE (VM – London)</strong>
    as part of an internship assignment.
  </p>

  <hr>

  <h2>Contracts</h2>

  <h3>TestToken.sol</h3>
  <ul>
    <li>A basic ERC-20 style token used for testing</li>
    <li>Simulates how a real token behaves in a DeFi setup</li>
    <li>Implements standard ERC-20 functions:
      <ul>
        <li><code>transfer</code></li>
        <li><code>approve</code></li>
        <li><code>transferFrom</code></li>
      </ul>
    </li>
  </ul>

  <h3>AutoYieldVault.sol</h3>
  <ul>
    <li>Accepts deposits of ERC-20 tokens</li>
    <li>Stores user balances inside the contract</li>
    <li>Calculates yield automatically based on block numbers</li>
    <li>Allows users to withdraw their deposited tokens</li>
  </ul>

  <hr>

  <h2>How the User Interacts with the Contract</h2>

  <ul>
    <li>
      <strong>Receiving tokens</strong><br>
      When the TestToken contract is deployed, tokens are minted to the user’s address.
    </li>
    <br>

  <li>
      <strong>Approving the vault</strong><br>
      The user gives permission to the vault contract to spend tokens by calling
      <code>approve()</code>.
    </li>
    <br>

   <li>
      <strong>Depositing tokens</strong><br>
      The user deposits tokens into the vault using the <code>deposit(amount)</code> function.
    </li>
    <br>

  <li>
      <strong>Yield generation</strong><br>
      After depositing, the vault updates the user’s balance over time using block numbers.
    </li>
    <br>

  <li>
      <strong>Checking balance</strong><br>
      The user can check their deposited balance and last update block by calling
      <code>users(userAddress)</code>.
    </li>
    <br>

   <li>
      <strong>Withdrawing tokens</strong><br>
      The user can withdraw tokens from the vault by calling <code>withdraw(amount)</code>.
    </li>
  </ul>

  <hr>

  <h2>Screenshots</h2>

  <h4>01_testtoken_deployed.png</h4>
  <p>
    Shows the successful deployment of the TestToken contract along with its contract address.
  </p>
  <img width="290" height="602" src="https://github.com/user-attachments/assets/1d6ecd5f-3341-4e0b-88ea-e5770f607a93" />
  <img width="1049" height="90" src="https://github.com/user-attachments/assets/adcea579-355b-4b01-8ed1-4c5a4fe12ce1" />

  <h4>02_vault_deployed.png</h4>
  <p>
    Shows the deployment of the AutoYieldVault contract with the required constructor parameters.
  </p>
  <img width="260" height="541" src="https://github.com/user-attachments/assets/01484b4b-d845-46a9-b703-773847eaaa6c" />
  <img width="1041" height="91" src="https://github.com/user-attachments/assets/2dd5af89-a934-4866-b0cc-c03975399edd" />

  <h4>03_approve.png</h4>
  <p>
    Shows the user approving the vault contract to spend TestToken on their behalf.
  </p>
  <img width="283" height="217" src="https://github.com/user-attachments/assets/6116492a-c03a-4740-b419-7b5b769180a7" />
  <img width="1039" height="76" src="https://github.com/user-attachments/assets/cf39b8ea-babb-4faa-8fad-6ddccf32cd60" />

  <h4>04_deposit.png</h4>
  <p>
    Shows a successful token deposit transaction into the vault.
  </p>
  <img width="275" height="177" src="https://github.com/user-attachments/assets/9cc0dcdb-0851-4381-8bb6-e62284662842" />
  <img width="1062" height="99" src="https://github.com/user-attachments/assets/84084e4d-7f8b-4323-97ad-7bf91494e995" />

  <h4>05_users.png</h4>
  <p>
    Shows the on-chain user data returned from <code>users(userAddress)</code>, including
    the deposited balance and the last block number used for yield calculation.
  </p>
  <img width="270" height="123" src="https://github.com/user-attachments/assets/1961a368-37d9-41a8-b0f4-560d45442518" />
  <img width="1066" height="495" src="https://github.com/user-attachments/assets/fbd48763-ea2a-4513-a0d7-1bdc09f47f06" />
  <img width="1049" height="470" src="https://github.com/user-attachments/assets/487c2aab-53e2-41df-96c2-ff486a51ea18" />

  <hr>

  <h2>Status</h2>
  <p>
    The project was completed successfully and verified using on-chain contract state
    and transaction logs in Remix.
  </p>

</body>
</html>
