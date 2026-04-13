import 'package:flutter/material.dart';
import 'package:azar_app/core/app_colors.dart';


class AzkarTextScreen extends StatefulWidget {
  const AzkarTextScreen({super.key});

  @override
  State<AzkarTextScreen> createState() => _AzkarTextScreenState();
}

class _AzkarTextScreenState extends State<AzkarTextScreen> {
  final PageController _morningController = PageController();
final PageController _eveningController = PageController();
  final List<Map<String, dynamic>> morningAzkar = [
    {'title':
     'آية الكرسي',
      'text':
       "أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ\nاللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ.",
        'count': 1,
         'current': 1
         },
    {'title':
     'الإخلاص',
      'text':
      "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\nقُلْ هُوَ ٱللَّهُ أَحَدٌ، ٱللَّهُ ٱلصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ.", 
      'count': 3,
       'current': 3
       },
    {'title': 
    'الفلق', 
    'text':
     "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\nقُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ， وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.",
      'count': 3,
       'current': 3
       },
    {'title': 
    'الناس', 
    'text':
     "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\nقُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ، مَلِكِ ٱلنَّاسِ، إِلَٰهِ ٱلنَّاسِ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ، ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ، مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ.",
    'count': 3,
     'current': 3
     },
    {'text':
     "أَصْبَـحْنا وَأَصْبَـحَ المُـلْكُ لله وَالحَمدُ لله، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير، رَبِّ أسْـأَلُـكَ خَـيرَ ما في هـذا اليوم وَخَـيرَ ما بَعْـدَه، وَأَعـوذُ بِكَ مِنْ شَـرِّ ما في هـذا اليوم وَشَرِّ ما بَعْـدَه.", 
    'count': 1, 
    'current': 1
    },
    {'text': 
    "اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ، خَلَقْتَنـي وَأَنا عَبْـدُك، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ.", 
    'count': 1,
     'current': 1
     },
    {'text':
     "رَضيـتُ بِاللهِ رَبَّـاً وَالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً.", 
    'count': 3, 
    'current': 3
     },
    {'text':
     "اللّهُـمَّ إِنِّـي أَصْبَـحْتُ أُشْـهِدُك، وَأُشْـهِدُ حَمَلَـةَ عَـرْشِـك، وَمَلائِكَتَكَ، وَجَمـيعَ خَلْـقِك، أَنَّـكَ أَنْـتَ اللهُ لا إلهَ إلاّ أَنْـتَ وَحْـدَكَ لا شَريكَ لَـك، وَأَنَّ ُ مُحَمّـداً عَبْـدُكَ وَرَسـولُـك.",
      'count': 4, 
      'current': 4
      },
      {'text':
      "اللّهُـمَّ ما أَصْبَـَحَ بي مِـنْ نِعْـمَةٍ أَو بِأَحَـدٍ مِـنْ خَلْـقِك ، فَمِـنْكَ وَحْـدَكَ لا شريكَ لَـك ، فَلَـكَ الْحَمْـدُ وَلَـكَ الشُّكْـر.",
      'count': 1, 
      'current': 1
      },
      {'text':
      "حَسْبِـيَ اللّهُ لا إلهَ إلاّ هُوَ عَلَـيهِ تَوَكَّـلتُ وَهُوَ رَبُّ العَرْشِ العَظـيم.",
      'count': 7, 
      'current': 7
      },
    {'text': 
    "بِسـمِ اللهِ الذي لا يَضُـرُّ مَعَ اسمِـهِ شَيءٌ في الأرْضِ وَلا في السّمـاءِ وَهـوَ السّمـيعُ العَلـيم.",
     'count': 3, 
     'current': 3
     },
     {
      'text':
      "اللّهُـمَّ بِكَ أَصْـبَحْنا وَبِكَ أَمْسَـينا ، وَبِكَ نَحْـيا وَبِكَ نَمُـوتُ وَإِلَـيْكَ النُّـشُور.",
      'count': 1, 
      'current': 1
     },
     {'text':
     "أَصْبَـحْـنا عَلَى فِطْرَةِ الإسْلاَمِ، وَعَلَى كَلِمَةِ الإِخْلاَصِ، وَعَلَى دِينِ نَبِيِّنَا مُحَمَّدٍ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ، وَعَلَى مِلَّةِ أَبِينَا إبْرَاهِيمَ حَنِيفاً مُسْلِماً وَمَا كَانَ مِنَ المُشْرِكِينَ.",
     'count': 1, 
      'current': 1
     },
     {
      'text':
      "سُبْحـانَ اللهِ وَبِحَمْـدِهِ عَدَدَ خَلْـقِه ، وَرِضـا نَفْسِـه ، وَزِنَـةَ عَـرْشِـه ، وَمِـدادَ كَلِمـاتِـه.",
      'count': 3, 
      'current': 3
     },
    {'text':
     "اللّهُـمَّ عافِـني في بَدَنـي، اللّهُـمَّ عافِـني في سَمْـعي، اللّهُـمَّ عافِـني في بَصَـري، لا إلهَ إلاّ أَنْـتَ.",
      'count': 3,
       'current': 3
       },
       {'text':
       ".اللّهُـمَّ إِنّـي أَعـوذُ بِكَ مِنَ الْكُـفر ، وَالفَـقْر ، وَأَعـوذُ بِكَ مِنْ عَذابِ القَـبْر ، لا إلهَ إلاّ أَنْـتَ",
        'count': 3,
        'current': 3
       },
       {'text':
       "اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ وَالعـافِـيةَ في الدُّنْـيا وَالآخِـرَة ، اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ وَالعـافِـيةَ في ديني وَدُنْـيايَ وَأهْـلي وَمالـي ، اللّهُـمَّ اسْتُـرْ عـوْراتي وَآمِـنْ رَوْعاتـي ، اللّهُـمَّ احْفَظْـني مِن بَـينِ يَدَيَّ وَمِن خَلْفـي وَعَن يَمـيني وَعَن شِمـالي ، وَمِن فَوْقـي ، وَأَعـوذُ بِعَظَمَـتِكَ أَن أُغْـتالَ مِن تَحْتـي.",
        'count': 1,
        'current': 3
       },
    {'text':
    "يَا حَيُّ يَا قيُّومُ بِرَحْمَتِكَ أسْتَغِيثُ أصْلِحْ لِي شَأنِي كُلَّهُ وَلاَ تَكِلْنِي إلَى نَفْسِي طَـرْفَةَ عَيْنٍ",
     'count': 3, 
     'current': 3
     },
     {'text':
     "أَصْبَـحْـنا وَأَصْبَـحْ المُـلكُ للهِ رَبِّ العـالَمـين ، اللّهُـمَّ إِنِّـي أسْـأَلُـكَ خَـيْرَ هـذا الـيَوْم ، فَـتْحَهُ ، وَنَصْـرَهُ ، وَنـورَهُ وَبَـرَكَتَـهُ ، وَهُـداهُ ، وَأَعـوذُ بِـكَ مِـنْ شَـرِّ ما فـيهِ وَشَـرِّ ما بَعْـدَه.",
      'count': 1, 
      'current': 1
     },
     {'text':
     "اللّهُـمَّ عالِـمَ الغَـيْبِ وَالشّـهادَةِ فاطِـرَ السّماواتِ وَالأرْضِ رَبَّ كـلِّ شَـيءٍ وَمَليـكَه ، أَشْهَـدُ أَنْ لا إِلـهَ إِلاّ أَنْت ، أَعـوذُ بِكَ مِن شَـرِّ نَفْسـي وَمِن شَـرِّ الشَّيْـطانِ وَشِرْكِهِ ، وَأَنْ أَقْتَـرِفَ عَلـى نَفْسـي سوءاً أَوْ أَجُـرَّهُ إِلـى مُسْـلِم.",
      'count': 1, 
      'current': 1
     },
     {
      'text':
      "أَعـوذُ بِكَلِمـاتِ اللّهِ التّـامّـاتِ مِنْ شَـرِّ ما خَلَـق.",
      'count': 3,
      'current': 3
     },
    {'text':
     "اللّهُـمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحَمَّد.", 
     'count': 10, 
     'current': 10
     },
    {'text':
     "سُبْحـانَ اللهِ وَبِحَمْـدِهِ.",
      'count': 100, 
      'current': 100
      },
    {'text':
     "أَسْتَغْفِرُ اللهَ وَأَتُوبُ إِلَيْهِ.",
      'count': 100, 
      'current': 100
      },
  ];

  // ---------------- أذكار المساء كاملة ----------------
  final List<Map<String, dynamic>> eveningAzkar = [
    {'title': 
    'آية الكرسي',
     'text':
      "أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ\nاللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ.",
       'count': 1, 
       'current': 1
       },
    {'title':
     'خواتيم سورة البقرة', 
     'text': 
     "آمَنَ الرَّسُولُ بِمَا أُنْزِلَ إِلَيْهِ مِنْ رَبِّهِ وَالْمُؤْمِنُونَ ۚ كُلٌّ آمَنَ بِاللَّهِ وَمَلَائِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ لَا نُفَرِّقُ بَيْنَ أَحَدٍ مِنْ رُسُلِهِ ۚ وَقَالُوا سَمِعْنَا وَأَطَعْنَا ۖ غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ. لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا لَهَا مَا كَسَبَتْ وَعَلَيْهَا مَا اكْتَسَبَتْ رَبَّنَا لَا تُؤَاخِذْنَا إِنْ نَّسِينَآ أَوْ أَخْطَأْنَا رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنْتَ مَوْلَانَا فَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ.",
      'count': 1, 
      'current': 1
      },
    {'title': 
    'الإخلاص', 'text': "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\nقُلْ هُوَ ٱللَّهُ أَحَدٌ، ٱللَّهُ ٱلصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ.", 
    'count': 3, 
    'current': 3
    },
    {'title': 
    'الفلق', 'text': "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\nقُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.", 
    'count': 3, 
    'current': 3
    },
    {'title':
     'الناس', 'text': "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\nقُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ، مَلِكِ ٱلنَّاسِ، إِلَٰهِ ٱلنَّاسِ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ， ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ， مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ.", 
     'count': 3, 
     'current': 3
     },
    {'text':
    
     "أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ، وَالْحَمْدُ لِلَّهِ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير، رَبِّ أسْـأَلُـكَ خَـيرَ ما في هـذهِ اللَّيْلَةِ وَخَـيرَ ما بَعْـدَها، وَأَعـوذُ بِكَ مِنْ شَـرِّ ما في هـذهِ اللَّيْلَةِ وَشَرِّ ما بَعْـدَها.", 
     'count': 1,
      'current': 1
     },
    {'text':
     "اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ، خَلَقْتَنـي وَأَنا عَبْـدُك، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ.", 
     'count': 1, 
     'current': 1
     },
    {'text':
     "بِسـمِ اللهِ الذي لا يَضُـرُّ مَعَ اسمِـهِ شَيءٌ في الأرْضِ وَلا في السّمـاءِ وَهـوَ السّمـيعُ العَلـيم.",
      'count': 3, 
      'current': 3
      },
    {'text':
     "رَضيـتُ بِاللهِ رَبَّـاً وَبِالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً.",
     'count': 3,
      'current': 3
     },
    {'text':
     "حَسْبِـيَ اللّهُ لا إلهَ إلاّ هُوَ عَلَـيهِ تَوَكَّـلتُ وَهُوَ رَبُّ العَرْشِ العَظـيم.",
    
     'count': 7, 'current': 7
     },
    {'text':
     "أَعـوذُ بِكَلِمـاتِ اللّهِ التّـامّـاتِ مِنْ شَرِّ ما خَلَق.", 
     'count': 3,
      'current': 3
     },
    {'text':
     "اللّهُـمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحَمَّد.",
      'count': 10,
       'current': 10
      },
    {'text':
     "سُبْحـانَ اللهِ وَبِحَمْـدِهِ.", 
     'count': 100,
      'current': 100
     },
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: AppColors.primaryColor,
          title: const Text('أذكار الصباح والمساء', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            indicatorWeight: 4,
            tabs: [
              Tab(child: Text('أذكار الصباح', style: TextStyle(fontSize: 18))),
              Tab(child: Text('أذكار المساء', style: TextStyle(fontSize: 18))),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildAzkarPageView(morningAzkar, _morningController),
            _buildAzkarPageView(eveningAzkar, _eveningController),
          ],
        ),
      ),
    );
  }


  Widget _buildAzkarPageView(List<Map<String, dynamic>> list, PageController controller) {
    return PageView.builder(
      controller: controller,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('${index + 1} / ${list.length}', style: const TextStyle(fontSize: 18, color: Colors.grey)),
              const SizedBox(height: 10),
              if (list[index]['title'] != null)
                Text(list[index]['title'], style: TextStyle(fontSize: 22, color: AppColors.primaryColor, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Text(
                        list[index]['text'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 1.6),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (list[index]['current'] > 0) {
                    setState(() {
                      list[index]['current']--;
                    });
                  }
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: list[index]['current'] == 0 ? Colors.green : Colors.grey.shade100,
                    border: Border.all(color: AppColors.primaryColor, width: 4),
                  ),
                  child: Center(
                    child: Text(
                      '${list[index]['current']}',
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, 
                      color: list[index]['current'] == 0 ? Colors.white : AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
               CircleAvatar(radius: 25,
                backgroundColor: Colors.teal, 
                child: IconButton(onPressed: () {},
                 icon: Icon(Icons.share, 
                 color: Colors.white)
                 )),
                CircleAvatar(
                 radius: 25, 
                 backgroundColor: AppColors.primaryColor, 
                 child: IconButton(
                 icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                  onPressed:()
                    => controller.previousPage(duration: Duration(milliseconds: 300), 
                  curve: Curves.easeInOut),
                   ),
                  ),
                CircleAvatar(
                 radius: 25, 
                 backgroundColor: AppColors.primaryColor, 
                 child: IconButton(
                   icon: Icon(Icons.arrow_forward_ios, 
                   color: Colors.white, size: 20),
                    onPressed: () 
                    => controller.nextPage(duration: Duration(milliseconds: 300),
                     curve: Curves.easeInOut),
                  ),
                ),
                ],
              ),
              SizedBox(height: 30),
            ],    
          ),
        );
      },
    );
  }
}