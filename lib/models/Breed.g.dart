// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogBreed _$DogBreedFromJson(Map<String, dynamic> json) => DogBreed(
      json['name'] as String?,
      json['subBreeds'] as List<dynamic>?,
      json['images'] as List<dynamic>?,
    );

Map<String, dynamic> _$DogBreedToJson(DogBreed instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('subBreeds', instance.subBreeds);
  val['images'] = instance.images;
  return val;
}
