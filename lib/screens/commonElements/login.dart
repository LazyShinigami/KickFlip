import 'package:flutter/material.dart';
import 'package:kickflip/commons.dart';
import 'package:kickflip/constants.dart';
import 'package:kickflip/screens/buyers/buyerHomepage.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.callback});
  final VoidCallback callback;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String accountType = 'buyer';
  String errorMsg = '';

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final pwdController = TextEditingController();
    final resetPwdController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyText("Login", size: 22, spacing: 3, weight: FontWeight.bold),
                const SizedBox(height: 20),

                // Account type switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Buyer
                    GestureDetector(
                      onTap: () {
                        accountType = "buyer";
                        setState(() {});
                        print(accountType);
                      },
                      child: Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          image: (accountType == 'buyer')
                              ? const DecorationImage(
                                  image:
                                      AssetImage('assets/graphics/op-03.jpeg'),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: MyText(
                          'Buyer',
                          size: 14,
                          color: (accountType == 'buyer')
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),

                    // Seller
                    GestureDetector(
                      onTap: () {
                        accountType = "seller";
                        setState(() {});
                        print(accountType);
                      },
                      child: Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          image: (accountType == 'seller')
                              ? const DecorationImage(
                                  image:
                                      AssetImage('assets/graphics/op-03.jpeg'),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: MyText(
                          'Seller',
                          size: 14,
                          color: (accountType == 'seller')
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                // Error Message
                if (errorMsg.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: MyText(
                      errorMsg,
                      size: 12,
                      color: const Color.fromARGB(196, 244, 67, 54),
                    ),
                  ),

                // Form fields
                if (errorMsg.isEmpty) const SizedBox(height: 20),

                // E-mail field
                MyTextField(
                  controller: emailController,
                  label: "E-Mail",
                  hint: 'Enter your e-mail',
                ),
                const SizedBox(height: 10),

                // Password field
                MyTextField(
                    controller: pwdController,
                    label: "Password",
                    hint: 'Enter your password',
                    obscureText: true),
                const SizedBox(height: 10),

                // Submit button
                GestureDetector(
                  onTap: () {
                    print("Submit button clicked");
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BuyerHomepage(uID: 5678),
                        ),
                        (route) => false);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 70,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/graphics/op-02.jpeg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: MyText(
                        'Continue',
                        size: 14,
                        spacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                //
                MyText(' -   or   - ', size: 12),
                const SizedBox(height: 15),

                // Google sign-in button
                GestureDetector(
                  onTap: () {
                    print('Continue with Google button pressed');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/graphics/op-03.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(500),
                          ),
                          child: Image.asset('assets/google.png'),
                        ),
                        const SizedBox(width: 20),
                        MyText(
                          'Continue with Google',
                          size: 14,
                          spacing: 2,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),

                // Sign-up link
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    print("Forgot your password?");
                    showResetPasswordPopup(context, resetPwdController);
                  },
                  child: MyText(
                    'Forgot your password?',
                    size: 12,
                    spacing: 1,
                    weight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      'Don\'t have an account yet?',
                      size: 12,
                      spacing: 1,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Sign up button tapped");
                        widget.callback();
                      },
                      child: MyText(
                        ' Sign up now!',
                        size: 12,
                        spacing: 1,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showResetPasswordPopup(
      BuildContext context, TextEditingController controller) {
    showDialog(
      context: context,
      builder: (BuildContext childContext) {
        return AlertDialog(
          title: Column(
            children: [
              MyText(
                'Aww! We\'re sorry to here you have trouble logging in...',
                size: 13,
                spacing: 1.25,
              ),
              const SizedBox(height: 10),
              const Divider(),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                MyText(
                  'Enter your e-mail. We will send a reset e-mail. Follow it and you\'re done!',
                  size: 12,
                  spacing: 1,
                ),
                // E-mail text field
                const SizedBox(height: 20),
                MyTextField(controller: controller, label: 'E-mail'),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Send reset e-mail button
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/graphics/op-02.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: MyText(
                        'Continue',
                        color: Colors.white,
                        size: 12,
                        spacing: 1,
                      ),
                    ),
                  ),
                ),

                // Cancel Button
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Center(
                      child: MyText(
                        'Cancel',
                        color: Colors.black,
                        size: 12,
                        spacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
