import 'package:flutter/material.dart';
import 'package:project1/pages/entryPage.dart';
import 'package:provider/provider.dart';
import 'package:project1/authstate.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getString('userId');
  final accessToken = prefs.getString('accessToken');

  final authState = AuthState();

  if (userId != null && accessToken != null) {
    authState.login(userId, accessToken);
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => authState,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EntryPage() ,

    );
  }
}

