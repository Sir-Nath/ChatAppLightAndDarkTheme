import 'package:chat_app_in_dark_and_light_mode/constants.dart';
import 'package:chat_app_in_dark_and_light_mode/messages/messages_screen.dart';
import 'package:chat_app_in_dark_and_light_mode/models/Chat.dart';
import 'package:flutter/material.dart';
import '../../../components/filled_outline_button.dart';
import 'chat_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
            kDefaultPadding,
            0,
            kDefaultPadding,
            kDefaultPadding,
          ),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(
                press: () {},
                text: 'Recent message',
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              FillOutlineButton(
                press: () {},
                text: 'Active',
                isFilled: false,
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) {
                return ChatCard(
                  chat: chatsData[index],
                  press: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const MessageScreen();
                    }));
                  },
                );
              }),
        )
      ],
    );
  }
}
