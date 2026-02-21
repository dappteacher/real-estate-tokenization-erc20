// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/RealEstate.sol";

contract RealEstateTest is Test {

    RealEstate token;

    address owner = address(this);
    address user = address(1);

    function setUp() public {
        token = new RealEstate("Dubai Property Token","DPT",6);
    }

    function testDecimals() public {
        assertEq(token.decimals(), 6);
    }

    function testMint() public {
        token.mint(user, 1000);
        assertEq(token.balanceOf(user), 1000);
    }

    function testBurn() public {
        token.mint(user, 1000);
        token.burn(user, 400);
        assertEq(token.balanceOf(user), 600);
    }

    function testOnlyOwnerCanMint() public {
        vm.prank(user);
        vm.expectRevert();
        token.mint(user, 1000);
    }
}
