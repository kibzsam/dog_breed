import 'package:dog_breeds/lib/lib/blocs/dog_breeds_cubit.dart';
import 'package:dog_breeds/lib/lib/config/Palette.dart';
import 'package:dog_breeds/lib/lib/repositories/DogBreedsRepository.dart';
import 'package:dog_breeds/lib/lib/widgets/Breed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    DogBreedsDataRepository repository = DogBreedsDataRepository();
    return BlocProvider(
      create: (context) => DogBreedsCubit(repository),
      child: Scaffold(
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
            if (state is DogBreedsLoaded) {
              state.breeds!.isEmpty
                  ? const Center(
                      child: Text(
                        'No Results Found',
                        style: TextStyle(
                          color: Palette.primaryColor,
                          fontFamily: 'Poppins-Bold',
                          fontSize: 24,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: height,
                      width: width,
                      child: ListView.builder(
                          itemCount: state.breeds!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final breed = state.breeds![index];
                            return Breed(
                              name: breed.name!,
                              image: breed.images![0] ?? '',
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
              return const Center(
                child: Text(
                  'No Results Found',
                  style: TextStyle(
                    color: Palette.primaryColor,
                    fontFamily: 'Poppins-Bold',
                    fontSize: 24,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
