import 'package:flutter/material.dart';
import 'package:flutter_animations/core/responsive/responsive.dart';
import 'package:flutter_animations/core/theme/app_text_style.dart';
import '../../data/wonder_model.dart';
import '../../core/widgets/app_bar_style.dart';
import '../image_fullscreen/image_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Wonder wonders;

  const DetailsScreen(this.wonders, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(wonders.title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        flexibleSpace: const StyleAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 700),
                      pageBuilder: (_, _, _) => ImageScreen(wonders),
                      transitionsBuilder: (_, animation, __, child) {
                        // плавное масштабирование от 0.8 до 1.0
                        final scaleAnimation =
                            Tween<double>(begin: 0.8, end: 1.0).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              ),
                            );
                        return ScaleTransition(
                          scale: scaleAnimation,
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                    ),
                  );
                },
                child: Hero(
                  tag: wonders.imageUrl,
                  transitionOnUserGestures: true,
                  child: Container(
                    height: ResponsiveHelper.pad(context, 0.55),
                    margin: EdgeInsets.all(ResponsiveHelper.pad(context, 0.08)),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(wonders.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(
                        ResponsiveHelper.radius(context, 0.02),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveHelper.pad(context, 0.1),
                ),
                child: Text(
                  wonders.description,
                  style: AppTextStyle.detailText(context),
                ),
              ),
              SizedBox(height: ResponsiveHelper.pad(context, 0.05)),
            ],
          ),
        ),
      ),
    );
  }
}
