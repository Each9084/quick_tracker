import 'package:flutter/material.dart';

class stateScreen extends StatelessWidget {
  const stateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          children: [
            Text("Transaction",style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),)

          ],
        ),
      ),
    );
  }
}
