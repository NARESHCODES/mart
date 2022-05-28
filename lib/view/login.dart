import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mart/service/remote_service.dart';
import 'package:mart/util/app_color.dart';
import 'package:mart/util/app_size.dart';
import 'package:mart/view/home.dart';
import 'package:mart/widgets/verticalgap.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    GlobalKey<FormState> key = GlobalKey<FormState>();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                MaterialButton(
                    onPressed: () {
                      Get.off(() => const HomeView());
                    },
                    child: Text(
                      "Skip Now",
                      style: TextStyle(color: AppColor.iconColor),
                    ))
              ],
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        SizedBox(
                            height: 200,
                            width: Get.size.width,
                            child: Lottie.asset("images/login.json")),
                        //email
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.textFieldBorderColor),
                              borderRadius: BorderRadius.circular(
                                  AppSize.textFormFieldBorderRadius),
                              color: AppColor.textFieldBgColor),
                          child: TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? "Email is required" : null,
                            controller: email,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                hintText: "Email",
                                border: InputBorder.none),
                          ),
                        ),
                        const VGap(),
                        //password
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.textFieldBorderColor),
                              borderRadius: BorderRadius.circular(
                                  AppSize.textFormFieldBorderRadius),
                              color: AppColor.textFieldBgColor),
                          child: TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? "pasword is required" : null,
                            controller: password,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                hintText: "Password",
                                border: InputBorder.none),
                          ),
                        ),

                        const VGap(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgotten Password?",
                              style: TextStyle(
                                color: AppColor.linkTextColor,
                              ),
                            )
                          ],
                        ),
                        const VGap(),
                        SizedBox(
                            width: Get.size.width,
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColor.buttonColor),
                                  foregroundColor: MaterialStateProperty.all(
                                      AppColor.buttonTextColor)),
                              onPressed: () {
                                if (key.currentState!.validate()) {
                                  RemoteService.login(
                                      email.text, password.text);
                                }
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(fontSize: 18),
                              ),
                            )),
                        const VGap(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Create a new account?",
                              style: TextStyle(
                                  color: AppColor.linkTextColor,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
