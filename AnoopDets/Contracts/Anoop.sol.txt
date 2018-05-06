pragma solidity ^0.4.22;

contract AnoopDets {
    
    string  fname ;
    uint    age;
    address owner;
    
    constructor () public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    event Detailer(
         string name,
         uint age
        );
        
    function setDets (string _fname,uint _age) onlyOwner public {
        fname = _fname;
        age = _age;
        Detailer(_fname,_age);
    }
    
    function getDets () public constant returns (string,uint) {
        return (fname,age);
    }
}