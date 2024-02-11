import 'package:crafty_bay/presentation/ui/screens/auth/verify_opt_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 48,),
                const AppLogo(),
                const SizedBox(height: 24,),
                Text('Complete Profile',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 28
                ),),
                const SizedBox(height: 8,),
                Text('Get started with us with your details.',style: Theme.of(context).textTheme.bodySmall,),
                const SizedBox(height: 16,),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      hintText: 'First Name'
                  ),
                ),const SizedBox(height: 16,),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      hintText: 'Last Name'
                  ),
                ),const SizedBox(height: 16,),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(

                      hintText: 'Mobile'
                  ),
                ),const SizedBox(height: 16,),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      hintText: 'City'
                  ),
                ),const SizedBox(height: 16,),
                TextFormField(
                  maxLines: 4,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                      hintText: 'Shipping Address'
                  ),
                ),
                const SizedBox(height: 24,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){ Get.to(const MainBottomNavScreen());}, child: const Text("Complete"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}