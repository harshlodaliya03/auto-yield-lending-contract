<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
</head>
<body>

<h1>Lending & Borrowing Auto-Yield Contract</h1>



<hr>

<h2>Contracts</h2>

<h3>1. TestToken.sol</h3>
<ul>
  <li>ERC-20 style token for testing</li>
  <li>Initial supply minted to deployer</li>
  <li>Supports transfer, approve, transferFrom</li>
</ul>

<h3>2. LendingVault.sol</h3>
<ul>
  <li>Users supply tokens as collateral</li>
  <li>Borrowing allowed based on collateral</li>
  <li>Interest accrues over time</li>
  <li>Withdrawals blocked if collateral becomes unsafe</li>
  <li>Repayment reduces outstanding debt</li>
</ul>

<hr>

<h2>User Flow</h2>
<ol>
  <li>Deploy TestToken</li>
  <li>Deploy LendingVault</li>
  <li>Approve tokens</li>
  <li>Supply tokens</li>
  <li>Borrow tokens</li>
  <li>Check account status</li>
  <li>Repay loan</li>
  <li>Withdraw tokens</li>
</ol>

<hr>

<h2>Screenshots</h2>

<h3>1: Deploy TestToken</h3>
<img src="https://github.com/user-attachments/assets/b4e5f103-0763-4c4b-84bb-45cb3e0d1833" width="300">
<p>Initial supply entered in Remix.</p>
<img src="https://github.com/user-attachments/assets/6bb64036-d412-4599-9d42-869073c0e184" width="900">
<p>Deployment transaction confirmed.</p>

<h3>2: Verify Token Balance</h3>
<img src="https://github.com/user-attachments/assets/d8dafbdd-a3b1-4e3a-a448-bc8d241c7c97" width="300">
<p>Calling balanceOf.</p>
<img src="https://github.com/user-attachments/assets/cfe2f730-e799-419e-b0df-d6b7132f595d" width="700">
<p>Decoded token balance output.</p>

<h3>3: Deploy LendingVault</h3>
<img src="https://github.com/user-attachments/assets/1d1d2bb9-e9b6-4e88-ad91-0f5595000fdd" width="300">
<p>Constructor parameters entered.</p>
<img src="https://github.com/user-attachments/assets/b9faede4-5772-4302-95a5-9f97ebebb9df" width="900">
<p>LendingVault deployed successfully.</p>

<h3>4: Approve Tokens</h3>
<img src="https://github.com/user-attachments/assets/20636e54-5fcb-4ee2-aed9-89ff4e1cdfca" width="300">
<p>Approving vault to spend tokens.</p>
<img src="https://github.com/user-attachments/assets/284a462a-591a-42dc-9c43-a22c2524339c" width="900">
<p>Approval transaction confirmed.</p>

<h3>5: Supply Tokens</h3>
<img src="https://github.com/user-attachments/assets/2299abd3-f6e6-426e-9e1e-da88ef5802d8" width="300">
<p>Supplying tokens to the vault.</p>
<img src="https://github.com/user-attachments/assets/49bf8888-4a99-4791-a4d4-00f106dc156e" width="900">
<p>Supply transaction successful.</p>

<h3>6: Check User Account</h3>
<img src="https://github.com/user-attachments/assets/e836e329-8223-4a61-9ab1-773c710e3239" width="300">
<p>Calling getAccount.</p>
<img src="https://github.com/user-attachments/assets/a38d720a-3a45-4050-8466-8df64db42c84" width="900">
<p>Collateral and debt values displayed.</p>

<h3>7: Borrow Tokens</h3>
<img src="https://github.com/user-attachments/assets/13e1d29f-169f-41b5-95a6-b48096cb00e1" width="300">
<p>Borrow amount entered.</p>
<img src="https://github.com/user-attachments/assets/88b30e16-114f-4346-8dda-03dd99b7e9c6" width="900">
<p>Borrow transaction successful.</p>

<h3>8: Repay Loan</h3>
<img src="https://github.com/user-attachments/assets/857a22eb-0135-43d4-aecb-ef1b7e9540ad" width="300">
<p>Repayment amount entered.</p>
<img src="https://github.com/user-attachments/assets/1bb097c4-f229-49b7-b931-dabc859e70b1" width="900">
<p>Repayment confirmed.</p>

<h3>9: Withdraw Tokens</h3>
<img src="https://github.com/user-attachments/assets/f694e31e-ab33-4f97-a4bc-1d5885294b50" width="300">
<p>Withdraw request.</p>
<img src="https://github.com/user-attachments/assets/a11906cc-6b24-427d-b9ea-cff71a5eddc3" width="900">
<p>Withdraw succeeds or reverts based on collateral safety.</p>

</body>
</html>
