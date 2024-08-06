import 'package:flutter/material.dart';
import '../../data/models/car_model.dart';
import '../cubits/car_cubit.dart';
import '../screens/edit_car_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CarItemWidget extends StatelessWidget {
  final CarModel car;

  CarItemWidget({required this.car});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(car.marca),
      subtitle: Text('${car.modelo} - ${car.potencia} HP'),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          _showDeleteConfirmationDialog(context);
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditCarScreen(car: car),
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this car?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                context.read<CarCubit>().deleteCar(car.id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
