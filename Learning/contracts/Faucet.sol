pragma solidity ^0.4.22;

contract  owned {

  address owner;
  // 컨트랙트 생성자
  constructor() {
    owner = msg.sender;
  }
  //변경자 접근 제어
  modifier onlyOwner {
    require(msg.sender == owner,
            "Only the contract owner can call this function.");
    _;
  }
}

contract mortal is owned {

  function destroy() public onlyOwner {
    selfdestruct(owner);
  }
}

contract Faucet is mortal {
  event Withdrawal(address indexed to, uint amount);
  event Deposit(address indexed from, uint amount);

  function withdraw(uint withdraw_amount) public {
    require (withdraw_amount <= 0.1 ether);
    require (this.balance >= withdraw_amount,
      "Insufficent balance in faucet for withdrawal request");

    msg.sender.transfer(withdraw_amount);
    emit Withdrawal(msg.sender, withdraw_amount);
  }

  function () public payable {
    emit Deposit(msg.sender, msg.value);
  }
}
