import 'package:azar_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';  
import 'package:audioplayers/audioplayers.dart';


class AudioAzkarScreen extends StatefulWidget {
  const AudioAzkarScreen({super.key});

  @override
  State<AudioAzkarScreen> createState() => _AudioAzkarScreenState();
}

class _AudioAzkarScreenState extends State<AudioAzkarScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() => isPlaying = state == PlayerState.playing);
      }
    });
    _audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) setState(() => duration = newDuration);
    });
    _audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) setState(() => position = newPosition);
    });
  }

  Future<void> playAudio(String fileName) async {
    try {
      if (isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play(AssetSource('audio/$fileName'));
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      backgroundColor: AppColors.cardColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: const Text('سماع للأذكار', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.orangeAccent,
            indicatorWeight: 3,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            tabs: const [
              Tab(text: 'سماع أذكار الصباح'),
              Tab(text: 'سماع أذكار المساء'),
            ],
          ),
          
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPlayerTab('azkar_alsabah.mp3'),
                _buildPlayerTab('azkar_almasaa.mp3'), 
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerTab(String fileName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.scaffoldBgColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.dzanColor),
          ),
          child: Center(
            child: Icon(
              Icons.bar_chart_rounded, 
              size: 200, 
              color: isPlaying ? AppColors.primaryColor : AppColors.dzanColor,
            ),
          ),
        ),
        
        const SizedBox(height: 40),
        GestureDetector(
          onTap: () => playAudio(fileName),
          child: Icon(
            isPlaying ? Icons.pause_circle_filled_rounded : Icons.play_circle_fill_rounded,
            size: 100,
            color: isPlaying ? AppColors.primaryColor : AppColors.dzanColor,
          ),
        ),

        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble().clamp(0, duration.inSeconds.toDouble()),
                activeColor: Colors.black87,
                inactiveColor: AppColors.dzanColor,
                onChanged: (value) async {
                  await _audioPlayer.seek(Duration(seconds: value.toInt()));
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_formatTime(position), style: const TextStyle(color: Colors.grey)),
                    Text(_formatTime(duration), style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  String _formatTime(Duration d) {
    return "${d.inMinutes.remainder(60).toString().padLeft(2, '0')}:${d.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }
}