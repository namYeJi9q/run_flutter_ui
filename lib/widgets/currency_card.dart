import 'package:flutter/material.dart';
import 'package:run_flutter_ui/styles/colors.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final Color? textColor, backgroundColor;
  final int index;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    this.textColor = Colors.white,
    this.backgroundColor = blackColor,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, index * -20),
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      code,
                      style: TextStyle(
                        color: textColor!.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
            //image
            Transform.scale(
              scale: 2.2,
              child: Transform.translate(
                offset: const Offset(-5, 12),
                child: Icon(icon, color: textColor, size: 80),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
