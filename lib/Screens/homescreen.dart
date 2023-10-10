import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Fonts and Controllers/fontandcontroller.dart';
import '../api and models/api.dart';
import 'glasskit.dart';
import 'myrow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ApiClass>(context, listen: false).setLocation("kannur");
    Provider.of<ApiClass>(context, listen: false).fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<ApiClass>(context, listen: true).weatherList;
    final weatherdata = weather;

    return weatherdata == null
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            body: Stack(
              children: [
                const Image(
                  image: AssetImage('assets/bgg2.png'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {
                                    Provider.of<ApiClass>(context,
                                            listen: false)
                                        .setLocation(value);
                                    if (kDebugMode) {
                                      print("Direct val: $value");
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: const UnderlineInputBorder(),
                                      hintText: "Search Location",
                                      hintStyle: primary),
                                  style: primary,
                                  // controller: searchcntroler,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.search, color: whiteclr),
                                onPressed: () {
                                  Provider.of<ApiClass>(context, listen: false)
                                      .fetchdata();
                                },
                              ),
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${weatherdata.location.name.toString()}-${weatherdata.location.country}",
                            style: primary,
                          ),
                          Text(
                            "${weatherdata.current.tempC.toString()}°C",
                            style: large,
                          ),
                        ],
                      ),
                      GlassKit(
                        widtht: double.infinity,
                        heightt: 100,
                        child: MyRow(
                          text1:
                              "${weatherdata.current.windMph.toString()} Mph",
                          text2: weatherdata.current.humidity.toString(),
                          text3:
                              "${weatherdata.current.pressureMb.toString()} Mb",
                        ),
                      ),
                      GlassKit(
                        widtht: double.infinity,
                        heightt: 50,
                        child: Center(
                          child: Text(
                            weatherdata.current.condition.text,
                            style: primary,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          GlassKit(
                              widtht: 100,
                              heightt: 100,
                              child: col("Viscosity", Icons.ac_unit,
                                  "${weatherdata.current.visKm.toString()} km")),
                          GlassKit(
                              widtht: 100,
                              heightt: 100,
                              child: col("Feels like ", Icons.beach_access,
                                  "${weatherdata.current.feelslikeF.toString()} f")),
                          GlassKit(
                              widtht: 100,
                              heightt: 100,
                              child: col("Gust", Icons.sunny,
                                  "${weatherdata.current.gustMph.toString()} Mph")),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GlassKit(
                                widtht: 100,
                                heightt: 100,
                                child: col("Wind Dir", Icons.air_rounded,
                                    "${weatherdata.current.windDir.toString()} ")),
                            GlassKit(
                                widtht: 100,
                                heightt: 100,
                                child: col("Cloud", Icons.cloud,
                                    "${weatherdata.current.cloud.toString()} ")),
                            GlassKit(
                                widtht: 100,
                                heightt: 100,
                                child: col(
                                    "Precipe",
                                    Icons.precision_manufacturing_sharp,
                                    "${weatherdata.current.precipIn.toString()} In")),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          GlassKit(
                              widtht: 100,
                              heightt: 100,
                              child: col("Is day", Icons.dark_mode,
                                  "${weatherdata.current.isDay.toString()} ")),
                          GlassKit(
                              widtht: 100,
                              heightt: 100,
                              child: col("Cloud", Icons.cloud,
                                  "${weatherdata.current.cloud.toString()} ")),
                          GlassKit(
                              widtht: 100,
                              heightt: 100,
                              child: col(
                                  "Precipe",
                                  Icons.precision_manufacturing_sharp,
                                  "${weatherdata.current.precipIn.toString()} In")),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
