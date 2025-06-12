import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences_example/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailComtroller = TextEditingController();
  final passwordComtroller = TextEditingController();

  void saveUserToDevice() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", emailComtroller.text);
    await prefs.setString("password", passwordComtroller.text);
  }

  void checkForomUserDevice() async {
    final prefs = await SharedPreferences.getInstance();

    final String email = emailComtroller.text = prefs.getString("email") ?? "";
    final String password = passwordComtroller.text = prefs.getString("password") ?? "";

    if (email.isNotEmpty && password.isNotEmpty) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    print(email);
    print(password);
  }

  @override
  void initState() {
    checkForomUserDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("EXAMPLE", style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextField(
                controller: emailComtroller,
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Email"),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordComtroller,
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Şifre"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  saveUserToDevice();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text(
                  "Giriş Yap",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
