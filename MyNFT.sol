// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {
    uint public tokenCount = 0;
    address public owner;
    constructor() ERC721("MyNFT","MNFT") {
        owner = msg.sender;
    }

    function mint(address to) public {
        require(msg.sender == owner,"Not Owner");
        tokenCount++;
        _safeMint(to,tokenCount);
    }
}
