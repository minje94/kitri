package arrayList;

public interface ArrayList {
	int ARRAY_UNIT = 5;
	
	void expendArray();					//�迭 Ȯ��
	void printArray();					//��ü ��ȸ
	void delete(int index);				//��Ȯ�� ��ġ ����
	void add(String input);				//���κп� �߰�
	
	void add(String input, int index);	//�Ҵ�Ǿ��ִ� ���� ���̿��� ��Ȯ�� ��ġ�� �߰�
	
	String pop(int index);				//��Ȯ�� ��ġ���� ����
}
