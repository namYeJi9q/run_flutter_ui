import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const DialogWidget({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xfff2b33a),
      iconPadding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      icon: Container(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: const Icon(
            Icons.close,
            size: 16,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      contentPadding:
          const EdgeInsets.only(left: 9.5, right: 9.5, top: 0, bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xFF838E9E)),
              side: MaterialStatePropertyAll(
                  BorderSide(color: Color(0xFF838E9E))),
            ),
            child: const Text(
              "취소",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: OutlinedButton(
              onPressed: onPressed,
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  side: MaterialStatePropertyAll(
                      BorderSide(color: Colors.white))),
              child: const Text(
                "확인",
                style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              )),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
