package accessmodifier.account;

public class AccountExample {

	public static void main(String[] args) {
		Account account = new Account();
		
		account.setBalance(1000);
		System.out.println("ÇöÀçÀÜ°í: " + account.getBalance());
		
		account.setBalance(-100);
		System.out.println("ÇöÀçÀÜ°í: " + account.getBalance());

		account.setBalance(2000000);
		System.out.println("ÇöÀçÀÜ°í: " + account.getBalance());
		

		account.setBalance(300000);
		System.out.println("ÇöÀçÀÜ°í: " + account.getBalance());
	}

}
