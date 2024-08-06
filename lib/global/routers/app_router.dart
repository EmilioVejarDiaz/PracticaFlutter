import 'package:flutter/material.dart';

import '../data/models/car_model.dart';
import '../presentations/screens/add_car_screen.dart';
import '../presentations/screens/home_screen.dart';
import '../presentations/screens/edit_car_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/addCar':
        return MaterialPageRoute(builder: (_) => AddCarScreen());
      case '/editCar':
        final car = settings.arguments as CarModel;
        return MaterialPageRoute(builder: (_) => EditCarScreen(car: car));
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
