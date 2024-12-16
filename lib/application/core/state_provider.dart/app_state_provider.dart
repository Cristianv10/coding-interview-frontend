import 'package:coding_interview_frontend/application/core/state_provider.dart/bloc_provider.dart';
import 'package:flutter/material.dart';

/// This is a provider that provides the [AppCubit] to the widget tree.
/// To inject the [AppCubit] into the widget tree, wrap the widget tree with this provider.
class AppStateProvider extends StatelessWidget {
  final Widget child;

  const AppStateProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
      child: child,
    );
  }
}
