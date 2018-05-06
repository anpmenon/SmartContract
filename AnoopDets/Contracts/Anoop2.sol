pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

contract Details {
    
    struct Information {
        uint Id;
        uint age;
        string fName;
        string lName;
    }
    
    //Infromation [] public RetInformation
    
    mapping (address => Information) Informations;
    address[] public InformationAdrArr;
    
    function setInfromation(address _address, uint _age, string _fName, string _lName) public {
        var InformationAdr = Informations[_address];
        uint _Id;
        _Id = countInformations() + 1;
        
        InformationAdr.Id = _Id;
        InformationAdr.age = _age;
        InformationAdr.fName = _fName;
        InformationAdr.lName = _lName;
        
        InformationAdrArr.push(_address) -1;
    }
    
    function getInformations() view public returns(address[]) {
        return InformationAdrArr;
    }
    
    function getInformation(address _address) view public returns (uint,uint, string, string) {
        return (Informations[_address].Id, Informations[_address].age, Informations[_address].fName, Informations[_address].lName);
    }
    
    function getId(address _address) view public returns (uint){
        return (Informations[_address].Id);
    }
    
    function getInformationById(uint _Id) view public returns (uint,uint, string, string) {
        
        uint Info_Id = _Id;
        
        for (uint i=0;i <= countInformations();i++ ){
            
             if (Info_Id == getId(InformationAdrArr[i])){
                    return  getInformation(InformationAdrArr[i]);
                    break;
                 } 
          
        }
        
    }

    function countInformations() view public returns (uint) {
        return InformationAdrArr.length;
    }
   
}