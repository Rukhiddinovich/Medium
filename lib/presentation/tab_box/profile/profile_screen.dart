import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medium_project/cubits/cubits/profile/profile_cubit.dart';
import 'package:medium_project/presentation/app_routes.dart';
import 'package:medium_project/presentation/auth/widgets/global_text_field.dart';
import 'package:medium_project/utils/colors/colors.dart';
import '../../../cubits/cubits/auth/auth_cubit.dart';
import '../../../data/models/article/article_model.dart';
import '../../../utils/ui_utils/error_message_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<ArticleModel> articles = [];

  TextEditingController usernameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.C_6C63FF),
        backgroundColor: AppColors.C_6C63FF,
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 24.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).logOut();
              Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
            },
            icon: const Icon(Icons.logout_outlined, color: AppColors.white),
          ),
        ],
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const CupertinoActivityIndicator(color: Colors.black);
          }
          if (state is ProfileSuccessState) {
            return Column(
              children: [
                GlobalTextField(
                    hintText: "Username",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.start,
                    controller: usernameController,
                    prefixIcon: Icon(CupertinoIcons.person_alt_circle,size: 30.r,)),
              ],
            );
          }
          return Center(
            child: Text(
              "ERROR",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  color: Colors.black),
            ),
          );
        },
        listener: (context, state) {
          if (state is ProfileErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
        },
      ),
    );
  }
}
