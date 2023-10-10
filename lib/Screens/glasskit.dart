import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class GlassKit extends StatelessWidget {
  final child, widtht, heightt;

  const GlassKit({super.key, required this.child, this.widtht, this.heightt});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
        height: heightt,
        width: widtht,
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.10),
            Colors.white.withOpacity(0.10)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderGradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(.60),
            Colors.black.withOpacity(.60)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.0, 0.39, 0.40, 1.0],
        ),
        blur: 15.0,
        borderWidth: 1.5,
        elevation: 3.0,
        isFrostedGlass: true,
        shadowColor: Colors.black.withOpacity(0.20),
        alignment: Alignment.center,
        frostedOpacity: 0.12,
        borderColor: Colors.transparent,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(15),
        borderRadius: BorderRadius.circular(10),
        child: child);
  }
}
