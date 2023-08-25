import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medium_project/utils/colors.dart';
import 'package:medium_project/utils/icons.dart';
import '../../../cubits/cubits/auth/auth_cubit.dart';
import '../../../data/local/storage_repository/storage_repository.dart';
import '../../../utils/ui_utils/error_message_dialog.dart';
import '../../app_routes.dart';
import '../widgets/global_button.dart';
import '../widgets/global_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController gmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              SizedBox(height: 20.h),
              Column(
                children: [
                  Text(
                    "Welcome Medium",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF252525),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Sign in to access your account",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF252525),
                    ),
                  ),
                ],
              ),
              Lottie.asset(AppImages.login),
              GlobalTextField(
                hintText: "Enter email",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                controller: gmailController,
                prefixIcon: const Icon(Icons.email),
              ),
              SizedBox(height: 10.h),
              GlobalTextField(
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                controller: passwordController,
                prefixIcon: const Icon(Icons.key_outlined),
              ),
              SizedBox(height: 60.h),
              GlobalButton(
                title: ("Login"),
                onTap: () {
                  context.read<AuthCubit>().loginUser(
                        gmail: gmailController.text,
                        password: passwordController.text,
                      );
                },
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New Member?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontSize: 18.sp,
                      color: const Color(0xFF252525),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouteNames.registerScreen);
                    },
                    child: Text(
                      "Register Now:${StorageRepository.getString("token")}",
                      style: TextStyle(
                          color: AppColors.C_6C63FF,
                          fontSize: 18.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        // buildWhen: (previous, current){
        //   return previous!=current;
        // },
        listener: (context, state) {
          if (state is AuthLoggedState) {
            Navigator.pushReplacementNamed(context, RouteNames.tabBox);
          }

          if (state is AuthErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
        },
      ),
    );
  }
}
