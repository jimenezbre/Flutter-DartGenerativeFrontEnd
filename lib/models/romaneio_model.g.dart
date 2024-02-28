// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'romaneio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Romaneio _$RomaneioFromJson(Map<String, dynamic> json) => Romaneio()
  ..fornecedor = json['fornecedor'] as String
  ..especie = $enumDecode(_$EspecieEnumMap, json['especie'])
  ..destino = $enumDecode(_$DestinoEnumMap, json['destino'])
  ..destinoComplemeneto = json['destinoComplemeneto'] as String
  ..comprimento = (json['comprimento'] as num).toDouble()
  ..altura = (json['altura'] as num).toDouble()
  ..largura = (json['largura'] as num).toDouble()
  ..volume = (json['volume'] as num).toDouble()
  ..diametro = (json['diametro'] as num).toDouble()
  ..comprimentoCarga = (json['comprimentoCarga'] as num).toDouble()
  ..equipamento = json['equipamento'] as String
  ..placa = json['placa'] as String
  ..operador = json['operador'] as String
  ..motorista = json['motorista'] as String
  ..data = DateTime.parse(json['data'] as String);

Map<String, dynamic> _$RomaneioToJson(Romaneio instance) => <String, dynamic>{
      'fornecedor': instance.fornecedor,
      'especie': _$EspecieEnumMap[instance.especie]!,
      'destino': _$DestinoEnumMap[instance.destino]!,
      'destinoComplemeneto': instance.destinoComplemeneto,
      'comprimento': instance.comprimento,
      'altura': instance.altura,
      'largura': instance.largura,
      'volume': instance.volume,
      'diametro': instance.diametro,
      'comprimentoCarga': instance.comprimentoCarga,
      'equipamento': instance.equipamento,
      'placa': instance.placa,
      'operador': instance.operador,
      'motorista': instance.motorista,
      'data': instance.data.toIso8601String(),
    };

const _$EspecieEnumMap = {
  Especie.pinus: 'pinus',
  Especie.eucalipto: 'eucalipto',
  Especie.selecionar: 'selecionar',
};

const _$DestinoEnumMap = {
  Destino.vendas: 'vendas',
  Destino.serraria: 'serraria',
  Destino.picador: 'picador',
  Destino.selecionar: 'selecionar',
};
