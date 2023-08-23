import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/auth/auth/auth_cubit.dart';
import '../../../data/models/user/user_model.dart';
import '../../../utils/ui_utils/error_message_dialog.dart';
import '../../app_routes.dart';
import '../widgets/global_button.dart';
import '../widgets/global_text_field.dart';

class GmailConfirmScreen extends StatefulWidget {
  GmailConfirmScreen({super.key,required this.userModel});

  UserModel userModel;

  @override
  State<GmailConfirmScreen> createState() => _GmailConfirmScreenState();
}

class _GmailConfirmScreenState extends State<GmailConfirmScreen> {
  final PageController pageController = PageController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController gmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.blue),
        title: Text(
          "Gmail Confirm Screen",
          style: TextStyle(
              fontSize: 20.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlobalTextField(
                hintText: "Code",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                controller: codeController,
              ),
              GlobalButton(
                title: "Confirm",
                onTap: () {
                  context.read<AuthCubit>().confirmGmail(codeController.text);
                },
              ),
              const SizedBox(height: 50)
            ],
          );
        },
        listener: (context, state) {
          if (state is AuthConfirmCodeSuccessState) {
            context.read<AuthCubit>().registerUser(widget.userModel);
          }

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
