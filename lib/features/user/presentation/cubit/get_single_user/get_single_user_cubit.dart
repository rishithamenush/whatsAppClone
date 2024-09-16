import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';

import '../../../domain/usecases/user/get_single_user_usecase.dart';

part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  final GetSingleUserUseCase getSingleUserUsecase;
  GetSingleUserCubit({
    required this.getSingleUserUsecase
}): super(GetSingleUserInitial());

  Future<void> getSingleUser({required String uid}) async{
    emit(GetSingleUserLoading());
    final StreamedResponse = getSingleUserUsecase.call(uid);
     StreamedResponse.listen((users){
      emit(GetSingleUserLoaded(singleUser: users.first));
    });
  }
}
