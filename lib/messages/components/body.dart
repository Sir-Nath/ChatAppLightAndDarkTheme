import 'package:chat_app_in_dark_and_light_mode/constants.dart';
import 'package:chat_app_in_dark_and_light_mode/models/ChatMessage.dart';
import 'package:flutter/material.dart';
import 'chat_input_field.dart';
import 'messages.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
                itemCount: demoChatMessages.length,
                itemBuilder: (context, index) {
                  return Message(
                    chatMessage: demoChatMessages[index],
                  );
                }),
          ),
        ),
        const ChatInputField()
      ],
    );
  }
}



