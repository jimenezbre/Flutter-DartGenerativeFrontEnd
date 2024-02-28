// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carro_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarroForm _$CarroFormFromJson(Map<String, dynamic> json) => CarroForm()
  ..quilometragemSaida = (json['quilometragemSaida'] as num?)?.toDouble()
  ..quilometragemChegada = (json['quilometragemChegada'] as num?)?.toDouble()
  ..horaDeSaida = json['horaDeSaida'] as String?
  ..horaDeVolta = json['horaDeVolta'] as String?;

Map<String, dynamic> _$CarroFormToJson(CarroForm instance) => <String, dynamic>{
      'quilometragemSaida': instance.quilometragemSaida,
      'quilometragemChegada': instance.quilometragemChegada,
      'horaDeSaida': instance.horaDeSaida,
      'horaDeVolta': instance.horaDeVolta,
    };
