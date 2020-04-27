package accessmodifier.account;

public class Account {
	private int balance;
	int temp = 0;
	final int MIN_BALANCE = 0;
	final int MAX_BALANCE = 1000000;
	
	void setBalance(int balance) {
		temp = this.balance;
	//	this.balance = this.balance + balance;
		if(balance > MAX_BALANCE || balance < MIN_BALANCE) {
			this.balance = temp;
			temp = 0;
		}
		else {
			this.balance = balance;
		}
	}
	
	int getBalance() {
		return this.balance;
	}
}
