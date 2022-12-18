// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import '@openzeppelin/contracts/utils/Strings.sol';
import 'AggregatorV3Interface.sol';
import 'StblCoinUpgradeable.sol';

contract EthSwap {
    address immutable public owner;

    StblCoinUpgradeable private USD;

    bool internal locked;

    modifier noReentrant() {
        require(!locked, "No re-entrancy.");
        locked = true;
        _;
        locked = false;
    }

    event TokenSwap(address account, uint256 tokenGiven, uint256 tokenTaken);

    constructor() {
        // Owner set
        owner = msg.sender;
        
        // ETH: 0xA39434A63A52E749F02807ae27335515BA4b07F7;
        // USDC: 0xAb5c49580294Aff77670F839ea425f5b78ab3Ae7;
    }

    receive() external payable {}

    function getLatestPrice(address _tokenAddress) internal view returns (int price) {
        AggregatorV3Interface oracle = AggregatorV3Interface(_tokenAddress);

        (
            ,
            price,
            ,
            ,
            
        ) = oracle.latestRoundData();
    }

    function swapEthForToken(address _token, uint256 _amount) public payable {
        uint256 price = getLatestPrice(_token);
        if (price > 1e12) {
            uint value = 1e13 / price;
            _amount = _amount * value;
        }
    }

    function swapForEth(address _token, uint256 eth) public payable  {
        
    }

}
