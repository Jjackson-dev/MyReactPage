pragma solidity >=0.4.21 <0.6.0;

import "./ERC20Interface.sol";
import "./DaiToken.sol";
import "./safemath.sol";

contract Lottery
{
    address payable public owner; //우리 주소
    uint256 private _percent;   //persent
    uint256 balance;    //보낼돈 (msg.value)
    address payable user = address(0xe29c5D9340cc3557353feBCfbb2239D61759DF9b);   //감독 지금 내 메타마스크  주소
    constructor() payable public
    {
        balance = msg.value;
        owner = msg.sender;
    }
    /* set user Address in java web <will> */
    function set(address payable _userAddress) public {
        user = _userAddress;
    }
    // if pertsent == 100 -> transfer balance to userAddress
    function send() public {
        user.transfer(balance);
    }
}