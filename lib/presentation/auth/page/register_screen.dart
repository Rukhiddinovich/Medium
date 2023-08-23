// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';
// import '../../app_routes.dart';
// import '../widgets/global_text_field.dart';
//
// class SignUpScreen extends StatelessWidget {
//   SignUpScreen({super.key, required this.onChanged});
//
//   final VoidCallback onChanged;
//   TextEditingController gmailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         SizedBox(height: MediaQuery.of(context).size.height / 12),
//         // TextButton(
//         //   onPressed: () {
//         //     onChanged.call();
//         //   },
//         //   child: Text(
//         //     "Welcome back",
//         //     style: TextStyle(
//         //         fontFamily: "Poppins",
//         //         color: Colors.black,
//         //         fontSize: 18.sp,
//         //         fontWeight: FontWeight.w800),
//         //   ),
//         // ),
//         Text(
//           "Welcome back",
//           style: TextStyle(
//               fontFamily: "Poppins",
//               color: Colors.black,
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w800),
//         ),
//         SizedBox(height: 10.h),
//         Text(
//           "Login to your account",
//           style: TextStyle(
//               fontFamily: "Poppins",
//               color: Colors.black,
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w800),
//         ),
//         GlobalTextField(
//             hintText: "Enter email or phone",
//             keyboardType: TextInputType.emailAddress,
//             textInputAction: TextInputAction.next,
//             textAlign: TextAlign.start,
//             controller: gmailController),
//         // TextButton(
//         //   onPressed: () {
//         //     Navigator.pushNamed(context, RouteNames.confirmGmail);
//         //   },
//         //   child: Text(
//         //     "First Confirm your",
//         //     style: TextStyle(
//         //         color: Color(0xFF4F8962),
//         //         fontSize: 18.sp,
//         //         fontWeight: FontWeight.w800),
//         //   ),
//         // ),
//         SizedBox(height: 30.h),
//         GlobalTextField(
//             hintText: "Password",
//             keyboardType: TextInputType.visiblePassword,
//             textInputAction: TextInputAction.next,
//             textAlign: TextAlign.start,
//             controller: passwordController),
//         SizedBox(height: 50.h),
//         ZoomTapAnimation(
//           onTap: () {
//             Navigator.pushNamed(context, RouteNames.confirmGmail);
//           },
//           child: Container(
//             width: 200.w,
//             height: 50.h,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16.r), color: Colors.blue),
//             child: Center(
//               child: Text(
//                 "Next",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontFamily: "Poppins",
//                     fontSize: 20.sp,
//                     color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:medium_project/utils/icons.dart';
import '../../../cubits/auth/auth/auth_cubit.dart';
import '../../../data/models/user/user_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/ui_utils/error_message_dialog.dart';
import '../../app_routes.dart';
import '../widgets/gender_selector.dart';
import '../widgets/global_button.dart';
import '../widgets/global_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController gmailController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ImagePicker picker = ImagePicker();

  XFile? file;

  int gender = 1;

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
      body: BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
        if (state is AuthLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: [
            SizedBox(height: 20.h),
            Column(
              children: [
                Text(
                  "Get Started",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF252525),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "By creating a free account.",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF252525),
                  ),
                ),
              ],
            ),
            Lottie.asset(AppImages.login, height: 310.h),
            GlobalTextField(
              hintText: "Username",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.start,
              controller: usernameController,
              prefixIcon: const Icon(CupertinoIcons.person_alt_circle),
            ),
            SizedBox(height: 10.h),
            GlobalTextField(
              hintText: "Contact",
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.start,
              controller: phoneController,
              prefixIcon: const Icon(Icons.phone),
            ),
            SizedBox(height: 10.h),
            GlobalTextField(
              hintText: "Gmail",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.start,
              controller: gmailController,
              prefixIcon: const Icon(Icons.email),
            ),
            SizedBox(height: 10.h),
            GlobalTextField(
              hintText: "Profession",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.start,
              controller: professionController,
              prefixIcon: const Icon(CupertinoIcons.info_circle_fill),
            ),
            SizedBox(height: 10.h),
            GlobalTextField(
              hintText: "Password",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.start,
              controller: passwordController,
              prefixIcon: const Icon(Icons.password),
            ),
            SizedBox(height: 20.h),
            GenderSelector(
              onMaleTap: () {
                setState(() {
                  gender = 1;
                });
              },
              onFemaleTap: () {
                setState(() {
                  gender = 0;
                });
              },
              gender: gender,
            ),
            SizedBox(height: 20.h),
            GlobalButton(
              title: "Register",
              onTap: () {
                if (file != null &&
                    usernameController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty &&
                    gmailController.text.isNotEmpty &&
                    professionController.text.isNotEmpty &&
                    passwordController.text.length > 5) {
                  context.read<AuthCubit>().sendCodeToGmail(
                        gmailController.text,
                        passwordController.text,
                      );
                }
              },
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member?",
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
                        context, RouteNames.loginScreen);
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: AppColors.C_6C63FF,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    showBottomSheetDialog();
                  },
                  child: Text(
                    "Select image",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 18.sp,
                        color: AppColors.C_252525),
                  ),
                ),
                Icon(Icons.photo, size: 30.sp, color: AppColors.C_6C63FF)
              ],
            ),
          ],
        );
      }, listener: (context, state) {
        if (state is AuthSendCodeSuccessState) {
          UserModel userModel = UserModel(
            password: passwordController.text,
            username: usernameController.text,
            email: gmailController.text,
            avatar: file!.path,
            contact: phoneController.text,
            gender: gender.toString(),
            profession: professionController.text,
            role: "male",
          );
          Navigator.pushNamed(
            context,
            RouteNames.confirmGmail,
            arguments: userModel,
          );
        }

        if (state is AuthErrorState) {
          showErrorMessage(message: state.errorText, context: context);
        }
      }),
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(24.r),
          height: 200.h,
          decoration: BoxDecoration(
            color: AppColors.C_6C63FF,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                title: Text(
                  "Select from Camera",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontSize: 18.sp,
                      color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.photo,
                  color: Colors.white,
                ),
                title: Text(
                  "Select from Gallery",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontSize: 18.sp,
                      color: Colors.white),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (xFile != null) {
      file = xFile;
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      file = xFile;
    }
  }
}
