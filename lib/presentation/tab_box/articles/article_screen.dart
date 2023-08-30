import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../bloc/article_bloc.dart';
import '../../../bloc/article_state.dart';
import '../../../data/models/article/article_model.dart';
import '../../../utils/colors/colors.dart';
import '../../app_routes.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.C_6C63FF),
        backgroundColor: AppColors.C_6C63FF,
        title: Text(
          "Article screen",
          style: TextStyle(
              fontSize: 24.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is ArticleLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ArticleErrorState) {
            return Center(child: Text(state.errorText));
          }

          if (state is ArticleSuccessState) {
            return Column(
              children: [
                ...List.generate(
                  state.articleModel.length,
                  (index) {
                    ArticleModel articleModel = state.articleModel[index];
                    return ListTile(
                      title: Text(
                        articleModel.title,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: Colors.black),
                      ),
                      leading: Text(articleModel.avatar),
                    );
                  },
                ),
              ],
            );
          }
          return Center(child: Text("Jamshid",style: TextStyle(color: Colors.black,fontSize: 24.sp),),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: AppColors.C_6C63FF,
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.articleDetail);
        },
        child: Icon(Icons.add, color: Colors.white, size: 30.r),
      ),
    );
  }
}
