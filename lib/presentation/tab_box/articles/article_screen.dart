import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medium_project/data/models/article/article_model.dart';
import 'package:medium_project/utils/colors.dart';
import 'package:medium_project/utils/icons.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../cubits/cubits/auth/auth_cubit.dart';
import '../../../cubits/cubits/website/website_cubit.dart';
import '../../../data/models/status/form_status.dart';
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
            icon:
                Icon(Icons.search_outlined, color: AppColors.white, size: 25.r),
          )
        ],
      ),
      body: BlocConsumer<WebsiteCubit, WebsiteState>(
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
                ...List.generate(
                  articles.length,
                  (index) {
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
                                  color: Colors.grey.withOpacity(0.6),
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
                              SizedBox(width: 15.w),
                              SizedBox(
                                width: 250.w,
                                child: Text(articleModel.title,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.C_252525,
                                        fontSize: 20.sp,
                                        fontFamily: "Poppins")),
                              ),
                              Text(
                                articleModel.username,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.C_252525,
                                    fontSize: 15.sp,
                                    fontFamily: "Poppins"),
                              ),
                              SizedBox(height: 30.h),
                              Text(
                                articleModel.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: AppColors.passiveTextColor,
                                        fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state.status == FormStatus.failure) {
            showErrorMessage(
              message: state.statusText,
              context: context,
            );
          }
          if (state.statusText == "website_added") {
            BlocProvider.of<WebsiteCubit>(context).getWebsites(context);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: AppColors.C_6C63FF,
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white, size: 30.r),
      ),
    );
  }
}
