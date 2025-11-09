import 'package:flutter/material.dart';
import '../models/item_model.dart';

class ImageScreen extends StatelessWidget {
  final Wonder wonders;

  const ImageScreen(this.wonders, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: wonders.imageUrl,
            child: InteractiveViewer(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(wonders.imageUrl, fit: BoxFit.contain),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
