pragma solidity ^0.8.0;

contract Coin {
    address public minter ;
    mapping(address => uint256) public balances;

    // Event 
     event Sent(address from, address to, uint amount);
    constructor () public {
        minter = msg.sender;
    }

    function mint(uint256 amount) public {
        if(msg.sender != minter) return;
        balances[msg.sender] += amount;
    }

    function send(address _to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount);
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        emit Sent(msg.sender, _to, _amount);
        

    }
}
