import 'package:flutter/material.dart';

import '../Fonts and Controllers/fontandcontroller.dart';

class MyRow extends StatelessWidget {
  final text1, text2, text3;
  const MyRow({super.key, this.text1, this.text2, this.text3});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        col("Wind", Icons.air, text1),
        col("Humidity", Icons.water_drop, text2),
        col("Pressure", Icons.waves, text3)
      ],
    );
  }
}

Column col(txt1, icon, txt2) => Column(
      children: [
        Text(
          txt1,
          style: primary,
        ),
        Icon(
          icon,
          color: whiteclr,
        ),
        Text(
          txt2,
          style: primary,
        )
      ],
    );
