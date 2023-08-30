import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medium_project/presentation/tab_box/website/widgets/global_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../data/models/website/website_model.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/constants/constants.dart';

class WebsiteDetailScreen extends StatelessWidget {
  const WebsiteDetailScreen({super.key, required this.websiteModel});

  final WebsiteModel websiteModel;

  Future<void> _launchURL(Uri link) async {
    if (!await canLaunchUrl(link.toString() as Uri)) {
      throw Exception('Could not launch $link');
    }
    await launchUrl(link.toString() as Uri);
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (!await launchUrl(Uri.parse(link.url))) {
      throw Exception('Could not launch ${link.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.C_6C63FF),
        backgroundColor: AppColors.C_6C63FF,
        title: Text(
          "Websites Detail screen",
          style: TextStyle(
              fontSize: 24.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Column(
              children: [
                SizedBox(
                  height: 300.h,
                  width: 300.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: baseUrl + websiteModel.image.substring(1),
                      placeholder: (context, url) =>
                          const CupertinoActivityIndicator(color: Colors.black),
                      errorWidget: (context, url, error) => Icon(
                          CupertinoIcons.photo_fill,
                          color: AppColors.C_6C63FF,
                          size: 100.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                GlobalContainer(text: "Name: ${websiteModel.name}"),
                SizedBox(height: 10.h),
                ZoomTapAnimation(
                  onTap: () {
                    _launchURL(Uri.parse(websiteModel.link));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    margin: EdgeInsets.symmetric(horizontal: 40.w),
                    width: 300.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(color: AppColors.C_6C63FF, blurRadius: 3.r),
                      ],
                    ),
                    child: Center(
                      child: Linkify(
                        onOpen: _onOpen,
                        text: "Click on the link !\n${websiteModel.link}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            fontFamily: "Poppins",
                            color: Colors.black),
                        linkStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            fontFamily: "Poppins",
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                GlobalContainer(text: "Author: ${websiteModel.author}"),
                SizedBox(height: 10.h),
                GlobalContainer(text: "Hashtag: ${websiteModel.hashtag}"),
                SizedBox(height: 10.h),
                GlobalContainer(text: "+998 ${websiteModel.contact}"),
                SizedBox(height: 20.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
