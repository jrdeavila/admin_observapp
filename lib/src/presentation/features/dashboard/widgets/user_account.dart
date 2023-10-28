import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class UserAccountTag extends StatelessWidget {
  const UserAccountTag({
    super.key,
    this.onTap,
    this.isSmall = false,
  });

  final VoidCallback? onTap;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final sessionCtrl = Get.find<SessionController>();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: [
            if (!isSmall) ...[
              Text(
                'Hola!, ${sessionCtrl.user?.name.split(' ').first}',
                style: TextStyle(
                  color: Get.theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10.0),
            ],
            const Icon(
              Icons.person_4,
              color: Colors.white,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
