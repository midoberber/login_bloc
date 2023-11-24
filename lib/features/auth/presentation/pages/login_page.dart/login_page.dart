import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_with_bloc/core/app/app_data.dart';
import 'package:login_with_bloc/core/constant/colors.dart';
import 'package:login_with_bloc/core/constant/styles/styles.dart';
import 'package:login_with_bloc/core/cubit_main/bloc_main_cubit.dart';
import 'package:login_with_bloc/core/utils/sizedbox_extension.dart';
import 'package:login_with_bloc/core/utils/validator.dart';
import 'package:login_with_bloc/core/widgets/generic_button.dart';
import 'package:login_with_bloc/core/widgets/generic_field.dart';
import 'package:login_with_bloc/core/widgets/password_field.dart';
import 'package:login_with_bloc/core/widgets/toast.dart';
import 'package:login_with_bloc/features/auth/presentation/bloc/login_bloc.dart';

// when use stateless with form and validator keyboard dissmissable when type in textfield after Flutter 3.0.0
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            automaticallyImplyLeading: false,
          ),
          body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: TextStyles.textViewSemiBold16
                              .copyWith(color: textColor),
                        ),
                        35.sizHeight,
                        GenericField(
                          labeltext: "Name",
                          hintText: "Name",
                          validation: (value) => Validator.name(value),
                          fillColor: transparentColor,
                          controller: name,
                        ),
                        15.sizHeight,
                        PasswordField(
                          labeltext: "Password",
                          hintText: "Password",
                          validation: (value) => Validator.password(value),
                          fillColor: transparentColor,
                          controller: password,
                        ),
                        15.sizHeight,
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forget Password",
                            style: TextStyles.textViewMedium15Underline
                                .copyWith(color: focus),
                          ),
                        ),
                        20.sizHeight,
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccessState) {
                              context.read<BlocMainCubit>().updateData(AppData(
                                    displayName: state.userName,
                                    id: "1",
                                    email: "nageepahmed113@gmail.com",
                                    phone: "01091656114",
                                    isCompleted: true,
                                    isGuestUser: false,
                                    isVerfied: true,
                                    isSelectLang: true,
                                  ));
                            }
                            if (state is LoginFailureState) {
                              customToast(
                                isError: true,
                                content: state.errorMesssage,
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is LoginLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            } else {
                              return GenericButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context
                                        .read<LoginBloc>()
                                        .add(Login(name.text, password.text));
                                  }
                                },
                                color: primary,
                                width: MediaQuery.of(context).size.width,
                                borderRadius: BorderRadius.circular(15.r),
                                child: Text(
                                  "Login",
                                  style: TextStyles.textViewMedium15
                                      .copyWith(color: white),
                                ),
                              );
                            }
                          },
                        )
                      ],
                    )),
              )),
        ),
      ),
    );
  }
}
