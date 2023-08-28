import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medium_project/utils/icons.dart';
import '../../../cubits/cubits/auth/auth_cubit.dart';
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

  var maskFormatter = MaskTextInputFormatter(
      mask: "+998 (##) ###-##-##",
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);

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
              // GlobalTextField(
              //   hintText: "Contact",
              //   keyboardType: TextInputType.phone,
              //   textInputAction: TextInputAction.next,
              //   textAlign: TextAlign.start,
              //   controller: phoneController,
              //   prefixIcon: const Icon(Icons.phone),
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 6.r,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: TextField(
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                      fontFamily: "Poppins"),
                  textAlign: TextAlign.start,
                  inputFormatters: [maskFormatter],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    filled: true,
                    fillColor: AppColors.white,
                    hintText: "Contact",
                    hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        fontFamily: "Poppins"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide:
                          BorderSide(width: 1.w, color: AppColors.white),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppColors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppColors.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppColors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
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
                prefixIcon: const Icon(Icons.school),
              ),
              SizedBox(height: 10.h),
              GlobalTextField(
                hintText: "Password",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                controller: passwordController,
                prefixIcon: const Icon(Icons.key_outlined),
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
              TextButton(
                onPressed: () {
                  showBottomSheetDialog();
                },
                child: Row(
                  children: [
                    Text(
                      "Select image",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          fontSize: 18.sp,
                          color: AppColors.C_252525),
                    ),
                    SizedBox(width: 2.w),
                    Icon(Icons.photo, size: 30.sp, color: AppColors.C_6C63FF),
                  ],
                ),
              ),
            ],
          );
        },
        buildWhen: (previous, current){
          return previous!=current;
        },
        listener: (context, state) {
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
            Navigator.pushNamed(context, RouteNames.confirmGmail,
                arguments: userModel);
          }

          if (state is AuthErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
        },
      ),
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
