import 'package:challenge_app/features/home/ui/views/dismissible_example_view.dart';
import 'package:flutter/material.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DismissibleExampleView(),
    );
  }
}
