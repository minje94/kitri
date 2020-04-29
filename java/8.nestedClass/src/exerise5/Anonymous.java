package exerise5;

public class Anonymous {
	Vehicle field = new Vehicle() {

		@Override
		public void run() {
		}

	};

	void method1() {
		Vehicle localVar = new Vehicle() {

			@Override
			public void run() {
			}
		};
		localVar.run();
	}

	void method2(Vehicle v) {
		v.run();
	}
}
