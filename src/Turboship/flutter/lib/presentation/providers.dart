import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turboship/all.dart';

class AppBlocProviders extends StatelessWidget {
  final Widget child;
  const AppBlocProviders({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) =>
          previous.currentUser != current.currentUser,
      builder: (context, state) {
        if (state.isLoggedIn) {
          return MultiBlocProvider(
            providers: const [],
            child: child,
          );
        }
        return child;
      },
    );
  }
}
