package balanceExample;

public class AccountExample {
	public static void main(String[] args) {
		Account account = new Account();
		account.deposit(10000);
		System.out.println(account.getBalance());
		
		try {
			account.withdraw(30000);	
		}
		catch(BalanceInsufficientException e) {
			String str = e.getMessage();
			System.out.println(str);
			e.printStackTrace();
		}
		
	}
}
