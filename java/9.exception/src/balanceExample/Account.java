package balanceExample;

public class Account {
	private long balance;
	public Account() {}
	
	public long getBalance() {
		return balance;
	}
	
	public void deposit (int money) {
		this.balance += money;
	}
	
	public void withdraw(int money) throws BalanceInsufficientException{
		if(balance < money) {
			throw new BalanceInsufficientException("�ܰ����: " + (money-balance) + "���ڶ�");
		
		}
		this.balance -= money;
	}
}
