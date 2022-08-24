import 'package:chat_app_in_dark_and_light_mode/messages/components/text_messages.dart';
import 'package:chat_app_in_dark_and_light_mode/messages/components/video_message.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/ChatMessage.dart';
import 'audio_message.dart';
import 'message_status_dot.dart';

class Message extends StatelessWidget {
  final ChatMessage chatMessage;
  const Message({
    Key? key,
    required this.chatMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget messageContent(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(
            chatMessage: chatMessage,
          );
          break;
        case ChatMessageType.audio:
          return AudioMessage(
            message: chatMessage,
          );
          break;
        case ChatMessageType.video:
          return const VideoMessage();
          break;
        default:
          return const SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment: chatMessage.isSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!chatMessage.isSender)
            const CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage('assets/images/user_2.png'),
            ),
          const SizedBox(
            width: kDefaultPadding / 2,
          ),
          messageContent(chatMessage),
          if(chatMessage.isSender)
            MessageStatusDot(status: chatMessage.messageStatus,)
        ],
      ),
    );
  }
}

