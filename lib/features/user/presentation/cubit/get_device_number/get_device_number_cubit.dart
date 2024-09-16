import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_device_number_state.dart';

class GetDeviceNumberCubit extends Cubit<GetDeviceNumberState> {
  GetDeviceNumberCubit() : super(GetDeviceNumberInitial());
}
