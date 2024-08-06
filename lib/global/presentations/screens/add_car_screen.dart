import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/car_model.dart';
import '../cubits/car_cubit.dart';

class AddCarScreen extends StatelessWidget {
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _potenciaController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Car'),
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
            ElevatedButton(
              onPressed: () {
                // Validación de campos antes de enviar
                if (_marcaController.text.isEmpty ||
                    _modeloController.text.isEmpty ||
                    _potenciaController.text.isEmpty ||
                    _tipoController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Todos los campos son obligatorios')),
                  );
                  return;
                }

                // Convertir potencia a número
                final int potencia;
                try {
                  potencia = int.parse(_potenciaController.text);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Potencia debe ser un número válido')),
                  );
                  return;
                }

                // Crear el objeto CarModel y añadirlo
                final car = CarModel(
                  id: '0', // Este ID se actualizará en el servidor
                  marca: _marcaController.text,
                  modelo: _modeloController.text,
                  potencia: potencia,
                  tipo: _tipoController.text,
                );

                // Añadir el coche usando el cubit
                context.read<CarCubit>().addCar(car);

                // Volver a la pantalla anterior
                Navigator.of(context).pop();
              },
              child: Text('Add Car'),
            ),
          ],
        ),
      ),
    );
  }
}
