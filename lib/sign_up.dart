import 'package:flutter/material.dart';
import 'package:flutter_ecom/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.orange.shade800,
      body: Center(
        child: Container(
          height: 500,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textFormFieldWidget(
                    "username", Icons.person, "username should not be empty", false),
                textFormFieldWidget(
                    "email", Icons.email, "email should not be empty", false),
                textFormFieldWidget(
                    "password", Icons.lock, "password should not be empty", true),
                textFormFieldWidget("confirm password", Icons.lock,
                    "confirm password should not be empty", true),
                elevatedButtonWidget(),
                GestureDetector(
                  onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an Account? ",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: Colors.orange.shade800,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget elevatedButtonWidget() => SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            }
            ;
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "Sign up",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontSize: 15,
            ),
          ),
        ),
      );

  Widget textFormFieldWidget(String hint, IconData icon, String errorText,bool obscure) =>
      TextFormField(
        validator: (String? value) {
          if (value!.isEmpty) {
            return errorText;
          }
          return null;
        },
        obscureText: obscure,
        cursorColor: Colors.orange,
        style: const TextStyle(
          color: Colors.orange,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.orange,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.orange,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Colors.orange)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Colors.orange)),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 2, color: Colors.red)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 2, color: Colors.red)),
        ),
      );
}
