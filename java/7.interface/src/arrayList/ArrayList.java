package arrayList;

public interface ArrayList {
	int ARRAY_UNIT = 5;
	
	void expendArray();					//배열 확장
	void printArray();					//전체 조회
	void delete(int index);				//정확한 위치 삭제
	void add(String input);				//끝부분에 추가
	
	void add(String input, int index);	//할당되어있는 값들 사이에서 정확한 위치에 추가
	
	String pop(int index);				//정확한 위치에서 추출
}
