part of 'dog_breeds_cubit.dart';

abstract class DogBreedsState extends Equatable {
  const DogBreedsState();
}

class DogBreedsInitial extends DogBreedsState {
  @override
  List<Object> get props => [];
}

class DogBreedsLoaded extends DogBreedsState {
  const DogBreedsLoaded({this.breeds});
  final List<DogBreed>? breeds;
  @override
  List<Object> get props => [breeds!];
}

class DogBreedsLoading extends DogBreedsState {
  @override
  List<Object> get props => [];
}

class DogBreedsError extends DogBreedsState {
  const DogBreedsError({this.errors});
  final errors;
  @override
  List<Object> get props => [errors];
}
