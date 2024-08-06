import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/models/car_model.dart';


class CarRepository {
  final String baseUrl = 'https://8513gqcfz4.execute-api.us-east-1.amazonaws.com/dev';

  Future<List<CarModel>> getCars() async {
    final response = await http.get(Uri.parse('$baseUrl/cars'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((car) => CarModel.fromJson(car)).toList();
    } else {
      throw Exception('Failed to load cars');
    }
  }

  Future<void> addCar(CarModel car) async {
    final response = await http.post(
      Uri.parse('$baseUrl/cars'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(car.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add car');
    }
  }

  Future<void> updateCar(CarModel car) async {
    final response = await http.put(
      Uri.parse('$baseUrl/cars/${car.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(car.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update car');
    }
  }

  Future<void> deleteCar(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/cars/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete car');
    }
  }
}