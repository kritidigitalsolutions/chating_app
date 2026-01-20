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
  int selectedIndex = -1; // No station selected initially
  double volume = 0.5;

  final List<Map<String, String>> stations = [
    {
      "name": "BBC Radio 1",
      "freq": "97.0",
      "url": "http://stream.live.vc.bbcmedia.co.uk/bbc_radio_one",
    },
    {
      "name": "BBC Radio 2",
      "freq": "88.0",
      "url": "http://stream.live.vc.bbcmedia.co.uk/bbc_radio_two",
    },
    {
      "name": "BBC Radio 3",
      "freq": "90.0",
      "url": "http://stream.live.vc.bbcmedia.co.uk/bbc_radio_three",
    },
    {
      "name": "BBC Radio 4",
      "freq": "92.0",
      "url": "http://stream.live.vc.bbcmedia.co.uk/bbc_radio_fourfm",
    },
  ];

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  /// Play/Pause toggle
  Future<void> togglePlay() async {
    if (selectedIndex == -1) return;

    if (isPlaying) {
      await _player.pause();
    } else {
      await _player.resume();
    }

    setState(() => isPlaying = !isPlaying);
  }

  /// Play specific station
  Future<void> playStation(int index) async {
    if (selectedIndex != index) {
      await _player.stop();
      await _player.play(UrlSource(stations[index]['url']!));
      setState(() {
        selectedIndex = index;
        isPlaying = true;
      });
    } else {
      togglePlay();
    }
  }

  /// Skip to next station
  void nextStation() {
    if (stations.isEmpty) return;
    int nextIndex = (selectedIndex + 1) % stations.length;
    playStation(nextIndex);
  }

  /// Skip to previous station
  void previousStation() {
    if (stations.isEmpty) return;
    int prevIndex = (selectedIndex - 1 + stations.length) % stations.length;
    playStation(prevIndex);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

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
                    itemCount: stations.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.85,
                        ),
                    itemBuilder: (_, index) => _radioCard(index),
                  ),
                ),

                const SizedBox(height: 20),

                /// VOLUME SLIDER
                Row(
                  children: [
                    const Icon(Icons.volume_down, color: Colors.white70),
                    Expanded(
                      child: Slider(
                        value: volume,
                        min: 0,
                        max: 1,
                        activeColor: AppColors.graPurple2,
                        inactiveColor: Colors.white24,
                        onChanged: (v) {
                          _player.setVolume(v);
                          setState(() => volume = v);
                        },
                      ),
                    ),
                    const Icon(Icons.volume_up, color: Colors.white70),
                  ],
                ),

                const SizedBox(height: 10),

                /// CONTROLS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _control(Icons.skip_previous, previousStation),
                    const SizedBox(width: 20),
                    _playButton(),
                    const SizedBox(width: 20),
                    _control(Icons.skip_next, nextStation),
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
              selectedIndex == -1
                  ? "Tune in to Relax!"
                  : "Playing: ${stations[selectedIndex]['name']}",
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
            if (selectedIndex != -1)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
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

  Widget _radioCard(int index) {
    final station = stations[index];
    final isCurrent = selectedIndex == index;

    return GestureDetector(
      onTap: () => playStation(index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isCurrent ? AppColors.mainColors : AppColors.graPurple2,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(isCurrent ? 0.15 : 0.06),
              Colors.transparent,
            ],
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
              station['freq']!,
              style: textStyle18(FontWeight.bold, color: Colors.white),
            ),
            Text(
              station['name']!,
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
      ),
    );
  }

  // ================= CONTROLS =================

  Widget _control(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: AppColors.graPurple1,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _playButton() {
    if (selectedIndex == -1) return const SizedBox.shrink();

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
