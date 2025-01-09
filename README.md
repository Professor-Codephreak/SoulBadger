# SoulBadger

SoulBadger is a Solidity smart contract derived from erc-5484 to implement a Soulbound Token (SBT) system using the ERC721 NFT standard. Soulbound Tokens are non-transferable NFTs designed to represent permanent and unique user attributes. This contract, tailored for deployment and testing using Foundry, provides a robust implementation of the concept with rich user profiles and strict transfer restrictions. SoulBadger is a SoulBound Badge creation NFT contract.

![SoulBadger](SoulBadger.jpg)

# Features

    Non-Transferable Tokens (Soulbound)
        Tokens are permanently bound to their owner and cannot be transferred after minting.
        Enforces ownership immutability through _beforeTokenTransfer.

    Detailed User Profiles
        Each token includes eight user attributes:
            Two string attributes: username, class
            Six numeric attributes (uint32): level, health, stamina, strength, intelligence, dexterity

    ERC721 Compatibility
        Complies with the ERC721 standard for NFTs, making it compatible with most tools and platforms.

    Metadata Support
        Includes a base URI for metadata, allowing for integration with decentralized storage or external APIs.

    Foundry Test Suite
        Comes with a test suite for Foundry to verify key functionalities.

$ Code Explanation

State Variables

_nextBadgeId

    Tracks the next available token ID.
    Starts at 1 to differentiate from default values of uninitialized mappings.

UserIdentity

    A struct representing the user profile attached to each token.
    Fields include:
        username: The user’s chosen name (e.g., "HeroicMage").
        class: The user’s role or specialization (e.g., "Mage").
        level: Numeric level indicating user progression.
        health: Health points of the user.
        stamina: Energy level for actions.
        strength: Physical power stat.
        intelligence: Mental or magical power stat.
        dexterity: Agility and precision stat.

_userIdentities

    A mapping linking each token ID (badgeId) to its corresponding UserIdentity struct.

_badgeOwners

    Tracks the ownership of each token by mapping badgeId to its owner’s address.

_baseBadgeUri

    The base URI used to fetch metadata for the tokens.

# Constructor

The constructor initializes the contract with:

    name_: The name of the token collection.
    symbol_: The symbol of the token collection.
    baseBadgeUri_: The base URI for metadata.

Example:

```solidity
constructor(
    string memory name_,
    string memory symbol_,
    string memory baseBadgeUri_
) ERC721(name_, symbol_) {
    _baseBadgeUri = baseBadgeUri_;
    _nextBadgeId = 1;
}
```

# Functions

safeMint

    Mints a new Soulbound Token and associates it with a user profile.
    Parameters:
        to: Address of the token recipient.
        username: User’s chosen name.
        class_: User’s specialization or class.
        level, health, stamina, strength, intelligence, dexterity: Numeric user attributes.
    Stores the user profile in _userIdentities and tracks ownership in _badgeOwners.

getUserIdentity

    Retrieves the user profile associated with a token ID.
    Parameters:
        badgeId: The ID of the token.
    Returns:
        username, class, level, health, stamina, strength, intelligence, dexterity.

ownerOf

    Overridden to use _badgeOwners for custom ownership tracking.

_beforeTokenTransfer

    Enforces the soulbound property by restricting transfers.
    Reverts if the from address is not zero (address(0)), ensuring tokens can only be minted.

# Foundry Integration

Prerequisites

    Install Foundry:
```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

Install dependencies:
```bash
    forge install OpenZeppelin/openzeppelin-contracts
```

# Foundry Test Suite

Create a test file named SoulBadgerTest.t.sol in the test directory. The following tests are included:

    Minting a Soulbound Token
        Ensures that a token can be minted and verifies the stored user profile.

    Soulbound Enforcement
        Ensures that tokens cannot be transferred after minting.

Test Contract: SoulBadgerTest.t.sol


# Running Tests

    Build the contracts:
```bash
forge build
```
Run the tests:
```bash
forge test
```

# Deployment

To deploy the contract using Foundry’s forge create:
```bash
forge create --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY> src/SoulBadger.sol:SoulBound
```
Replace <YOUR_RPC_URL> and <YOUR_PRIVATE_KEY> with your configuration

----------------------

This is the compiled untested version of SoulBadger. code is law. may the source be with you.SoulBadger

SoulBadger is a Solidity smart contract that implements a Soulbound Token (SBT) system using the ERC721 standard. Soulbound Tokens are non-transferable NFTs designed to represent permanent and unique user attributes. This contract, tailored for deployment and testing using Foundry, provides a robust implementation of the concept with rich user profiles and strict transfer restrictions.
Features

    Non-Transferable Tokens (Soulbound)
        Tokens are permanently bound to their owner and cannot be transferred after minting.
        Enforces ownership immutability through _beforeTokenTransfer.

    Detailed User Profiles
        Each token includes eight user attributes:
            Two string attributes: username, class
            Six numeric attributes (uint32): level, health, stamina, strength, intelligence, dexterity

    ERC721 Compatibility
        Complies with the ERC721 standard for NFTs, making it compatible with most tools and platforms.

    Metadata Support
        Includes a base URI for metadata, allowing for integration with decentralized storage or external APIs.

    Foundry Test Suite
        Comes with a test suite for Foundry to verify key functionalities.

Code Explanation
1. State Variables
_nextBadgeId

    Tracks the next available token ID.
    Starts at 1 to differentiate from default values of uninitialized mappings.

UserIdentity

    A struct representing the user profile attached to each token.
    Fields include:
        username: The user’s chosen name (e.g., "HeroicMage").
        class: The user’s role or specialization (e.g., "Mage").
        level: Numeric level indicating user progression.
        health: Health points of the user.
        stamina: Energy level for actions.
        strength: Physical power stat.
        intelligence: Mental or magical power stat.
        dexterity: Agility and precision stat.

_userIdentities

    A mapping linking each token ID (badgeId) to its corresponding UserIdentity struct.

_badgeOwners

    Tracks the ownership of each token by mapping badgeId to its owner’s address.

_baseBadgeUri

    The base URI used to fetch metadata for the tokens.

2. Constructor

The constructor initializes the contract with:

    name_: The name of the token collection.
    symbol_: The symbol of the token collection.
    baseBadgeUri_: The base URI for metadata.

Example:

constructor(
    string memory name_,
    string memory symbol_,
    string memory baseBadgeUri_
) ERC721(name_, symbol_) {
    _baseBadgeUri = baseBadgeUri_;
    _nextBadgeId = 1;
}

3. Functions
safeMint

    Mints a new Soulbound Token and associates it with a user profile.
    Parameters:
        to: Address of the token recipient.
        username: User’s chosen name.
        class_: User’s specialization or class.
        level, health, stamina, strength, intelligence, dexterity: Numeric user attributes.
    Stores the user profile in _userIdentities and tracks ownership in _badgeOwners.

getUserIdentity

    Retrieves the user profile associated with a token ID.
    Parameters:
        badgeId: The ID of the token.
    Returns:
        username, class, level, health, stamina, strength, intelligence, dexterity.

ownerOf

    Overridden to use _badgeOwners for custom ownership tracking.

_beforeTokenTransfer

    Enforces the soulbound property by restricting transfers.
    Reverts if the from address is not zero (address(0)), ensuring tokens can only be minted.

Foundry Integration
Prerequisites

    Install Foundry:

curl -L https://foundry.paradigm.xyz | bash
foundryup

Install dependencies:

    forge install OpenZeppelin/openzeppelin-contracts

Foundry Test Suite

Create a test file named SoulBadgerTest.t.sol in the test directory. The following tests are included:

    Minting a Soulbound Token
        Ensures that a token can be minted and verifies the stored user profile.

    Soulbound Enforcement
        Ensures that tokens cannot be transferred after minting.

Test Contract: SoulBadgerTest.t.sol

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

Running Tests

    Build the contracts:

forge build

Run the tests:

    forge test

Deployment

To deploy the contract using Foundry’s forge create:

forge create --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY> src/SoulBadger.sol:SoulBound

Replace <YOUR_RPC_URL> and <YOUR_PRIVATE_KEY> with your configuration.
License

This project is licensed under the MIT License.

This project is licensed under the MIT License.
