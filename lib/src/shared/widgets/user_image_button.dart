import 'package:flutter/material.dart';

class UserImageButton extends StatelessWidget {
  const UserImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Text('A'),
      ),
    );
  }
}
