package anonyous;

public class Anonymous {
	// �ʵ�
	Remote remote = new Remote() {

		@Override
		public void turnOn() {}

		@Override
		public void turnOff() {}

	};

	// �޼ҵ�
	void method() {
		Remote lovalRemote = new Remote() {

			@Override
			public void turnOn() {}

			@Override
			public void turnOff() {}

		};
	}

	void method2(Remote remote) {
	}

	public static void main(String[] args0) {
		// ����
		Anonymous anony = new Anonymous();
		anony.remote.turnOn();

		//�żҵ� �Ű�����
		Remote remote = new Remote() {

			@Override
			public void turnOn() {}

			@Override
			public void turnOff() {}

		};
	}
}
