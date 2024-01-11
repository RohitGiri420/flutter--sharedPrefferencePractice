import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preffs/UiHepler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String UserName = "empty";
  String? Password;

  @override
  void initState() {
    super.initState();

    getdata();
    // setState(() {
    //
    // });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          UiHelper.customTextField(
              emailController, "Email", Icons.mail, TextInputType.emailAddress),
          SizedBox(
            height: 20,
          ),
          UiHelper.customTextField(passwordController, "Password",
              Icons.password, TextInputType.visiblePassword),
          SizedBox(
            height: 20,
          ),
          UiHelper.customButton(() {
            setdata();
            setState(() {});
          }, "save"),
          SizedBox(
            height: 20,
          ),
          Text("$UserName"),
          Text("$Password"),
        ],
      ),
    );
  }

  setdata() async {
    final SharedPreferences preffs = await SharedPreferences.getInstance();
    UserName = emailController.text.toString();
    Password = passwordController.text.toString();

    preffs.setString("email", UserName);
    preffs.setString("pass", Password!);


  }

  getdata() async {
    final SharedPreferences preffs = await SharedPreferences.getInstance();

    String? temp = preffs.getString("email");
    String? temp1 = preffs.getString("pass");

    UserName = temp!;
    Password = temp1!;
  }
}
