pragma solidity ^0.8.0;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract MPToken is ERC20{
    address public owner;

    constructor(string memory name, string memory symbol, uint256 initialSupply) public ERC20(name, symbol) {
        owner = msg.sender;
        _mint(msg.sender, initialSupply);
    }
}
