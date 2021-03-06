import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/extra/exports/exports.dart';

class BottomInputSection extends StatelessWidget {
  const BottomInputSection({
    required this.isChatRoomCreated,
    required this.name,
    required this.phone,
    required this.chatRoomId,
    required this.isGroup,
    Key? key,
    required this.size,
  }) : super(key: key);
  final String phone;
  final String name;
  final Size size;
  final String chatRoomId;
  final bool isChatRoomCreated;
  final bool isGroup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: size.width * 0.85,
            child: TextField(
              controller: ChatState.messageController,
              onChanged: (String value) {
                ChatState.textMsg.value = value;
              },
              style: const TextStyle(
                fontSize: 22,
                color: white,
              ),
              cursorHeight: 22,
              cursorColor: white,
              decoration: InputDecoration(
                fillColor: blueGrey,
                filled: true,
                prefixIcon: IconButton(
                  splashRadius: 20,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.emoji_emotions_rounded,
                    color: grey,
                  ),
                ),
                suffixIcon: SizedBox(
                  width: 145,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        splashRadius: 20,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.attachment_outlined,
                          color: grey,
                        ),
                      ),
                      IconButton(
                        splashRadius: 20,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: grey,
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                          child: const Icon(
                            Icons.currency_rupee_rounded,
                            size: 18,
                            color: blueGrey,
                          ),
                        ),
                      ),
                      IconButton(
                        splashRadius: 20,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt,
                          color: grey,
                        ),
                      ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  borderSide: BorderSide.none,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: green,
            radius: 22.45,
            child: IconButton(
              icon: ValueListenableBuilder(
                valueListenable: ChatState.textMsg,
                builder: (context, String text, _) {
                  return Icon(
                    text.isEmpty ? Icons.mic : Icons.send,
                    color: white,
                  );
                },
              ),
              onPressed: () {
                if (ChatState.messageController.text.isNotEmpty) {
                  context.read<ChatBloc>().add(
                        SentMessage(
                          userNumber: ChatState.userPhoneNumber!,
                          isGroup: isGroup,
                          chatRoomId: chatRoomId,
                          time: DateTime.now(),
                          name: name,
                          receiverPhone: phone,
                          isSent: true,
                          message: ChatState.textMsg.value,
                        ),
                      );
                      scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                }
                ChatState.messageController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
