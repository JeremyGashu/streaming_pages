import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaming_pages/account_profile.dart';
import 'package:streaming_pages/bloc/file_manager_bloc/file_manager_bloc.dart';
import 'package:streaming_pages/bloc_observer.dart';
import 'package:streaming_pages/file_delete_page.dart';
import 'package:streaming_pages/playlist.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  runApp(
    BlocProvider(
      create: (_) => FileManagerBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    AccountProfile(),
    Playlist(),
    DeleteFilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.playlist_play,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.delete,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
