import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

   bool passwordVisible=false;
    @override
    void initState(){
      super.initState();
      passwordVisible=true;
    } 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
     child: Scaffold(
        backgroundColor: Color.fromARGB(255, 170, 97, 1),
        body: Column(
          children: [
            SizedBox(
            width: double.infinity,
            height: size.height * 0.3,
           child: Image.asset('assets/images/logo.png'),
            ),
            Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20),),),
                    child: SingleChildScrollView(
                    child: Form(
                      key: _loginFormKey,
                      child: Column(
                        children: [
                          Container(
                           alignment: Alignment.centerLeft,
                           padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
                            child: Text(
                                "LOGIN",
                                style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NotoSerif'
                              ),
                           ),
                          ),
                          Container(
                           width: size.width * 0.9,
                           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                           child: Column(
                           children: [
                           Align(
                           alignment: Alignment.centerLeft,
                           child: Text("Email", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                           ),
                           TextFormField(                           
                           decoration: InputDecoration(
                           hintText: 'Your email id',
                           labelText: 'Email',
                           ),
                           autovalidateMode: AutovalidateMode.onUserInteraction,
                           validator:   (textValue) {
                              if(textValue == null || textValue.isEmpty) {
                                return 'Email is required!';
                              }
                              if(!EmailValidator.validate(textValue)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            ),
                           ],
                          ),
                         ),
                          const SizedBox(height: 16,),
                         Container(
                           width: size.width * 0.9,
                           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                           child: Column(
                           children: [
                           Align(
                           alignment: Alignment.centerLeft,
                           child: Text("Password", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                           ),
                          TextFormField(
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                          hintText: 'Your Password',
                          labelText: 'Password',
                          suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                          onPressed: () {
                          setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                   ),
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                   validator: (textValue) {
                              if(textValue == null || textValue.isEmpty) {
                                return 'Password is required!';
                              }
                              return null;
                            },
          ),
        ],
      ),
    ),
                         const SizedBox(height: 16,),
                         Container(
                            width: size.width * 0.80,
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () => {
                            
                              },
                              child: const Text(
                                'Forget password?',
                                style: TextStyle(
                                  color: Color(0xff939393),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Container(
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                          color: const Color(0xff233743),
                          borderRadius: BorderRadius.circular(26),
                        ),
                      child: TextButton(
                      onPressed: (){
                    if (_loginFormKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Submitting data..')),
                  );
                }
                },
             child: Text("Submit", style: const TextStyle(color: Colors.white, fontSize: 20),),
            ),
          ),  
          const SizedBox(height: 18,),
                          SizedBox(
                            width: size.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Don\'t have an account ? ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                                GestureDetector(
                                  onTap: () => {
                                   
                                  },
                                  child: const Text('Sign-up', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                          ]))
                    ),
                ),
              )
          ]
          ),
     ),
    );
  }
}