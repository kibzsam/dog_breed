import 'package:dog_breeds/lib/lib/config/Palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Breed extends StatelessWidget {
  const Breed({this.name, this.image, this.thumbnail});
  final String? name, image;
  final List? thumbnail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Palette.primaryColor,
          radius: 30,
          backgroundImage: NetworkImage(image!),
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
