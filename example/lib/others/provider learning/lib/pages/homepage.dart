import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/local_settings_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final String url = 'https://aarifhusain.com/audios/Tujhe%20Dekha%20To.mp3';
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  // await audioPlayer.play(UrlSource('https://aarifhusain.com/audios/Tujhe%20Dekha%20To.mp3'));
  /// all initialization
  Future<Object?> _init() async {
    await LocalSettings.getPref();
  }

  // Future<void> sliderOnChanged(value) async {
  //   final newPosition = Duration(seconds: value.toInt());
  //   await audioPlayer.seek(newPosition);
  // }
  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init(),
      builder: (c, d) => Scaffold(
        appBar: AppBar(title: Text("Audio player")),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            children: [
              Image.asset("assets/images/DDLJ.png", width: 300, height: 300),
              Text(
                "Song Name",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text("https://aarifhusain.com/audios/Tujhe%20Dekha%20To.mp3"),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("current playing at"),
                    Text("Total length of song"),
                  ],
                ),
              ),
              CircleAvatar(
                child: IconButton(
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.play(
                        AssetSource("assets/audios/Tujhe Dekha To.mp3"),
                      );
                    }
                  },
                  icon: Icon(Icons.play_arrow),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
