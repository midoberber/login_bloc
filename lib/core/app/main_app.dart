import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_with_bloc/core/app/app_data.dart';
import 'package:login_with_bloc/core/constant/colors.dart';
import 'package:login_with_bloc/core/cubit_main/bloc_main_cubit.dart';
import 'package:login_with_bloc/core/utils/navigator.dart';
import 'package:login_with_bloc/features/auth/presentation/pages/defult_page.dart';
import 'package:login_with_bloc/features/auth/presentation/pages/intro_page/intro_page.dart';
import 'package:login_with_bloc/features/auth/presentation/pages/login_page.dart/login_page.dart';
import 'package:login_with_bloc/features/home/presentation/pages/home_page.dart';
import 'package:login_with_bloc/injection_container.dart';

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(368, 811));
    return MultiBlocProvider(
        providers: [
          BlocProvider<BlocMainCubit>(
              create: (BuildContext context) => sl<BlocMainCubit>()),
        ],
        child: BlocConsumer<BlocMainCubit, BlocMainState>(
            listener: (context, state) {
          if (state is UpdateDataState) {
            // log(state.appData.toString());
          } else {
            // log(state.props.toString());
          }
        }, builder: (context, state) {
          var bloc = context.read<BlocMainCubit>();

          // log(type.toString());
          Widget currentPage;
          switch (bloc.appState) {
            // case AppState.loggedOut:
            //   currentPage = SelectLoginOrSignupScreen();
            //   break;
            case AppState.notSeenTutorial:
              currentPage = IntroPage();
              break;
            case AppState.guest:
              currentPage = const HomePage(); // if Contain Guest

              break;

            case AppState.authenticated:
              currentPage = const HomePage();

              break;
            case AppState.unauthenticated:
              currentPage = const LoginPage();
              break;
            case AppState.notCompleted:
              currentPage = const DefultPage(); // if Contain complete page
              break;
            case AppState.notVerified:
              currentPage = const DefultPage(); // if Contain PinCode page
              break;
            default:
              currentPage = Scaffold(
                appBar: AppBar(
                  title: const Text("Loading"),
                ),
              );
          }

          return ScreenUtilInit(
            designSize: const Size(368, 811),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) => MaterialApp(
              //  key: UniqueKey(),
              theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  ),
                  fontFamily: "Montserrat",
                  hintColor: black,
                  primaryColor: primary,
                  scrollbarTheme: const ScrollbarThemeData().copyWith(
                    thumbColor:
                        MaterialStateProperty.all(const Color(0xffff8297)),
                  ),
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: primary)
                      .copyWith(background: Colors.white)),
              debugShowCheckedModeBanner: false,

              navigatorKey: AppNavigator.navigatorKey,
              routes: const {},
              home: Builder(
                builder: (context) {
                  ScreenUtil.init(context, designSize: const Size(368, 811));
                  return currentPage;
                },
              ),
            ),
          );
        }));
  }
}
