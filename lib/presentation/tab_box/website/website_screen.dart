import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medium_project/data/models/website/website_model.dart';
import 'package:medium_project/presentation/app_routes.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../cubits/cubits/website_fetch/website_fetch_cubit.dart';
import '../../../data/models/status/form_status.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/ui_utils/error_message_dialog.dart';

class WebsiteScreen extends StatefulWidget {
  const WebsiteScreen({super.key});

  @override
  State<WebsiteScreen> createState() => _WebsiteScreenState();
}

class _WebsiteScreenState extends State<WebsiteScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    Future.microtask(
        () => BlocProvider.of<WebsiteFetchCubit>(context).getWebsites(context));
  }

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.C_6C63FF),
        backgroundColor: AppColors.C_6C63FF,
        title: Text(
          "Websites screen",
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
      body: BlocConsumer<WebsiteFetchCubit, WebsiteFetchState>(
        builder: (context, state) {
          return GridView.builder(
            itemCount: state.websites.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              WebsiteModel website = state.websites[index];
              return ZoomTapAnimation(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.websiteDetail,
                      arguments: website);
                },
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  margin: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: AppColors.C_6C63FF, blurRadius: 3.r),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100.h,
                        width: 200.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: baseUrl + website.image.substring(1),
                            placeholder: (context, url) =>
                                const CupertinoActivityIndicator(
                                    color: Colors.black),
                            errorWidget: (context, url, error) => Icon(
                                CupertinoIcons.photo_fill,
                                color: Colors.black,
                                size: 45.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: ${website.name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  fontFamily: "Poppins",
                                  color: Colors.black),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              "Phone: ${website.contact}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  fontFamily: "Poppins",
                                  color: Colors.black),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              "Author: ${website.author}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  fontFamily: "Poppins",
                                  color: Colors.black),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              "Link: ${website.link}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  fontFamily: "Poppins",
                                  color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        listener: (context, state) {
          if (state.status == FormStatus.failure) {
            showErrorMessage(
              message: state.statusText,
              context: context,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: AppColors.C_6C63FF,
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.websiteAdd);
        },
        child: Icon(Icons.add, color: Colors.white, size: 30.r),
      ),
    );
  }
}
