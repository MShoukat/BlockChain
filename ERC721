// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/utils/Strings.sol";

contract PERC721 {

    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    // mapping from token id to owner address
    mapping (uint256 => address) private _owners;

    // mapping owner address to token count
    mapping (address => uint256) private _balances;

    // mapping from token id to approved address
    mapping(uint256 => address) private _tokenApprovals;

    // mapping from owner to operator approval
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    // initialize the contract by a name and a symbol to the token collection
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    // function BalanceOf
    function balanceOf(address owner) public view returns(uint256){
        require(owner !=address(0), "Address 0 is not a valid owner");
        return _balances[owner] ;
    }

    // function ownerOf
    function ownerOf(uint256 tokenId) public view returns(address) {
        address owner = _owners[tokenId];
        require(_exists(tokenId), "Invalid token id");
        return owner;

    }

    function name() public view returns(string memory){
        return _name;
    }

    function symbol() public view returns(string memory){
        return _symbol;
    }

    // function token URI
    function tokenURI(uint256 tokenId) public view returns(string memory){
        _requireMinted(tokenId);
         string memory baseURI = _baseURI();
         return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId)) : "";
    }

    function _baseURI() internal view returns(string memory){
        return "";
    }

    function _requireMinted(uint256 tokenId) internal view  {
        require(_exists(tokenId), "ERC721: invalid token ID");
    }
    function _exists(uint256 tokenId) internal view returns (bool) {
        return _owners[tokenId] != address(0);
    }

    // function to approve.
    function approve(address to, uint256 tokenId) public {
        address owner = PERC721.ownerOf(tokenId);
        require(to != owner, "Approval to current owner");
        _tokenApprovals[tokenId] = to;
    }
    function _approve(address to, uint256 tokenId) internal {
        _tokenApprovals[tokenId] = to;
     //   emit Approval(ERC721.ownerOf(tokenId), to, tokenId);
    }

    // function get approved
    function getApproved(uint256 tokenId) public view returns (address) {
        _requireMinted(tokenId);

        return _tokenApprovals[tokenId];
    }
    // set approval for all
    function setApprovalForAll(address operator, bool approved, address owner) public {
        _operatorApprovals[owner][operator] = approved;

    }

    // Is approved for all
    function isApprovedForAll(address owner, address operator) public view returns(bool){
        return _operatorApprovals[owner][operator];
    }

    // function transfor from
    function transferFrom(address from, address to, uint256 tokenId) public {
        require(_isApprovedOrOwner(msg.sender,tokenId), "Caller is not the token owner nor approved.");
        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;
    }

     function _isApprovedOrOwner(address spender, uint256 tokenId) public view virtual returns (bool) {
        address owner = PERC721.ownerOf(tokenId);
        return (spender == owner || isApprovedForAll(owner, spender) || getApproved(tokenId) == spender);
    }

    // functioin to mint
    function _mint(address to, uint256 tokenId, uint256) public  {
       // require(to != address(0), "ERC721: mint to the zero address");
       //require(!_exists(tokenId), "ERC721: token already minted");
        _balances[to] += 1;
        _owners[tokenId] = to;
    }

}
