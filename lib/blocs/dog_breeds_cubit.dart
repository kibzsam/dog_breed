import 'package:bloc/bloc.dart';
import 'package:dog_breeds/models/Breed.dart';
import 'package:dog_breeds/network/ApiResult.dart';
import 'package:dog_breeds/network/NetworkExceptions.dart';
import 'package:dog_breeds/repositories/DogBreedsRepository.dart';
import 'package:equatable/equatable.dart';

part 'dog_breeds_state.dart';

class DogBreedsCubit extends Cubit<DogBreedsState> {
  DogBreedsCubit(this.repository) : super(DogBreedsInitial()) {
    getDogBreeds();
  }

  DogBreedsDataRepository repository;
  late NetworkExceptions? failureReason;
  String? errorMessage;

  Future<void> getDogBreeds() async {
    emit(DogBreedsLoading());
    ApiResult<List<DogBreed>> result = await repository.getDogBreeds();
    result.when(success: (breedResult) async {
      emit(DogBreedsLoaded(breeds: breedResult));
    }, failure: (NetworkExceptions? error) {
      failureReason = error!;
      error.maybeWhen(
        unProcessableEntity: (Map<String, dynamic> errors) {
          emit(DogBreedsError(errors: errors));
        },
        unauthenticatedRequest: () {
          DogBreedsError(errors: error);
        },
        orElse: () {
          errorMessage = 'Error occurred while submitting your request. Please try again.';
          DogBreedsError(errors: error);
        },
      );
    });
  }
}
