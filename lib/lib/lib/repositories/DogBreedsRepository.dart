import 'package:dog_breeds/lib/lib/config/ServiceLocator.dart';
import 'package:dog_breeds/lib/lib/models/Breed.dart';
import 'package:dog_breeds/lib/lib/network/ApiResult.dart';
import 'package:dog_breeds/lib/lib/network/NetworkClient.dart';

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
