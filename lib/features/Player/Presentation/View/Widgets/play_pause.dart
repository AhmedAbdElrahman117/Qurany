import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/core/constants.dart';

class PlayPause extends StatefulWidget {
  const PlayPause({
    super.key,
    required this.size,
    required this.player,
    required this.animationController,
  });

  final double size;
  final AudioPlayer player;
  final AnimationController animationController;

  @override
  State<PlayPause> createState() => _PlayPauseState();
}

class _PlayPauseState extends State<PlayPause> {
  late Animation<double> animation;

  @override
  void initState() {
    animation =
        Tween<double>(begin: 0, end: 1).animate(widget.animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        widget.animationController.toggle();
        widget.player.playing
            ? await widget.player.pause()
            : await widget.player.play();
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.pause_play,
        progress: animation,
        size: widget.size,
        color: kTextColor,
      ),
    );
  }
}
