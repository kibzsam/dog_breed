import 'package:dog_breeds/lib/lib/blocs/dog_details/change_image_cubit.dart';
import 'package:dog_breeds/lib/lib/config/Palette.dart';
import 'package:dog_breeds/lib/lib/models/Breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

class ViewDogDetailsPage extends StatelessWidget {
  const ViewDogDetailsPage({Key? key, this.subBreeds, this.name, this.images, required this.breed}) : super(key: key);
  final String? name;
  final List? subBreeds, images;
  final DogBreed breed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.secondaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'View Details',
          style: TextStyle(
            color: Palette.secondaryColor,
            fontFamily: 'Poppins-Bold',
            fontSize: 16,
          ),
        ),
      ),
      body: SizedBox(
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: breed,
                child: BlocBuilder<ChangeImageCubit, ChangeImageState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    if (state is SetNewImage) {
                      return Container(
                        height: height * 0.3,
                        margin: const EdgeInsets.only(top: 24, right: 16, left: 16),
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            image: NetworkImage(state.newImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: height * 0.3,
                        margin: const EdgeInsets.only(top: 24, right: 16, left: 16),
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            image: NetworkImage(images![0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16),
                width: width,
                height: height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<ChangeImageCubit>().setImage(images![index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 24, right: 16),
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            image: NetworkImage(images![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: height * 0.2,
                margin: const EdgeInsets.only(top: 24, right: 16, left: 16),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Palette.tertiaryColor,
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Expanded(
                            child: Text(
                              'Breed',
                              style: TextStyle(
                                fontFamily: 'Poppins-SemiBold',
                                fontSize: 18,
                                color: Palette.accentColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text('$name',
                                style: const TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  fontSize: 18,
                                  color: Palette.accentColor,
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Expanded(
                            child: Text(
                              'Sub Breeds',
                              style: TextStyle(
                                fontFamily: 'Poppins-SemiBold',
                                fontSize: 18,
                                color: Palette.accentColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text('$subBreeds'.replaceAll(RegExp(r'[^\w\s]+'), ''),
                                style: const TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  fontSize: 18,
                                  color: Palette.accentColor,
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
