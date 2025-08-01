import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_service.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          context.read<AuthService>().signOut();

          Navigator.pushNamedAndRemoveUntil(
            context,
            '/phone',
            (route) => false,
          );
        },
        child: const Text('Logout', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
