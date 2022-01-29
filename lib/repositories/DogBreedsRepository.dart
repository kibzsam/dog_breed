import 'package:dog_breeds/config/ServiceLocator.dart';
import 'package:dog_breeds/models/Breed.dart';
import 'package:dog_breeds/network/ApiResult.dart';
import 'package:dog_breeds/network/NetworkClient.dart';

class DogBreedsDataRepository {
  Future<ApiResult<List<DogBreed>>> getDogBreeds() async {
    try {
      List<DogBreed> listWithImages = [];
      final results = await locator!<NetworkClient>().dogDetails.get('/breeds/list/all');
      for (final entry in results['message'].entries) {
        await getImagesUrls(entry.key.toString()).then((value) {
          listWithImages.add(DogBreed(entry.key.toString(), entry.value, value));
        }).catchError((error) => print(error));
      }
      return ApiResult.success(data: listWithImages);
    } catch (e) {
      rethrow;
    }
  }

  Future<List> getImagesUrls(String breed) async {
    try {
      final results = await locator!<NetworkClient>().dogDetails.get('/breed/$breed/images');
      return results['message'];
    } catch (e) {
      rethrow;
    }
  }
}
