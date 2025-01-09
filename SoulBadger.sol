
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Make sure you have OpenZeppelin v5.x installed:
// npm install @openzeppelin/contracts@latest
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SoulBound is ERC721 {
    // incrementing badge ID
    uint256 private _nextBadgeId;

    // user identity with eight fields (two strings + six uint32)
    struct UserIdentity {
        string username;      
        string class;
        uint32 level;
        uint32 health;
        uint32 stamina;
        uint32 strength;
        uint32 intelligence;
        uint32 dexterity;
    }

    // badgeId => user identity
    mapping(uint256 => UserIdentity) private _userIdentities;

    // badgeId => owner
    mapping(uint256 => address) private _badgeOwners;

    // base URI for metadata
    string private _baseBadgeUri;

    // optional metadata format
    string private constant _metadataFormat = "ERC-5484";

    constructor(
        string memory name_,
        string memory symbol_,
        string memory baseBadgeUri_
    ) ERC721(name_, symbol_) {
        _baseBadgeUri = baseBadgeUri_;
        _nextBadgeId = 1; // start IDs at 1
    }

    // mint soulbound badge with eight fields
    function safeMint(
        address to,
        string memory username,
        string memory class_,
        uint32 level,
        uint32 health,
        uint32 stamina,
        uint32 strength,
        uint32 intelligence,
        uint32 dexterity
    ) external {
        uint256 badgeId = _nextBadgeId++;
        _safeMint(to, badgeId);

        // store identity data
        _userIdentities[badgeId] = UserIdentity(
            username,
            class_,
            level,
            health,
            stamina,
            strength,
            intelligence,
            dexterity
        );

        // track ownership in custom mapping
        _badgeOwners[badgeId] = to;
    }

    // retrieve all eight fields of user identity
    function getUserIdentity(uint256 badgeId)
        external
        view
        returns (
            string memory,  // username
            string memory,  // class
            uint32,         // level
            uint32,         // health
            uint32,         // stamina
            uint32,         // strength
            uint32,         // intelligence
            uint32          // dexterity
        )
    {
        address owner = _badgeOwners[badgeId];
        require(owner != address(0), "Nonexistent badge");
        UserIdentity storage identity = _userIdentities[badgeId];
        return (
            identity.username,
            identity.class,
            identity.level,
            identity.health,
            identity.stamina,
            identity.strength,
            identity.intelligence,
            identity.dexterity
        );
    }

    // override ownerOf to use _badgeOwners
    function ownerOf(uint256 badgeId) public view override returns (address) {
        address owner = _badgeOwners[badgeId];
        require(owner != address(0), "Owner query for nonexistent token");
        return owner;
    }

    // optional base URI for metadata
    function _baseURI() internal view override returns (string memory) {
        return _baseBadgeUri;
    }

    function _beforeTokenTransfer(
    address from, 
    address to, 
    uint256 tokenId
    ) internal virtual {
    require(from == address(0), "Err: token transfer is BLOCKED"); 
    _beforeTokenTransfer(from, to, tokenId);  
    }
}
