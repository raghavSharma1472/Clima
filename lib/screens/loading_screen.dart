import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var httpData = await WeatherModel().getLocationWeather();
    if(httpData == null){
      Alert(context: context, title: 'Error',desc: 'Please check your internet connection or location Permission').show();
    }
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => LocationScreen(weatherData: httpData,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          size: 50.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
