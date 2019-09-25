pragma solidity >=0.4.21 <0.6.0;

interface DaiToken {
    function transfer(address dst, uint wad) external returns (bool);
    function balanceOf(address guy) external view returns (uint);
}

contract owned {
  DaiToken daitoken;
	address owner;

	constructor() public{
		owner = msg.sender;
		daitoken = DaiToken(0xC4375B7De8af5a38a93548eb8453a498222C4fF2); // kovan testnet
	}

	modifier onlyOwner {
		require(msg.sender == owner,
		        "Only the contract owner can call this function");
		_;
	}
}

contract mortal is owned {
	function destroy() public onlyOwner {
	    daitoken.transfer(owner, daitoken.balanceOf(address(this)));
	    selfdestruct(msg.sender);
	}
}


/*
// Sample Contract

이 솔리디티 파일이랑 safemath.sol ERC20.sol 다 임포트해주고
아래 컨트랙트처럼 balanceOf나 transfer 같은 함수 쓸 때 앞에 daitoken. 붙이면 됨

contract DaiFaucet is mortal {

	event Withdrawal(address indexed to, uint amount);
	event Deposit(address indexed from, uint amount);
	

	// Give out Dai to anyone who asks
	function withdraw(uint withdraw_amount) public {
		// Limit withdrawal amount
		require(withdraw_amount <= 0.1 ether);
		require(daitoken.balanceOf(address(this)) >= withdraw_amount,
			"Insufficient balance in faucet for withdrawal request");
		// Send the amount to the address that requested it
		daitoken.transfer(msg.sender, withdraw_amount);
		emit Withdrawal(msg.sender, withdraw_amount);
	}
	
	// Accept any incoming amount
	function () external payable {
		emit Deposit(msg.sender, msg.value);
	}
}
*/