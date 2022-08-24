import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/ChatMessage.dart';

class TextMessage extends StatelessWidget {
  final ChatMessage chatMessage;
  const TextMessage({
    Key? key,
    required this.chatMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(top: kDefaultPadding),
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(chatMessage.isSender ? 1 : 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        chatMessage.text,
        style: TextStyle(
            color: chatMessage.isSender
                ? Colors.white
                : Theme.of(context).textTheme.bodyText1?.color),
      ),
    );
  }
}