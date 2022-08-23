// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "./Types.sol";

contract ISoloMargin {
    function operate(Types.AccountInfo[] memory accounts, Types.ActionArgs[] memory actions) public {}
    function getMarketTokenAddress(uint256 marketId) public view returns (address) {}
}