package daoExample;

public class OracleDao implements DataAccessObject{
	public void select() {
		System.out.println("Oracle DB���� �˻�");
	}
	public void insert() {
		System.out.println("Oracle DB�� ����");
	}
	public void update() {
		System.out.println("Oracle DB�� ����");
	}
	public void delete() {
		System.out.println("Oracle DB���� ����");
	}
}
