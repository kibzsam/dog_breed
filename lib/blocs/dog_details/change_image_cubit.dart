import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_image_state.dart';

class ChangeImageCubit extends Cubit<ChangeImageState> {
  ChangeImageCubit() : super(ChangeImageInitial());

  void setImage(String? image) {
    emit(SetNewImage(newImage: image));
  }
}
