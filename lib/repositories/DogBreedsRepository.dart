import 'package:dog_breeds/config/ServiceLocator.dart';
import 'package:dog_breeds/models/Breed.dart';
import 'package:dog_breeds/network/ApiResult.dart';
import 'package:dog_breeds/network/NetworkClient.dart';

class DogBreedsDataRepository {
  Future<ApiResult<List<DogBreed>>> getDogBreeds() async {
    try {
      List<DogBreed> list = [];
      List<DogBreed> listWithImages = [];
      final results = await locator!<NetworkClient>().dogDetails.get('/breeds/list/all');
      results['message'].forEach((k, v) {
        list.add(DogBreed(k, v, const []));
      });
      for (var element in list) {
        final images = await getImagesUrls(element.name!);
        listWithImages.add(DogBreed(element.name, element.subBreeds, images));
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
