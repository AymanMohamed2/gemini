import 'package:chat_gpt/core/theme/app_colors.dart';
import 'package:chat_gpt/core/utils/service_locator.dart';
import 'package:chat_gpt/features/chat/presentation/view/home_view.dart';
import 'package:chat_gpt/features/recorder/presentation/view/recorder_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeView extends StatefulWidget {
  static const routeName = 'home';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ChatView(),
    RecorderView()
  ];

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    if (index != 1) {
      await getIt.get<FlutterTts>().stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Recorder',
          ),
        ],
        unselectedItemColor: AppColors.darkGrey,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.lightGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}
