import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:azar_app/core/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int _counter = 0; 
  int _totalCounter = 0; 
  String _selectedAzkar = "سبحان الله"; 

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }
  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
      _totalCounter = prefs.getInt('totalCounter') ?? 0;
      _selectedAzkar = prefs.getString('selectedAzkar') ?? "سبحان الله";
    });
  }
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', _counter);
    await prefs.setInt('totalCounter', _totalCounter);
    await prefs.setString('selectedAzkar', _selectedAzkar);
  }
  void _resetTotalCounter() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("تنبيه", textAlign: TextAlign.center),
        content: const Text("هل تريد تصفير إجمالي التسبيح؟", textAlign: TextAlign.center),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("إلغاء")),
          TextButton(
            onPressed: () async {
              setState(() => _totalCounter = 0);
              final prefs = await SharedPreferences.getInstance();
              await prefs.setInt('totalCounter', 0);
              Navigator.pop(context);
            },
            child: const Text("تصفير الآن", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
  void _showAzkarDialog() {
    showDialog(
      context: context,
      builder: (context) {
        List<String> azkarList = [
          "سبحان الله",
         "الحمد لله",
        "لا إله إلا الله",
         "الله أكبر",
          "أستغفر الله",
          "لا حول ولا قوة إلا بالله",
          "سبحان الله وبحمده سبحان الله العظيم",
          "لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير",
          "اللهم اغفر لي ذنوبي كلها، دقها وجلها، أولها وآخرها، علانيتها وسرها",
          ];
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text("اختر الذكر", textAlign: TextAlign.center),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: azkarList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(azkarList[index], textAlign: TextAlign.center),
                  onTap: () {
                    setState(() {
                      _selectedAzkar = azkarList[index];
                      _counter = 0;
                    });
                    _saveData();
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: const Text("المسبحة الإلكترونية", style: TextStyle(color: AppColors.cardColor)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.cardColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _showAzkarDialog,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primaryColor, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_drop_down, color: AppColors.secondaryColor),
                  Text(_selectedAzkar, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),

          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: _buildInfoBox(
                    title: "العدد",
                    value: _counter,
                    onTap: () {
                      setState(() => _counter = 0);
                      _saveData();
                    },
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildInfoBox(
                    title: "إجمالي الذكر",
                    value: _totalCounter,
                    onTap: _resetTotalCounter,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 60),
          GestureDetector(
            onTap: () {
              setState(() {
                _counter++;
                _totalCounter++;
              });
              _saveData();
            },
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.cardColor,
                border: Border.all(color: AppColors.primaryColor, width: 10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "$_counter",
                  style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          
          const Spacer(),
          
          const Text("اضغط على المربعات الخضراء للتصفير", style: TextStyle(color: AppColors.secondaryColor, fontSize: 12)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
  Widget _buildInfoBox({required String title, required int value, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.scaffoldBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(title, style: const TextStyle(color: AppColors.cardColor, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text("$value", style: const TextStyle(color: AppColors.cardColor, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}