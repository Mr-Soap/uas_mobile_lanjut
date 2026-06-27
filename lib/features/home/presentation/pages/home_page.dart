import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/route_names.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DigiNews"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push(RouteNames.profile);
          },
          child: const Text("Pergi ke profile"),
        ),
      ),
    );
  }
}