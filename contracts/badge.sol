
// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract badge is ERC721 {

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor() ERC721 ("Completion Badge", "Web Dev Badge") {
    console.log("This is a NFT contract.");
  }

  function makeBadge() public{
    uint256 newItemId= _tokenIds.current();
    _safeMint(msg.sender,newItemId);
    tokenURI(newItemId);
    _tokenIds.increment();
  }

  function tokenURI(uint256 _tokenId) public view override returns(string memory){
    require(_exists(_tokenId));
    console.log("An NFT w/ ID %s has been minted to %s", _tokenId, msg.sender);
    return "https://raw.githubusercontent.com/sarthak0714/METADATA/main/webdev.json";
  }

}
