import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/extra/exports/exports.dart';
import 'package:chat_app/extra/service/user_service.dart';

class SentMessageCard extends StatelessWidget {
  const SentMessageCard({
    Key? key,
    required this.index,
    required this.size,
    required this.isGroup,
    required this.state,
  }) : super(key: key);

  final Size size;
  final ChatState state;
  final bool isGroup;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      constraints: BoxConstraints(
        maxWidth: size.width * 0.8,
        minWidth: size.width * 0.3,
      ),
      decoration: const BoxDecoration(
        color: darkGreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // isGroup
          //     ? TextWidget(
          //         text: state.conversation[index].messageSentName ??
          //             state.conversation[index].messageSentNumber,
          //         size: 10,
          //         color: white,
          //       )
          //     : const SizedBox(),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: TextWidget(
              color: white,
              align: TextAlign.left,
              overflow: TextOverflow.visible,
              size: 20,
              text: state.conversation[index].textMessage,
            ),
          ),
          TextWidget(
            text: UserDataServices.getDateFormate(
              time: state.conversation[index].time,
            ),
            align: TextAlign.left,
            size: 12,
          ),
        ],
      ),
    );
  }
}
