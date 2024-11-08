import 'package:flutter/material.dart';
import 'package:silesia_guide/components/buttons/button_component.dart';
import 'package:silesia_guide/utils/spacing.dart';
import 'package:silesia_guide/utils/texts.dart';

class ButtonsSection extends StatelessWidget {
  final Animation<double> animation;

  const ButtonsSection({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * animation.value + 60.0,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ButtonComponent(
                    label: paidText,
                    onPressed: () {},
                    isFirstButton: true,
                  ),
                  const SizedBox(width: gap8),
                  ButtonComponent(
                    label: freeText,
                    onPressed: () {},
                    isFirstButton: false,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
