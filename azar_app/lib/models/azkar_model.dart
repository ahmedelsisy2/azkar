class AzkarModel {
  final String title;  // الاسم اللي هيظهر بالعربي (مثلاً: أذكار الصباح)
  final String image;  // الصورة (هناديها من AppAssets)
  final String? audio; // الصوت (هناديه من AppSounds) - عملناه اختياري عشان لو فيه ذكر ملوش صوت

  AzkarModel({
    required this.title,
    required this.image,
    this.audio,
  });
}