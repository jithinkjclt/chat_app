import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'log_state.dart';

class LogCubit extends Cubit<LogState> {
  LogCubit() : super(LogInitial());

  bool flag = true;
  bool change=true;
  chanager() {
  change=!change;
    print(">>>>>>>>>>>>>>>>>>>>$change");
    emit(LogInitial());
  }

  regi() {
    flag = true;
    emit(LogInitial());
  }

  log() {
    flag = false;
    emit(LogInitial());
  }
}
