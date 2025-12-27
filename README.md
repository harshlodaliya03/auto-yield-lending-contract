<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
</head>
<body>

  <h1>Auto-Yield Vault</h1>

  <p>
    A simple auto-yield vault built in Solidity to demonstrate core DeFi concepts
    such as ERC-20 approvals, deposits, yield accumulation, and withdrawals.
  </p>

  <p>
    This project was developed and tested using <strong>Remix IDE (VM – London)</strong>
    as part of an internship task.
  </p>

  <hr>

  <h2>Contracts</h2>

  <h3>TestToken.sol</h3>
  <ul>
    <li>ERC-20 style test token</li>
    <li>Used to simulate real token behavior</li>
    <li>Supports the following functions:
      <ul>
        <li><code>transfer</code></li>
        <li><code>approve</code></li>
        <li><code>transferFrom</code></li>
      </ul>
    </li>
  </ul>

  <h3>AutoYieldVault.sol</h3>
  <ul>
    <li>Accepts ERC-20 token deposits</li>
    <li>Tracks user balances internally</li>
    <li>Accrues yield automatically per block</li>
    <li>Allows users to withdraw deposited tokens</li>
  </ul>

  <hr>

  <h2>What the User Does</h2>

  <ul>
    <li>
      <strong>User receives tokens</strong><br>
      Tokens are minted to the user when <code>TestToken</code> is deployed.
    </li>
    <br>
    <li>
      <strong>User approves the vault</strong><br>
      The user allows the vault to spend tokens using <code>approve()</code>.
    </li>
    <br>
    <li>
      <strong>User deposits tokens</strong><br>
      The user calls <code>deposit(amount)</code> on the vault.
    </li>
    <br>
    <li>
      <strong>Vault generates yield automatically</strong><br>
      Yield increases over time based on block numbers.
    </li>
    <br>
    <li>
      <strong>User checks balance</strong><br>
      The user calls <code>users(userAddress)</code> to view the deposited balance
      and last update block.
    </li>
    <br>
    <li>
      <strong>User withdraws tokens</strong><br>
      The user calls <code>withdraw(amount)</code> to receive tokens back.
    </li>
  </ul>

  <hr>

  <h2>Screenshots</h2>


01_testtoken_deployed.png  
<img width="290" height="602" alt="Screenshot 2025-12-27 at 8 27 14 PM" src="https://github.com/user-attachments/assets/1d6ecd5f-3341-4e0b-88ea-e5770f607a93" />
<img width="1049" height="90" alt="Screenshot 2025-12-27 at 8 28 29 PM" src="https://github.com/user-attachments/assets/adcea579-355b-4b01-8ed1-4c5a4fe12ce1" />

02_vault_deployed.png  
<img width="260" height="541" alt="Screenshot 2025-12-27 at 8 27 47 PM" src="https://github.com/user-attachments/assets/01484b4b-d845-46a9-b703-773847eaaa6c" />
<img width="1041" height="91" alt="Screenshot 2025-12-27 at 8 28 50 PM" src="https://github.com/user-attachments/assets/2dd5af89-a934-4866-b0cc-c03975399edd" />

    
03_approve.png             
<img width="283" height="217" alt="Screenshot 2025-12-27 at 8 29 41 PM" src="https://github.com/user-attachments/assets/6116492a-c03a-4740-b419-7b5b769180a7" />
<img width="1039" height="76" alt="Screenshot 2025-12-27 at 8 30 07 PM" src="https://github.com/user-attachments/assets/cf39b8ea-babb-4faa-8fad-6ddccf32cd60" />

04_deposit.png 
<img width="275" height="177" alt="Screenshot 2025-12-27 at 8 30 48 PM" src="https://github.com/user-attachments/assets/9cc0dcdb-0851-4381-8bb6-e62284662842" />
<img width="1062" height="99" alt="Screenshot 2025-12-27 at 8 31 11 PM" src="https://github.com/user-attachments/assets/84084e4d-7f8b-4323-97ad-7bf91494e995" />


05_users.png              
<img width="270" height="123" alt="Screenshot 2025-12-27 at 8 32 08 PM" src="https://github.com/user-attachments/assets/1961a368-37d9-41a8-b0f4-560d45442518" />
<img width="1066" height="495" alt="Screenshot 2025-12-27 at 8 32 41 PM" src="https://github.com/user-attachments/assets/fbd48763-ea2a-4513-a0d7-1bdc09f47f06" />
<img width="1049" height="470" alt="Screenshot 2025-12-27 at 8 32 48 PM" src="https://github.com/user-attachments/assets/487c2aab-53e2-41df-96c2-ff486a51ea18" />





  
