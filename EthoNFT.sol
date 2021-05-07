// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;
 
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token-metadata.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/ownership/ownable.sol";
 
contract EthoNFT is NFTokenMetadata, Ownable {
 
  constructor() {
    nftName = "Etho Protocol NFT";
    nftSymbol = "ETHONFT";
  }
 
  function mint(address _to, uint256 _tokenId, string calldata _uri) external onlyOwner {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }
  function burnToken(address owner, uint256 tokenId) public {
    super._burn(tokenId);
  }
  function withdraw() public payable onlyOwner {
    address payable ownerAddress = payable(msg.sender);
    ownerAddress.transfer(address(this).balance);
  }
}
