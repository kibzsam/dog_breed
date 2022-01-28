part of 'change_image_cubit.dart';

@immutable
abstract class ChangeImageState {}

class ChangeImageInitial extends ChangeImageState {}

class SetNewImage extends ChangeImageState {
  SetNewImage({this.newImage});
  final String? newImage;
  @override
  List<Object> get props => [newImage!];
}
