import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';

class BoldText extends StatelessWidget {
  const BoldText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: context.general.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
        ));
  }
}
