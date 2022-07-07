import 'dart:developer';
import 'package:meditation_app/presentation/MainScreen/questionnaires/arguments_to_send.dart';

import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../image/logo.dart';
import '../custom_style/custom_text_style.dart';

class Meditations extends StatefulWidget {
  const Meditations({Key? key}) : super(key: key);

  @override
  _MeditationsState createState() => _MeditationsState();
}

class _MeditationsState extends State<Meditations> {
  late YoutubePlayerController _controller;
  //late TextEditingController _idController;
 //late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  late String msg;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoForMeditation,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
   // _idController = TextEditingController();
   // _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
  //  _idController.dispose();
   // _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Player Flutter',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        iconTheme: const IconThemeData(
          color: Colors.teal,
        ),
      ),
      home: YoutubePlayerBuilder(
        onEnterFullScreen: () {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        },
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.teal,
          onReady: () {
            _isPlayerReady = true;
          },
          onEnded: (data) {
            _showSnackBar('This meditation is over');
          },
        ),
        builder: (context, player) => Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                  bottom: 10.0, left: 10, right: 10, top: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      logo(),
                      Text(
                        'Meditation',
                        style: customTextStyle(
                            'Arima', Colors.black, 24, FontWeight.bold),
                      ),
                    ],
                  ),
                  _space,
                  player,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        underVideoBar(),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.teal),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ))),
                              child: Text(
                                'Return',
                                style: customTextStyle(
                                    'Arima', Colors.white, 20, FontWeight.bold),
                              ),
                              onPressed: () {
                                //Navigator.popUntil(context, ModalRoute.withName('/questions_first'));
                              },
                            ),
                            TextButton(
                              child: Text(
                                "Skip",
                                style: customTextStyle(
                                    'Arima', Colors.teal, 20, FontWeight.bold),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);

  Widget underVideoBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
          onPressed: _isPlayerReady
              ? () {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                  setState(() {});
                }
              : null,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
              onPressed: _isPlayerReady
                  ? () {
                      _muted ? _controller.unMute() : _controller.mute();
                      setState(() {
                        _muted = !_muted;
                      });
                    }
                  : null,
            ),
            SizedBox(
                width: 100,
                child: FlutterSlider(
                    values: [_volume],
                    min: 0,
                    max: 100,
                    step: FlutterSliderStep(step: 10),
                    handler: FlutterSliderHandler(
                      decoration: BoxDecoration(),
                      child: Material(
                        type: MaterialType.canvas,
                        color: Colors.teal,
                        //elevation: 3,
                        child: Container(
                          height: 20,
                          width: 3,
                        ),
                      ),
                    ),
                    trackBar: const FlutterSliderTrackBar(
                      activeTrackBar: BoxDecoration(color: Colors.teal),
                      inactiveTrackBar: BoxDecoration(color: Colors.grey),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      setState(() {
                        _volume = lowerValue;
                      });
                    })),
          ],
        ),
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
