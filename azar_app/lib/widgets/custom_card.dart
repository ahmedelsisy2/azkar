import 'package:flutter/material.dart';
import 'package:azar_app/core/app_colors.dart';

class CustomAzkarCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap; // دي الوظيفة اللي بتبعتها من الهوم سكرين

  const CustomAzkarCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, 
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 60), 
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.primaryColor, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}