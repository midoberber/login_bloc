import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_with_bloc/core/constant/colors.dart';
import 'package:login_with_bloc/core/constant/styles/styles.dart';
import 'package:login_with_bloc/core/cubit_main/bloc_main_cubit.dart';
import 'package:login_with_bloc/core/widgets/generic_button.dart';

class IntroPage extends StatelessWidget {
  static const String path = "lib/src/pages/onboarding/landing1.dart";
  String ledge =
      'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2Fledge.jpg?alt=media';
  IntroPage({super.key});
  String photographer =
      'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2Fphotographer.jpg?alt=media';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: Image.network(
                photographer,
                fit: BoxFit.contain,
              )),
          Column(
            children: <Widget>[
              const SizedBox(height: 30.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(5.0, 5.0),
                            blurRadius: 5.0)
                      ]),
                  margin: const EdgeInsets.all(48.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(ledge),
                                  fit: BoxFit.cover),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              )),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text("How will you do?",
                          style:
                              TextStyles.textViewBold20.copyWith(color: black)),
                      const SizedBox(height: 10.0),
                      Text(
                          "Lorem ipsuim is simply dummy text of the \nprinting and typesetting industry.\nLorem ipsum has been the",
                          textAlign: TextAlign.center,
                          style: TextStyles.textViewMedium14
                              .copyWith(color: gray)),
                      const SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ),
              GenericButton(
                width: MediaQuery.of(context).size.width * 0.5,
                onPressed: () {
                  context.read<BlocMainCubit>().seenIntro();
                },
                color: primary,
                borderRadius: BorderRadius.circular(10),
                child: Text(
                  "Get Started",
                  style: TextStyles.textViewMedium18.copyWith(color: white),
                ),
              ),
              const SizedBox(height: 40.0),
            ],
          )
        ],
      ),
    );
  }
}
