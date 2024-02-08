import 'package:json_annotation/json_annotation.dart';

part 'romaneio_model.g.dart';

enum Especie { pinus, eucalipto, selecionar }

enum Destino { vendas, serraria, picador, selecionar }

@JsonSerializable(
  createFactory: true,
  createToJson: true,
)
class Romaneio {
  String fornecedor = "f";
  Especie especie = Especie.selecionar;
  Destino destino = Destino.selecionar;
  String destinoComplemeneto = "d";
  double comprimento = 0;
  double altura = 0;
  double largura = 0;
  double volume = 0;
  double diametro = 0;
  double comprimentoCarga = 0;
  double equipamento = 0;
  String placa = "p";
  String operador = "o";
  String motorista = "m";
  DateTime data = DateTime.now();

  Romaneio();

  factory Romaneio.fromJson(Map<String, dynamic> json) =>
      _$RomaneioFromJson(json);

  Map<String, dynamic> toJson() => _$RomaneioToJson(this);
}
