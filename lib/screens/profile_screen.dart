import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Implement edit profile logic
          },
          child: Text('Edit Profile'),
        ),
      ),
    );
  }
}
