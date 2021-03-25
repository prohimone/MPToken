pragma solidity ^0.8.3;

contract MPDollarv2{
    address public owner;
    mapping(address => uint) public balances;
    uint public totalSupply = 100000000*10**18;
    string public name = "Owner";
    string public symbol = "Owner";
    uint public decimals = 18;
    
    event Transfer(address indexed from, address indexed to, uint value);
    
    constructor(){
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }
    
     function getOwner() public returns (address) {
        return owner;
     }
     
     function getTotalSupply() public returns (uint){
         return totalSupply;
     }
     
    function balanceOf(address owner) public view returns (uint){
        return balances[owner];
    }
    
    
    function transfer(address to, uint value) public returns(bool){
        require(owner == msg.sender);
        require(balanceOf(msg.sender)>= value, 'balance too low');
        balances[to] += value; 
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
    
    function transferToAllHolders() public{
        require(owner == msg.sender);
        require(balanceOf(msg.sender)>= 0, 'balance too low');
        //transfer to all shareholders (hardcoded) the amount they have
        transfer(0x8F1d055256f6C93121eAb173638DC5e13dddf829, 100000*10**18);
        emit Transfer(msg.sender, 0x8F1d055256f6C93121eAb173638DC5e13dddf829, 100000*10**18);

    }
}
