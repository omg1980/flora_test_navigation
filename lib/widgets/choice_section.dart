import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ChoiceSection extends StatelessWidget {
  final String title;
  final String description;
  final void Function()? onTap;
  const ChoiceSection({
    super.key,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.peach,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 30.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleLarge,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      description,
                      style: textTheme.bodyMedium,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    elevation: 0.0,
                    shape: const CircleBorder(),
                    backgroundColor: AppColors.purple,
                  ),
                  child: const Center(
                    child: Icon(
                      size: 30,
                      Icons.chevron_right,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
