package anonyous;

public class Anonymous {
	// 필드
	Remote remote = new Remote() {

		@Override
		public void turnOn() {}

		@Override
		public void turnOff() {}

	};

	// 메소드
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
		// 변수
		Anonymous anony = new Anonymous();
		anony.remote.turnOn();

		//매소드 매개변수
		Remote remote = new Remote() {

			@Override
			public void turnOn() {}

			@Override
			public void turnOff() {}

		};
	}
}
