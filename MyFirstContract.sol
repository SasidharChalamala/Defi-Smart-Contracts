// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract MyFirstContract{
    string public message = "Hello Blockchain";
    function getMessage() public view returns(string memory){
        return message;
    }
    function setMessage(string memory _msg) public {
        message = _msg;
    }
}
