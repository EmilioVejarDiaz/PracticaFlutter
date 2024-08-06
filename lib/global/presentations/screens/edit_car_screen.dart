import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/car_model.dart';
import '../cubits/car_cubit.dart';

class EditCarScreen extends StatelessWidget {
  final CarModel car;

  EditCarScreen({required this.car});

  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _potenciaController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _marcaController.text = car.marca;
    _modeloController.text = car.modelo;
    _potenciaController.text = car.potencia.toString();
    _tipoController.text = car.tipo;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Car'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _marcaController,
              decoration: InputDecoration(labelText: 'Marca'),
            ),
            TextField(
              controller: _modeloController,
              decoration: InputDecoration(labelText: 'Modelo'),
            ),
            TextField(
              controller: _potenciaController,
              decoration: InputDecoration(labelText: 'Potencia'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _tipoController,
              decoration: InputDecoration(labelText: 'Tipo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedCar = car.copyWith(
                  marca: _marcaController.text,
                  modelo: _modeloController.text,
                  potencia: int.parse(_potenciaController.text),
                  tipo: _tipoController.text,
                );
                context.read<CarCubit>().updateCar(updatedCar);
                Navigator.of(context).pop();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
