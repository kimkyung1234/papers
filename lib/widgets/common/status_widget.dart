import 'package:flutter/material.dart';
import 'package:papers/widgets/widgets.dart';

Widget statusWidget({required String status}) {
  late bool isOpne;
  status == 'closed' ? isOpne = false : isOpne = true;

  return Row(
    children: [
      SizedBox(
        width: isOpne ? 60 : 70,
        height: 25,
        child: Container(
          decoration: BoxDecoration(
            color: isOpne ? const Color(0xFFCAEAD4) : const Color(0xFFEFCDC2),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: isOpne
                      ? const Color(0xFF60B274)
                      : const Color(0xFFD16447),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
              ),
              const SizedBox(width: 4),
              CustomText(
                text: status,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ),
      ),
    ],
  );
}
