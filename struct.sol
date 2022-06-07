// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Student {

    mapping(string => StudentData) public data;
    uint256 studentCount = 0;
    struct StudentData {
        string _name;
        string _rollno;
        string _marks;
        bool isExist;
    }

    function AddStudent(string memory name, string memory rollno, string memory marks) public {
        
        require(data[name].isExist == false, "Student with this name already exist");
        studentCount += 1;
        data[name] = StudentData(name, rollno, marks, true);
    }

    function TotalStudents() public view returns(uint){
        return studentCount;
    }
    function viewStudent(string memory name) public view returns (string memory) {
        string memory n = data[name]._name;
        string memory rn = data[name]._rollno;
        string memory mrks = data[name]._marks;
        return string(abi.encodePacked("Name is : ", n, "  Roll no : ", rn, " Marks are : ", mrks));
    }
}
