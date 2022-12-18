// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import '@openzeppelin\contracts-upgradeable\token\ERC20\ERC20Upgradeable.sol';

contract StblCoinUpgradeable is ERC20Upgradeable {

  // Function to replace the constructor in an upgradeable token contract
  function initialize() external initializer {
    __ERC20_init('StableCoin', 'USD');
  }

  function mint(address account, uint256 amount) external {
    _mint(account, amount);
  }

}
