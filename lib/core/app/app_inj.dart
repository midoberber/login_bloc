import 'package:get_it/get_it.dart';
import 'package:login_with_bloc/core/cubit_main/bloc_main_cubit.dart';

Future<void> initAppMainjection(GetIt sl) async {
  //* cubit

  sl.registerFactory<BlocMainCubit>(() => BlocMainCubit(repository: sl()));
}
