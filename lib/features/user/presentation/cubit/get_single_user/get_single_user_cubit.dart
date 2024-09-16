import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  GetSingleUserCubit() : super(GetSingleUserInitial());
}
