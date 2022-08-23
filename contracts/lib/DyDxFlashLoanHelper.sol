// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "./Types.sol";
import "./ISoloMargin.sol";
import "../interfaces/IERC20Token.sol";

contract DyDxFlashLoanHelper {
    function marketIdFromTokenAddress(address tokenAddress) internal pure returns (uint256 resultId) {
        assembly {
            switch tokenAddress
            case 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 {
                resultId := 0
            }
            case 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 {
                resultId := 2
            }
            case 0x6B175474E89094C44Da98b954EedeAC495271d0F {
                resultId := 3
            }
            default {
                revert(0, 0)
            }
        }
    }
    function wrapWithDyDx(address requiredToken, uint256 requiredBalance, bool requiredApprove, bytes calldata data) public {
        Types.ActionArgs[] memory operations = new Types.ActionArgs[](3);
        operations[0] = Types.ActionArgs({
            actionType: Types.ActionType.Withdraw,
            accountId: 0,
            amount: Types.AssetAmount({
                sign: false,
                denomination: Types.AssetDenomination.Wei,
                ref: Types.AssetReference.Delta,
                value: requiredBalance
            }),
            primaryMarketId: marketIdFromTokenAddress(requiredToken),
            secondaryMarketId: 0,
            otherAddress: address(this),
            otherAccountId: 0,
            data: ""
        });
        operations[1] = Types.ActionArgs({
            actionType: Types.ActionType.Call,
            accountId: 0,
            amount: Types.AssetAmount({
                sign: false,
                denomination: Types.AssetDenomination.Wei,
                ref: Types.AssetReference.Delta,
                value: 0
            }),
            primaryMarketId: 0,
            secondaryMarketId: 0,
            otherAddress: address(this),
            otherAccountId: 0,
            data: data
        });
        operations[2] = Types.ActionArgs({
            actionType: Types.ActionType.Deposit,
            accountId: 0,
            amount: Types.AssetAmount({
                sign: true,
                denomination: Types.AssetDenomination.Wei,
                ref: Types.AssetReference.Delta,
                value: requiredBalance + (requiredToken == 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 ? 1 : 2)
            }),
            primaryMarketId: marketIdFromTokenAddress(requiredToken),
            secondaryMarketId: 0,
            otherAddress: address(this),
            otherAccountId: 0,
            data: ""
        });

        Types.AccountInfo[] memory accountInfos = new Types.AccountInfo[](1);
        accountInfos[0] = Types.AccountInfo({
            owner: address(this),
            number: 1
        });
        if (requiredApprove) {
          // Approval might be already set or can be set inside of 'operations[1]'
          IERC20Token(requiredToken).approve(
            0x1E0447b19BB6EcFdAe1e4AE1694b0C3659614e4e,
            0xffffffffffffffffffffffffffffffff // Max uint112
          );
        }
        ISoloMargin(0x1E0447b19BB6EcFdAe1e4AE1694b0C3659614e4e).operate(accountInfos, operations);
    }
}