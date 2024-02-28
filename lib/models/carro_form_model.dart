import 'package:json_annotation/json_annotation.dart';

part 'carro_form_model.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: true,
)
class CarroForm {
  double? quilometragemSaida;
  double? quilometragemChegada;
  String? horaDeSaida;
  String? horaDeVolta;

  CarroForm();

  @override
  String toString() {
    return 'CarroForm';
  }

  factory CarroForm.fromJson(Map<String, dynamic> json) =>
      _$CarroFormFromJson(json);

  Map<String, dynamic> toJson() => _$CarroFormToJson(this);

  Map<String, List<Enum>>? enumUsed() {
    return null;
  }
}
