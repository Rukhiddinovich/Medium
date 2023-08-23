import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/auth/auth/auth_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).logOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}