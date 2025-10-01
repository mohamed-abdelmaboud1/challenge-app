import 'package:flutter/material.dart';

import 'dismissible_example_view.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const DismissibleExampleView(),
    );
  }
}
