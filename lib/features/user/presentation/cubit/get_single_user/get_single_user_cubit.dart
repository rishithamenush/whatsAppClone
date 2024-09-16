import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';

part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  GetSingleUserCubit() : super(GetSingleUserInitial());
}
