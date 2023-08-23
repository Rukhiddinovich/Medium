// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';
// import '../../../utils/icons.dart';
// import '../../app_routes.dart';
// import '../widgets/global_text_field.dart';
//
// class LoginPage extends StatelessWidget {
//   LoginPage({super.key, required this.onChanged});
//
//   final VoidCallback onChanged;
//
//   TextEditingController gmailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 0,
//         systemOverlayStyle:
//             const SystemUiOverlayStyle(statusBarColor: Colors.white),
//       ),
//       backgroundColor: Colors.white,
//       body: ListView(
//         children: [
//           SizedBox(height: 20.h),
//           Lottie.asset(AppImages.login),
//           // TextButton(
//           //   onPressed: () {
//           //     onChanged.call();
//           //   },
//           //   child: Text(
//           //     "Sign Up",
//           //     style: TextStyle(
//           //         color: Color(0xFF4F8962),
//           //         fontSize: 18.sp,
//           //         fontWeight: FontWeight.w800),
//           //   ),
//           // ),
//           GlobalTextField(
//               hintText: "Enter email or phone",
//               keyboardType: TextInputType.emailAddress,
//               textInputAction: TextInputAction.next,
//               textAlign: TextAlign.start,
//               controller: gmailController),
//           // TextButton(
//           //   onPressed: () {
//           //     Navigator.pushNamed(context, RouteNames.confirmGmail);
//           //   },
//           //   child: Text(
//           //     "First Confirm your",
//           //     style: TextStyle(
//           //         color: Color(0xFF4F8962),
//           //         fontSize: 18.sp,
//           //         fontWeight: FontWeight.w800),
//           //   ),
//           // ),
//           SizedBox(height: 30.h),
//           GlobalTextField(
//               hintText: "Password",
//               keyboardType: TextInputType.visiblePassword,
//               textInputAction: TextInputAction.next,
//               textAlign: TextAlign.start,
//               controller: passwordController),
//           SizedBox(height: 20.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 120.w,
//                 height: 1.h,
//                 decoration: BoxDecoration(color: Colors.grey),
//               ),
//               SizedBox(width: 10.w),
//               Text(
//                 "OR",
//                 style: TextStyle(
//                     fontSize: 20.sp,
//                     fontFamily: "Poppins",
//                     fontWeight: FontWeight.w500,
//                     color: Colors.grey),
//               ),
//               SizedBox(width: 10.w),
//               Container(
//                 width: 120.w,
//                 height: 1.h,
//                 decoration: BoxDecoration(color: Colors.grey),
//               ),
//             ],
//           ),
//           SizedBox(height: 50.h),
//           ZoomTapAnimation(
//             onTap: () {
//               Navigator.pushNamed(context, RouteNames.confirmGmail);
//             },
//             child: Container(
//               width: 200.w,
//               height: 50.h,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16.r),
//                   color: Colors.blue),
//               child: Center(
//                 child: Text(
//                   "Next",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontFamily: "Poppins",
//                       fontSize: 20.sp,
//                       color: Colors.white),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medium_project/utils/colors.dart';
import 'package:medium_project/utils/icons.dart';
import '../../../cubits/auth/auth/auth_cubit.dart';
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
                prefixIcon: const Icon(Icons.password),
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
