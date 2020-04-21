package condition;

public class IfelseIfExample {
	public static void main(String[] args) {
		
		int score = 84;
		/*
		if(score >= 90) {
			if(score >= 95) {
				System.out.println("A+이다.");
			}
			else {
				System.out.println("A이다.");
			}
		}
		*/
		
		if(score == 100) {
			System.out.println("A++");
		}
		else if (score >= 95) {
			System.out.println("A+");
		}
		else if(score >= 90) {
			System.out.println("A");
		}
		else {
			System.out.println("B+");
		}
	
		int gender = 1, qualification = 2;
		
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
	}
}
