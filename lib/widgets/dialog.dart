import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogWidget {
  final String text;
  final VoidCallback onPressed;

  DialogWidget({required this.text, required this.onPressed});

  widget(Widget button) {
    return AlertDialog(
      iconPadding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      icon: Container(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: const Icon(
            Icons.close,
            size: 16,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      contentPadding:
          const EdgeInsets.only(left: 59.5, right: 59.5, top: 0, bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: OutlinedButton(
            onPressed: () => Get.back(),
            child: const Text(
              "취소",
              style: TextStyle(
                color: Color(0xFF838E9E),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: OutlinedButton(
              onPressed: onPressed,
              child: const Text(
                "확인",
                style: TextStyle(
                  color: Color(0xfff2b33a),
                ),
              )),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
