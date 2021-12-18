import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      // return MaterialPageRoute(
      //   builder: (_) => BlocProvider<GameCubit>(
      //     create: (BuildContext context) => GameCubit(),
      //     child: const HomePage(),
      //   ),
      //   settings: settings,
      // );

      default:
      // return MaterialPageRoute(
      //   builder: (_) => BlocProvider<GameCubit>(
      //     create: (BuildContext context) => GameCubit(),
      //     child: const HomePage(),
      //   ),
      //   settings: settings,
      // );
    }
  }
}
