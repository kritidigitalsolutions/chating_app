import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/textStyle.dart';

class LiveRadioPage extends StatefulWidget {
  const LiveRadioPage({super.key});

  @override
  State<LiveRadioPage> createState() => _LiveRadioPageState();
}

class _LiveRadioPageState extends State<LiveRadioPage> {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;

  /// Example LIVE radio stream URL
  final String radioUrl = "https://stream-ssl.arenastreaming.com:8000/indiafm";

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> togglePlay() async {
    if (isPlaying) {
      await _player.pause();
    } else {
      await _player.play(UrlSource(radioUrl));
    }
    setState(() => isPlaying = !isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.graPurple1,
              AppColors.gradientBlack,
              AppColors.balckBlue,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                const SizedBox(height: 20),

                /// RADIO GRID
                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.85,
                        ),
                    itemBuilder: (_, index) => _radioCard(),
                  ),
                ),

                /// SLIDER
                Slider(
                  value: 0.4,
                  onChanged: (_) {},
                  activeColor: AppColors.graPurple2,
                  inactiveColor: Colors.white24,
                ),

                const SizedBox(height: 10),

                /// CONTROLS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _control(Icons.skip_previous),
                    const SizedBox(width: 20),
                    _playButton(),
                    const SizedBox(width: 20),
                    _control(Icons.skip_next),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================= HEADER =================

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Live Radio",
              style: textStyle24(FontWeight.bold, color: Colors.white),
            ),
            Text(
              "Tune in to Relax!",
              style: textStyle14(FontWeight.w400, color: Colors.white70),
            ),
          ],
        ),
        Stack(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.graPurple1,
              child: const Icon(Icons.radio, color: Colors.white),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "LIVE",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ================= RADIO CARD =================

  Widget _radioCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.graPurple2),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white.withOpacity(0.06), Colors.transparent],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.favorite, color: Colors.white70, size: 16),
          ),
          Text(
            "98.3",
            style: textStyle18(FontWeight.bold, color: Colors.white),
          ),
          Text(
            "Radio Mirchi",
            style: textStyle13(FontWeight.w400, color: Colors.white70),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              8,
              (i) => Container(
                width: 6,
                height: (i + 1) * 6.0,
                decoration: BoxDecoration(
                  color: AppColors.graPurple2,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= CONTROLS =================

  Widget _control(IconData icon) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: AppColors.graPurple1,
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _playButton() {
    return GestureDetector(
      onTap: togglePlay,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.graPurple2,
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
