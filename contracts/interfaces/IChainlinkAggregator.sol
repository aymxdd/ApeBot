// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

interface IChainlinkAggregator {
  function latestAnswer() external view returns (int256);
}