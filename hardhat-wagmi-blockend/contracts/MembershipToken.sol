// Name: WAGMI Squad Membership
// Symbol: WSM

// ERC721 Standard Route:
// Function: Minting only by users on whitelist
// Token is non-transferable
// Function: Token can be burned by owner
// Metadata includes image, unique ID, status (active, alumni, revoked), reputation score
// Status and reputation metadata can be updated by a DAO vote
// Metadata stored on IPFS

// ERC 1155 Route:
// Role Based Access Control NFTs.
// Design is based on Ownable, and the RBAC implementations from OpenZeppelin.
// DAO provides NFTs that define roles assigned to addresses 
// ERC1155 would allow for multiple addresses to share a role
// Token ID 0 - Platform Admins
// Token ID 1 - Minting
// Token ID 2 - Controls status 
// Token ID 3 - Controls reputation scores
// Use Ownable modifier to check if msg.sender holds balance of NFT token ID to restrict use of different functions
// This removes need for whitelist, instead DAO just hands out the NFTs
// RBAC tokens can be transferred to someone else within DAO
// 