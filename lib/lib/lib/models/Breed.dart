import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Breed.g.dart';

@JsonSerializable()
class DogBreed extends Equatable {
  @JsonKey(includeIfNull: false)
  final String? name;
  @JsonKey(includeIfNull: false)
  final List? subBreeds;
  final List? images;
  const DogBreed(this.name, this.subBreeds, this.images);
  factory DogBreed.fromJson(Map<String, dynamic> json) => _$DogBreedFromJson(json);

  Map<String, dynamic> toJson() => _$DogBreedToJson(this);

  @override
  List<Object?> get props => [name, subBreeds, images];
}
