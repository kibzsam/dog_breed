import 'package:dog_breeds/config/Palette.dart';
import 'package:dog_breeds/models/Breed.dart';
import 'package:flutter/material.dart';

class Breed extends StatelessWidget {
  const Breed({Key? key, this.name, this.image, this.thumbnail, required this.breed}) : super(key: key);
  final String? name, image;
  final List? thumbnail;
  final DogBreed breed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Hero(
          tag: breed,
          child: CircleAvatar(
            backgroundColor: Palette.primaryColor,
            radius: 30,
            backgroundImage: NetworkImage(image!),
          ),
        ),
        title: Text(
          name!,
          style: const TextStyle(
            fontFamily: 'Poppins-SemiBold',
            fontSize: 16,
            color: Palette.secondaryTextColor,
          ),
        ),
        trailing: const Icon(Icons.more_vert_rounded),
      ),
    );
  }
}
