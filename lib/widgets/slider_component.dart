import 'package:flutter/material.dart';

class SliderComponent extends StatefulWidget {
  const SliderComponent({Key? key}) : super(key: key);

  @override
  State<SliderComponent> createState() => _SliderComponentState();
}

class _SliderComponentState extends State<SliderComponent> {
  double _currentSliderValue=1.0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: Theme.of(context).primaryColor,
          overlayShape: SliderComponentShape.noOverlay,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
          valueIndicatorTextStyle: TextStyle(fontSize: 9,color: Colors.white),
          showValueIndicator: ShowValueIndicator.always,
          inactiveTrackColor: Colors.black12
      ),
      child: Slider(
          value: _currentSliderValue,
          max: 30,
          min: 1,
          label: '${_currentSliderValue.round()}km',
          onChanged: (value){
            setState(() {
              _currentSliderValue=value;
            });
          }),
    );
  }
}