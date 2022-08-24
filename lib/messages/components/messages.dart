import 'package:chat_app_in_dark_and_light_mode/messages/components/text_messages.dart';
import 'package:chat_app_in_dark_and_light_mode/messages/components/video_message.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/ChatMessage.dart';
import 'audio_message.dart';

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

class MessageStatusDot extends StatelessWidget {
  final MessageStatus status;
  const MessageStatusDot({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? dotColor(MessageStatus status){
     switch(status){
       case MessageStatus.notSent:
         return kErrorColor;
         break;
       case MessageStatus.notViewed:
         return Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.1);
         break;
       case MessageStatus.viewed:
         return kPrimaryColor;
         break;

       default:
         return Colors.transparent;
     }
    }
    return Container(
      height: 12,
      width: 12,
      margin: const EdgeInsets.only(left: kDefaultPadding /2),
      decoration: BoxDecoration(
        color: dotColor(status),
        shape: BoxShape.circle
      ),
      child: Icon(
        status == MessageStatus.notSent ? Icons.close :
        Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
