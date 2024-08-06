import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'global/presentations/cubits/car_cubit.dart';
import 'global/presentations/screens/add_car_screen.dart';
import 'global/presentations/screens/home_screen.dart';
import 'global/repository/car_repository.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final carRepository = CarRepository();

    return BlocProvider(
      create: (context) => CarCubit(carRepository),
      child: MaterialApp(
        title: 'Car Management App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/addCar': (context) => AddCarScreen(),
        },
      ),
    );
  }
}
