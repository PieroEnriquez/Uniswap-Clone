// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Chainlink price oracle
interface AggregatorV3Interface {
    function decimals() external view returns (uint8);

    function description() external view returns (string memory);

    function version() external view returns (uint256);

    function getRoundData(uint80 _roundId)
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );

    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );
}

contract EthSwap {

    address public owner;

    AggregatorV3Interface internal priceFeed;

    constructor() {
        // Owner set
        owner = msg.sender;
        
        // ETH / USD
        priceFeed = AggregatorV3Interface(0xA39434A63A52E749F02807ae27335515BA4b07F7);
    }

    function getLatestPrice() public view returns (int) {
        (
            ,
            int price,
            ,
            ,
            
        ) = priceFeed.latestRoundData();

        return price / 1e8;
    }

}
