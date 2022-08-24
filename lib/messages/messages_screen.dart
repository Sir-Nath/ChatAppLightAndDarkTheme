
import 'package:chat_app_in_dark_and_light_mode/messages/components/body.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/user_2.png'),
          ),
          const SizedBox(
            width:  kDefaultPadding * 0.75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Kristin Watson',
                style: TextStyle(
                  fontSize: 16
                ),
              ),
              Text(
                'Active 3m ago',
                style: TextStyle(
                  fontSize: 12
                ),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.local_phone),),
        IconButton(
          onPressed: (){},
          icon: const Icon(Icons.videocam),),
        SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}
