package condition;

public class IDcodeCheck {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int code = 21;
		
		String idCheck = "";
		if(code/10 ==1) {
			idCheck = "여성";
			if (code%10 == 1) {
				idCheck = idCheck + ", 내국인";
			}
			else if (code % 10 == 2) {
				idCheck = idCheck + ", 외국인";
			}
			else if (code % 10 == 3) {
				idCheck = idCheck + ", 미성년자";
			}
			else
				idCheck = "정확한 정보를 입력해주세요.";
		}
		else if(code/10 ==2) {
			idCheck = "남성";
			if (code%10 == 1) {
				idCheck = idCheck + ", 내국인";
			}
			else if (code % 10 == 2) {
				idCheck = idCheck + ", 외국인";
			}
			else if (code % 10 == 3) {
				idCheck = idCheck + ", 미성년자";
			}
			else
				idCheck = "정확한 정보를 입력해주세요.";
		
		}
		System.out.println(idCheck);
		
		
		/*
		int gender = code/10, qualification = code%gender;
		
		if(gender == 1) {
			
			if(qualification ==1) {
				System.out.println("여성, 내국인입니다.");
			}
			else if(qualification == 2) {
				System.out.println("여성, 외국인입니다.");
			}
			else if(qualification ==3) {
				System.out.println("여성, 미성년자입니다.");
			}
			else {
				System.out.println("자격을 다시 확인해주세요.");
			}
		}
		else if(gender == 2) {
			if(qualification ==1) {
				System.out.println("남성, 내국인입니다.");
			}
			else if(qualification == 2) {
				System.out.println("남성, 외국인입니다.");
			}
			else if(qualification ==3) {
				System.out.println("남성, 미성년자입니다.");
			}
			else {
				System.out.println("자격을 다시 확인해주세요.");
			}
		}
		else {
			System.out.println("성별을 다시 확인해주세요.");
		}
		*/
	}

}
