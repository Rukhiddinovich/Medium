import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medium_project/cubits/auth/tab_box/tab_box_cubit.dart';
import 'package:medium_project/data/models/article/article_model.dart';
import 'package:medium_project/utils/colors.dart';
import 'package:medium_project/utils/icons.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../cubits/auth/auth/auth_cubit.dart';
import '../../../utils/constants.dart';
import '../../../utils/ui_utils/error_message_dialog.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  List<ArticleModel> articles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.C_6C63FF),
        backgroundColor: AppColors.C_6C63FF,
        title: Text(
          "Articles screen",
          style: TextStyle(
              fontSize: 24.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle, color: AppColors.white),
          )
        ],
      ),
      body: BlocConsumer<TabBoxCubit, TabBoxState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return Center(child: Lottie.asset(AppImages.loading));
          }
          return Container(
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
              child: ListView(
                children: [
                  ...List.generate(articles.length, (index) {
                    ArticleModel articleModel = articles[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 18.h),
                      child: ZoomTapAnimation(
                        child: Container(
                          width: 344.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: AppColors.C_6C63FF,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.black.withOpacity(0.6),
                                  blurRadius: 2)
                            ],
                          ),
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "$baseUrlForImage${articleModel.avatar}",
                                width: 60.w,
                                height: 60.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
          );
        },
        listener: (context, state) {
          if (state is TabBoxErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
          if (state is TabBoxSuccessState) {
            setState(
              () {
                articles = state.articles;
              },
            );
          }
        },
      ),
    );
  }
}
