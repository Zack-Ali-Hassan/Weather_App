import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather/weather.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../widges/widget.dart';
import 'widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  Weather? weather;
  bool isLoading = false;
  WeatherFactory wf = new WeatherFactory("cd2febd548d28e6b1ffacdffda33d3a8");
  void goToSearchScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SearchScreen();
        },
      ),
    );
  }

  Future<Position> getMyLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  Future<void> getMyWeather() async {
    setState(() {
      isLoading = !isLoading;
    });
    Position position = await getMyLocation();

    weather = await wf.currentWeatherByLocation(
        position.latitude, position.longitude);
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => getMyWeather(),
            icon: Icon(Icons.pin_drop_outlined),
            tooltip: 'location',
          ),
          IconButton(
            onPressed: () {
              goToSearchScreen();
            },
            icon: Icon(Icons.search),
            tooltip: 'search',
          ),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                  "https://images.pexels.com/photos/1563256/pexels-photo-1563256.jpeg?auto=compress&cs=tinysrgb&w=600"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.darken),
            ),
          ),
          child:
              weather == null ? WelcomeView() : WeatherView(weather: weather!),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: Text("Cimilo-sheeg"),
                content: Text(
                  "Cimilo-sheeg waa application kaa saacidaaya inaad ogaati cimilada meesha aad joogti had iyo jeer.",
                ),
                contentTextStyle: TextStyle(color: Colors.black),
                titleTextStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok, got it!"),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'App Info',
        child: const Icon(Icons.info_outline),
      ),
    );
  }
}
