import 'package:dog_breeds/blocs/dog_breeds_cubit.dart';
import 'package:dog_breeds/blocs/dog_details/change_image_cubit.dart';
import 'package:dog_breeds/config/AppRoute.dart';
import 'package:dog_breeds/config/Palette.dart';
import 'package:dog_breeds/config/ServiceLocator.dart';
import 'package:dog_breeds/repositories/DogBreedsRepository.dart';
import 'package:dog_breeds/widgets/Breed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ViewDogDetails.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  DogBreedsDataRepository repository = DogBreedsDataRepository();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => DogBreedsCubit(repository),
      child: Scaffold(
        backgroundColor: Palette.secondaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Dog Breeds',
            style: TextStyle(
              color: Palette.secondaryColor,
              fontFamily: 'Poppins-Bold',
              fontSize: 16,
            ),
          ),
        ),
        body: BlocBuilder<DogBreedsCubit, DogBreedsState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is DogBreedsLoaded && state.breeds!.isNotEmpty) {
              return SizedBox(
                height: height,
                width: width,
                child: ListView.builder(
                    itemCount: state.breeds!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final breed = state.breeds![index];
                      return GestureDetector(
                        onTap: () => locator!<AppRoute>().navigateTo(
                          BlocProvider(
                            create: (context) => ChangeImageCubit(),
                            child: ViewDogDetailsPage(
                              breed: breed,
                              name: breed.name!,
                              images: breed.images!,
                              subBreeds: breed.subBreeds,
                            ),
                          ),
                        ),
                        child: Breed(
                          breed: breed,
                          name: breed.name!,
                          image: breed.images![0] ?? '',
                        ),
                      );
                    }),
              );
            }
            if (state is DogBreedsLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Palette.primaryColor, strokeWidth: 8),
              );
            }
            if (state is DogBreedsError) {
              return Center(
                child: Text(
                  state.errors!.toString(),
                  style: const TextStyle(
                    color: Palette.primaryColor,
                    fontFamily: 'Poppins-Bold',
                    fontSize: 24,
                  ),
                ),
              );
            } else {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'No Results Found',
                      style: TextStyle(
                        color: Palette.primaryColor,
                        fontFamily: 'Poppins-Bold',
                        fontSize: 24,
                      ),
                    ),
                    const Text(
                      'Check Internet connection and ensure you are connected',
                      style: TextStyle(
                        color: Palette.accentColor,
                        fontFamily: 'Poppins-SemiBold',
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () => context.read<DogBreedsCubit>().getDogBreeds(),
                      icon: const Icon(Icons.refresh, color: Palette.primaryColor),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
