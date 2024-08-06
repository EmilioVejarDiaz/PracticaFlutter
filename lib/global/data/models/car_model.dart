class CarModel {
  final String id;
  final String marca;
  final String modelo;
  final int potencia;
  final String tipo;

  CarModel({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.potencia,
    required this.tipo,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      marca: json['marca'],
      modelo: json['modelo'],
      potencia: json['potencia'],
      tipo: json['tipo'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'marca': marca,
    'modelo': modelo,
    'potencia': potencia,
    'tipo': tipo,
  };

  CarModel copyWith({
    String? id,
    String? marca,
    String? modelo,
    int? potencia,
    String? tipo,
  }) {
    return CarModel(
      id: id ?? this.id,
      marca: marca ?? this.marca,
      modelo: modelo ?? this.modelo,
      potencia: potencia ?? this.potencia,
      tipo: tipo ?? this.tipo,
    );
  }
}
