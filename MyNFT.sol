// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/utils/Counters.sol";

contract NFT is ERC721, Ownable
{
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
     
    constructor() ERC721("Sachin", "SCT")   {
      
    }

      function _baseURI() internal pure override returns (string memory) {
        return "https://ipfs.io/ipfs/QmVWQunfp6mRwPfZrLvfTc17gvDCkBMXXrpMAkFeEoF5w1?filename=sachin.json";
    }

      function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }
}
