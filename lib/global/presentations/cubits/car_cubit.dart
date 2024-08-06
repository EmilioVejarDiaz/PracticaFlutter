import 'package:bloc/bloc.dart';
import '../../data/models/car_model.dart';
import '../../repository/car_repository.dart';
import 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  final CarRepository _carRepository;

  CarCubit(this._carRepository) : super(CarInitial());

  Future<void> fetchCars() async {
    try {
      emit(CarLoading());
      final cars = await _carRepository.getCars();
      emit(CarLoaded(cars));
    } catch (e) {
      emit(CarError("Failed to fetch cars"));
    }
  }

  Future<void> addCar(CarModel car) async {
    try {
      emit(CarLoading());
      await _carRepository.addCar(car);
      final cars = await _carRepository.getCars();
      emit(CarLoaded(cars));
    } catch (e) {
      emit(CarError('Failed to add car'));
    }
  }

  Future<void> updateCar(CarModel car) async {
    try {
      await _carRepository.updateCar(car);
      fetchCars();
    } catch (e) {
      emit(CarError("Failed to update car"));
    }
  }

  Future<void> deleteCar(String id) async {
    try {
      await _carRepository.deleteCar(id);
      fetchCars();
    } catch (e) {
      emit(CarError("Failed to delete car"));
    }
  }
}
