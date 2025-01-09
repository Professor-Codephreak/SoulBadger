// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/SoulBadger.sol";

contract SoulBadgerTest is Test {
    SoulBound soulBadger;

    address public owner = address(0xABCD);
    address public user = address(0x1234);

    function setUp() public {
        soulBadger = new SoulBound(
            "SoulBadger",
            "SBG",
            "https://example.com/metadata/"
        );
    }

    function testSafeMint() public {
        soulBadger.safeMint(
            user,
            "HeroicMage",
            "Mage",
            10, // Level
            100, // Health
            50, // Stamina
            20, // Strength
            30, // Intelligence
            25  // Dexterity
        );

        // Verify owner of the token
        assertEq(soulBadger.ownerOf(1), user);

        // Retrieve user identity
        (
            string memory username,
            string memory classType,
            uint32 level,
            uint32 health,
            uint32 stamina,
            uint32 strength,
            uint32 intelligence,
            uint32 dexterity
        ) = soulBadger.getUserIdentity(1);

        assertEq(username, "HeroicMage");
        assertEq(classType, "Mage");
        assertEq(level, 10);
        assertEq(health, 100);
        assertEq(stamina, 50);
        assertEq(strength, 20);
        assertEq(intelligence, 30);
        assertEq(dexterity, 25);
    }

    function testSoulboundBehavior() public {
        soulBadger.safeMint(
            user,
            "HeroicMage",
            "Mage",
            10, // Level
            100, // Health
            50, // Stamina
            20, // Strength
            30, // Intelligence
            25  // Dexterity
        );

        vm.prank(user);
        vm.expectRevert("Err: token transfer is BLOCKED");
        soulBadger.transferFrom(user, owner, 1);
    }
}
