package condition;

public class IDcodeCheck {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int code = 21;
		
		String idCheck = "";
		if(code/10 ==1) {
			idCheck = "����";
			if (code%10 == 1) {
				idCheck = idCheck + ", ������";
			}
			else if (code % 10 == 2) {
				idCheck = idCheck + ", �ܱ���";
			}
			else if (code % 10 == 3) {
				idCheck = idCheck + ", �̼�����";
			}
			else
				idCheck = "��Ȯ�� ������ �Է����ּ���.";
		}
		else if(code/10 ==2) {
			idCheck = "����";
			if (code%10 == 1) {
				idCheck = idCheck + ", ������";
			}
			else if (code % 10 == 2) {
				idCheck = idCheck + ", �ܱ���";
			}
			else if (code % 10 == 3) {
				idCheck = idCheck + ", �̼�����";
			}
			else
				idCheck = "��Ȯ�� ������ �Է����ּ���.";
		
		}
		System.out.println(idCheck);
		
		
		/*
		int gender = code/10, qualification = code%gender;
		
		if(gender == 1) {
			
			if(qualification ==1) {
				System.out.println("����, �������Դϴ�.");
			}
			else if(qualification == 2) {
				System.out.println("����, �ܱ����Դϴ�.");
			}
			else if(qualification ==3) {
				System.out.println("����, �̼������Դϴ�.");
			}
			else {
				System.out.println("�ڰ��� �ٽ� Ȯ�����ּ���.");
			}
		}
		else if(gender == 2) {
			if(qualification ==1) {
				System.out.println("����, �������Դϴ�.");
			}
			else if(qualification == 2) {
				System.out.println("����, �ܱ����Դϴ�.");
			}
			else if(qualification ==3) {
				System.out.println("����, �̼������Դϴ�.");
			}
			else {
				System.out.println("�ڰ��� �ٽ� Ȯ�����ּ���.");
			}
		}
		else {
			System.out.println("������ �ٽ� Ȯ�����ּ���.");
		}
		*/
	}

}
