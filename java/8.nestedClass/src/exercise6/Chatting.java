package exercise6;

public class Chatting {
	void startChat(final String chatId) {
		final String nickName = chatId;

		Chat chat = new Chat() {
			public void start() {
				while(true) {
					String inputData = "æ»≥Á«œººø‰.";
					String message = "[" + nickName + "]" + inputData;
					sendMessage(message);
				}
			}
		};
		chat.start();
	}
}

class Chat {
	void start() {
	}

	void sendMessage(String message) {
	}
}
