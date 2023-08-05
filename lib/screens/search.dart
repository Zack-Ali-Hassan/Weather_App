import 'package:cached_network_image/cached_network_image.dart';
import 'package:cimilosheeg/widges/weather_view.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather/weather.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String cityName = "";
  Weather? weather;
  bool isLoading = false;
  WeatherFactory wf = new WeatherFactory("cd2febd548d28e6b1ffacdffda33d3a8");

  Future<void> getMyWeather() async {
    try {
      setState(() {
        isLoading = !isLoading;
      });

      weather = await wf.currentWeatherByCityName(cityName);
      setState(() {
        isLoading = !isLoading;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        duration: Duration(seconds: 5),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.9),
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
                  Colors.black.withOpacity(0.9), BlendMode.darken),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onSubmitted: (value) {
                    cityName = value;
                    getMyWeather();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                    labelText: "Enter Country or City name",
                  ),
                ),
              ),
              Expanded(
                child: weather == null
                    ? Container()
                    : WeatherView(weather: weather!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
