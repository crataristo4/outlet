import 'package:flutter/material.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';

class SquigglyWaveformWidget extends StatelessWidget {
  const SquigglyWaveformWidget({
    Key? key,
    required this.maxDuration,
    required this.elapsedDuration,
    required this.samples,
    required this.waveformCustomizations,
  }) : super(key: key);

  final Duration maxDuration;
  final Duration elapsedDuration;
  final List<double> samples;
  final WaveformCustomizations waveformCustomizations;

  @override
  Widget build(BuildContext context) {
    return SquigglyWaveform(
      maxDuration: maxDuration,
      elapsedDuration: elapsedDuration,
      samples: samples,
      height: waveformCustomizations.height,
      width: waveformCustomizations.width,
      inactiveColor: waveformCustomizations.inactiveColor,
      invert: waveformCustomizations.invert,
      absolute: waveformCustomizations.absolute,
      activeColor: waveformCustomizations.activeColor,
      showActiveWaveform: waveformCustomizations.showActiveWaveform,
      strokeWidth: waveformCustomizations.borderWidth,
    );
  }
}

class WaveformCustomizations {
  WaveformCustomizations({
    required this.height,
    required this.width,
    this.activeColor = Colors.red,
    this.inactiveColor = Colors.blue,
    this.activeGradient,
    this.inactiveGradient,
    this.style = PaintingStyle.stroke,
    this.showActiveWaveform = true,
    this.absolute = false,
    this.invert = false,
    this.borderWidth = 1.0,
    this.activeBorderColor = Colors.white,
    this.inactiveBorderColor = Colors.white,
    this.isRoundedRectangle = false,
    this.isCentered = false,
  });

  double height;
  double width;
  Color inactiveColor;
  Gradient? inactiveGradient;
  bool invert;
  bool absolute;
  Color activeColor;
  Gradient? activeGradient;
  bool showActiveWaveform;
  PaintingStyle style;
  double borderWidth;
  Color activeBorderColor;
  Color inactiveBorderColor;
  bool isRoundedRectangle;
  bool isCentered;
}
