import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/auth_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<AuthService>(
        builder: (BuildContext context, authServiceProvider, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [Text('Homepage', style: TextStyle(fontSize: 20))],
        ),
      ),
    );
  }
}
