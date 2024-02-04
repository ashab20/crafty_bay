import 'package:crafty_bay/presentation/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/verify_opt_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPScreen extends StatelessWidget {
  const VerifyOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 120,),
                const AppLogo(),
                const SizedBox(height: 24,),
                Text('Enter OTP Code',style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 8,),
                Text('A 4 digit OTP code send to your phone.',style: Theme.of(context).textTheme.bodySmall,),
                const SizedBox(height: 24,),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.transparent,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: AppColors.primaryColor,
                      selectedFillColor: Colors.transparent,
                      selectedColor: Colors.purple
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  appContext: context,
                ),
                const SizedBox(height: 24,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Get.to(const CompleteProfileScreen());
                  }, child: const Text("Next"),
                  ),
                ),
                const SizedBox(height: 24,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: 'This code will expire',
                      ),TextSpan(
                        // TODO - Make this timer workable
                          text: '120s',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600
                          )
                      ),
                    ],),),
                TextButton(onPressed: (){}, child: const Text("Resend Code"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

