import 'package:flutter/material.dart';
import 'package:silesia_guide/utils/colors.dart';
import 'package:silesia_guide/utils/spacing.dart';
import 'package:silesia_guide/utils/text_styles.dart';

class ButtonComponent extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isFirstButton;

  const ButtonComponent({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isFirstButton,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(isFirstButton ? AppColors.backgroundFirstButtonColor : AppColors.whiteColor),
        foregroundColor: WidgetStateProperty.all<Color>(isFirstButton ? AppColors.whiteColor : AppColors.blackColor),
        padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: gap32)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
      child: Text(label, style: regularTextStyle),
    );
  }
}
