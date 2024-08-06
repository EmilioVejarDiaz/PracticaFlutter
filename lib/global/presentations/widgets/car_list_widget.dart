import 'package:flutter/material.dart';
import '../../data/models/car_model.dart';
import 'car_item_widget.dart';

class CarListWidget extends StatelessWidget {
  final List<CarModel> cars;

  CarListWidget({required this.cars});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: (context, index) {
        return CarItemWidget(car: cars[index]);
      },
    );
  }
}