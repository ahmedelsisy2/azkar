import 'package:azar_app/core/app_assets.dart';
import 'package:azar_app/core/app_colors.dart';
import 'package:azar_app/core/app_navigation.dart'; 
import 'package:azar_app/models/azkar_model.dart';
import 'package:azar_app/screen/audio_screen.dart'; 
import 'package:azar_app/screen/azkar_text_screen.dart'; 
import 'package:azar_app/screen/sedha_screen.dart'; 
import 'package:azar_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    final List<AzkarModel> azkarList = [
      AzkarModel(title: 'اذكار الصباح والمساء', image: AppAssests.elhelal),
      AzkarModel(title: 'سماع الأذكار', image: AppAssests.azan),
      AzkarModel(title: 'المسبحة', image: AppAssests.alsedhaa),
      AzkarModel(title: 'الأذكار الشاملة', image: AppAssests.qibla),
      AzkarModel(title: 'الرقية الشرعية', image: AppAssests.elmoshaf),
      AzkarModel(title: 'إضافة ذكر', image: AppAssests.alsedhaa),
      AzkarModel(title: 'أدعية رمضان', image: AppAssests.elhelal),
      AzkarModel(title: 'أسماء الله الحسنى', image: AppAssests.allah),
      AzkarModel(title: 'الإعدادات', image: AppAssests.star),
    ];

    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: AppColors.primaryColor,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.85,
                    ),
                    itemCount: azkarList.length - 1,
                    itemBuilder: (context, index) {
                      return CustomAzkarCard(
                        title: azkarList[index].title,
                        imagePath: azkarList[index].image,
                        onTap: () {
                          if (azkarList[index].title == 'اذكار الصباح والمساء') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AzkarTextScreen()),
                            );
                          } else if (azkarList[index].title == 'سماع الأذكار') {
                            AppNavigation.navigateTo(context, const AudioAzkarScreen());
                          } 
                          else if (azkarList[index].title == 'المسبحة') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SebhaScreen()),
                            );
                          } 
                          else {
                            print("تم الضغط على: ${azkarList[index].title}");
                          }
                        },
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: CustomAzkarCard(
                        title: azkarList.last.title,
                        imagePath: azkarList.last.image,
                        onTap: () => print("الاعدادات"),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}