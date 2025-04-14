import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/user_profile/data/repository/user_repository.dart';
import 'features/user_profile/bloc/user_bloc.dart';
import 'features/user_profile/presentation/pages/user_profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeForces Information',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (_) => UserBloc(UserRepository()),
        child: const UserProfilePage(),
      ),
    );
  }
}
