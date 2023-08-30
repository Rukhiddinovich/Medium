import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medium_project/presentation/auth/widgets/global_onchanged_text_field.dart';
import 'package:medium_project/utils/icons/icons.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../cubits/cubits/website_add/website_add_cubit.dart';
import '../../../../cubits/cubits/website_add/website_add_state.dart';
import '../../../../cubits/cubits/website_fetch/website_fetch_cubit.dart';
import '../../../../data/models/status/form_status.dart';
import '../../../../data/models/website/website_field_key.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/ui_utils/error_message_dialog.dart';

class WebsiteAddScreen extends StatefulWidget {
  const WebsiteAddScreen({super.key});

  @override
  State<WebsiteAddScreen> createState() => _WebsiteAddScreenState();
}

class _WebsiteAddScreenState extends State<WebsiteAddScreen> {
  ImagePicker picker = ImagePicker();

  XFile? file;
  late WebsiteAddCubit bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<WebsiteAddCubit>(context);
    super.initState();
  }

  var maskFormatter = MaskTextInputFormatter(
      mask: "#########",
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.C_6C63FF),
        backgroundColor: AppColors.C_6C63FF,
        title: Text(
          "Websites Add screen",
          style: TextStyle(
              fontSize: 24.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<WebsiteAddCubit, WebsiteAddState>(
        builder: (context, state) {
          return ListView(
            children: [
              Lottie.asset(AppImages.add, height: 250.h),
              GlobalOnChangedTextField(
                  hintText: "Name",
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  onChanged: (v) {
                    context.read<WebsiteAddCubit>().updateWebsiteField(
                          fieldKey: WebsiteFieldKeys.name,
                          value: v,
                        );
                  },
                  prefixIcon: const Icon(CupertinoIcons.person_alt_circle)),
              SizedBox(height: 10.h),
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
                  onChanged: (v) {
                    context.read<WebsiteAddCubit>().updateWebsiteField(
                          fieldKey: WebsiteFieldKeys.contact,
                          value: v,
                        );
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(CupertinoIcons.phone_fill),
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
              GlobalOnChangedTextField(
                  hintText: "Link",
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  onChanged: (v) {
                    context.read<WebsiteAddCubit>().updateWebsiteField(
                      fieldKey: WebsiteFieldKeys.link,
                      value: v,
                    );
                  },
                  prefixIcon: const Icon(CupertinoIcons.link)),
              SizedBox(height: 10.h),
              GlobalOnChangedTextField(
                  hintText: "Author",
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  onChanged: (v) {
                    context.read<WebsiteAddCubit>().updateWebsiteField(
                      fieldKey: WebsiteFieldKeys.author,
                      value: v,
                    );
                  },
                  prefixIcon: const Icon(CupertinoIcons.person_alt)),
              SizedBox(height: 10.h),
              GlobalOnChangedTextField(
                  hintText: "Hashtag",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.start,
                  onChanged: (v) {
                    context.read<WebsiteAddCubit>().updateWebsiteField(
                      fieldKey: WebsiteFieldKeys.hashtag,
                      value: v,
                    );
                  },
                  prefixIcon: const Icon(Icons.dataset_linked_sharp)),
              SizedBox(height: 50.h),
              ZoomTapAnimation(
                onTap: () {
                  showBottomSheetDialog();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50.w),
                  width: 200.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: AppColors.C_6C63FF,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Select image",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontSize: 18.sp,
                            color: AppColors.white),
                      ),
                      SizedBox(width: 2.w),
                      Icon(Icons.photo, size: 30.sp, color: AppColors.white),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              ZoomTapAnimation(
                onTap: () {
                  if (context.read<WebsiteAddCubit>().state.canAddWebsite()) {
                    context.read<WebsiteAddCubit>().createWebsite(context);
                  } else {
                    showErrorMessage(
                        message: "Fields are not fill!",
                        context: context);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50.w),
                  width: 200.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: AppColors.C_6C63FF,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Center(
                    child: Text(
                      "Website add",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          fontSize: 18.sp,
                          color: AppColors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
        },
        listener: (context, state) {
          if (state.status == FormStatus.failure) {
            showErrorMessage(
              message: state.statusText,
              context: context,
            );
          }

          if (state.status == FormStatus.success &&
              state.statusText == StatusTextConstants.websiteAdd) {
            BlocProvider.of<WebsiteFetchCubit>(context).getWebsites(context);
            Navigator.pop(context);
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

    if (xFile != null && context.mounted) {
      BlocProvider.of<WebsiteAddCubit>(context).updateWebsiteField(
        fieldKey: WebsiteFieldKeys.image,
        value: xFile.path,
      );
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null && context.mounted) {
      BlocProvider.of<WebsiteAddCubit>(context).updateWebsiteField(
        fieldKey: WebsiteFieldKeys.image,
        value: xFile.path,
      );
    }
  }
}
