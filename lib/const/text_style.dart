import 'package:flutter/material.dart';

const colorizeTextStyle = TextStyle(fontSize: 37.0, fontFamily: 'AbrilFatface');

class WonderTitleText extends StatelessWidget {
  final String title;

  const WonderTitleText(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.indigo,
        height: 1.8,
        fontWeight: FontWeight.bold,
        fontFamily: 'AbrilFatface',
        fontSize: 18.0,
      ),
    );
  }
}

class WonderSubtitleText extends StatelessWidget {
  final String subtitle;

  const WonderSubtitleText(this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Kurale',
        height: 1.5,
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String description;

  const DescriptionText({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
        fontSize: 18.0,
        height: 2.0,
        fontFamily: 'Kurale',
      ),
      textAlign: TextAlign.start,
    );
  }
}
