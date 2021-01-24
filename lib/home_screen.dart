import 'package:audio_player_app/audio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<AudioProvider>(
              builder: (_, audio, ch) => Column(
                children: [
                  SliderTheme(
                    data: SliderThemeData(
                      valueIndicatorColor: Colors.red,
                      trackHeight: 10,
                    ),
                    child: Slider(
                      activeColor: Colors.indigo,
                      inactiveColor: Colors.blue,
                      value: audio.position == null
                          ? 0
                          : audio.position.inMilliseconds.toDouble(),
                      onChanged: (val) {
                        audio.seekAudio(
                          Duration(
                            milliseconds: val.toInt(),
                          ),
                        );
                      },
                      min: 0,
                      max: audio.totalDuration == null
                          ? 20
                          : audio.totalDuration.inMilliseconds.toDouble(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          audio.position == null
                              ? ''
                              : audio.position.toString().split('.').first,
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          audio.totalDuration == null
                              ? ''
                              : audio.totalDuration.toString().split('.').first,
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Consumer<AudioProvider>(
              builder: (_, audio, ch) => GestureDetector(
                onTap: () {
                  audio.audioState == 'play'
                      ? audio.pauseAudio()
                      : audio.playAudio();
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.indigo,
                  ),
                  child: Center(
                    child: Icon(
                      audio.audioState == 'play'
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
