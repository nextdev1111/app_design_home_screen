// by flutter
import 'package:flutter/material.dart';

class AuthLoader extends StatelessWidget {
  const AuthLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(children: [CircularProgressIndicator(), Text('Loading')]),
    );
  }
}
