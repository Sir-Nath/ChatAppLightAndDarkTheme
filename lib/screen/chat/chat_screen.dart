import 'package:chat_app_in_dark_and_light_mode/constants.dart';
import 'package:chat_app_in_dark_and_light_mode/logic/theme_cubit.dart';
import 'package:chat_app_in_dark_and_light_mode/screen/chat/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/theme_state.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedindex = 0;
  bool isDarkMode =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedindex = index;
          });
        },
        currentIndex: _selectedindex,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.messenger), label: 'chats'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'people'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'call'),
          BottomNavigationBarItem(icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage('assets/images/user_2.png'),
          ), label: 'Profile'),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Chats'),
      actions: [
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return IconButton(
                onPressed: (){
                  context.read<ThemeCubit>().toggleTheme(isDarkMode = !isDarkMode);
                },
                icon: state.icon);
          },
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),

      ],
    );
  }
}
