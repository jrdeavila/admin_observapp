import 'package:flutter/material.dart';

class EmptyMessage extends StatelessWidget {
  const EmptyMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(
            "assets/icons/empty.png",
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "UPS! No hemos encontrado nada aun.",
            style: TextStyle(
              fontSize: 20.0,
            ),
          )
        ]),
      ),
    );
  }
}
