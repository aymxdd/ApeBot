// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

contract IAlphaLeakConstants {
    // Mainnet addresses
    // address internal constant TOKEN_WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    // address internal constant TOKEN_USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    // address internal constant TOKEN_DAI  = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

    // address internal constant PROXY_DYDX  = 0x1E0447b19BB6EcFdAe1e4AE1694b0C3659614e4e;
    // address internal constant ORACLE_USDC = 0x986b5E1e1755e3C2440e960477f25201B0a8bbD4;
    // address internal constant ORACLE_DAI  = 0x773616E4d11A78F511299002da57A0a94577F1f4;
    
    // Testnet addresses
    address internal constant TOKEN_WETH = 0xd0A1E359811322d97991E03f863a0C30C2cF029C;
    address internal constant TOKEN_USDC = 0xc2569dd7d0fd715B054fBf16E75B001E5c0C1115;
    address internal constant TOKEN_DAI  = 0x04DF6e4121c27713ED22341E7c7Df330F56f289B;

    address internal constant PROXY_DYDX  = 0x4EC3570cADaAEE08Ae384779B0f3A45EF85289DE;
    address internal constant ORACLE_USDC = 0x9211c6b3BF41A10F78539810Cf5c64e1BB78Ec60;
    address internal constant ORACLE_DAI  = 0x777A68032a88E5A84678A77Af2CD65A7b3c0775a;

    uint256 internal constant FLAG_TRANSFORM_ETH_TO_WETH_BEFORE_APE = 0x1;
    uint256 internal constant FLAG_TRANSFORM_WETH_TO_ETH_BEFORE_APE = 0x2;
    uint256 internal constant FLAG_TRANSFORM_ETH_TO_WETH_AFTER_APE  = 0x4;
    uint256 internal constant FLAG_TRANSFORM_WETH_TO_ETH_AFTER_APE  = 0x8;

    uint256 internal constant FLAG_FLASH_DYDY_WETH     = 0x10;
    uint256 internal constant FLAG_FLASH_DYDY_USDC     = 0x20;
    uint256 internal constant FLAG_FLASH_DYDY_DAI      = 0x40;

    uint256 internal constant FLAG_WETH_ACCOUNTING     = 0x80;
    uint256 internal constant FLAG_USDC_ACCOUNTING     = 0x100;
    uint256 internal constant FLAG_DAI_ACCOUNTING      = 0x200;


    uint256 internal constant FLAG_EXIT_WETH           = 0x400;
    uint256 internal constant FLAG_PAY_COINBASE_SHARE  = 0x800;
    uint256 internal constant FLAG_PAY_COINBASE_AMOUNT = 0x1000;


    uint256 internal constant FLAG_RETURN_WETH         = 0x2000;
    uint256 internal constant FLAG_RETURN_USDC         = 0x4000;
    uint256 internal constant FLAG_RETURN_DAI          = 0x8000;
}