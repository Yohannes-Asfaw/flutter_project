
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mynotes/application/blocs/app_state.dart';
import 'package:mynotes/auth/login/login_bloc.dart';
import 'package:mynotes/auth/login/login_state.dart';
import 'package:mynotes/storage/localstorage.dart';
import 'package:mynotes/user/blocs/user_bloc.dart';
import 'package:mynotes/user/blocs/user_event.dart';
import 'package:mynotes/views/companies_post.dart';
import 'package:mynotes/views/user_profile.dart';
import 'package:mynotes/views/user_registration.dart';

import '../application/blocs/app_bloc.dart';
import '../application/blocs/app_event.dart';
import '../auth/auth_repository.dart';
import '../auth/login/data_provide/dataprovider.dart';
import '../auth/login/login_event.dart';
import 'company_registration.dart';
import 'companylogin.dart';



// void main() {
//   runApp(
//     const LoginView(),
//   );
// }

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,
        ),
        body: const Loginviewstatefull());
  }
}

class Loginviewstatefull extends StatefulWidget {
  const Loginviewstatefull({Key? key}) : super(key: key);

  @override
  State<Loginviewstatefull> createState() => _LoginviewstatefullState();
}

class _LoginviewstatefullState extends State<Loginviewstatefull> {
  late final TextEditingController _username;
  late final TextEditingController _password;
  late final TextEditingController _companyName;
  late final TextEditingController _companPassword;

  bool isvisible = true;
  var check = 1;

  final _formKey = GlobalKey<FormState>();
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }


  @override
  void initState() {
    _password = TextEditingController();
    _username = TextEditingController();
    _companyName = TextEditingController();
    _companPassword = TextEditingController();

    
  

    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _companPassword.dispose();
    _companyName.dispose();
    super.dispose();
  }

  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
//      final provid = Loginprovider();
//     final authRepo = AuthenticationRepository(provid);
// final loginBloc = BlocProvider.of<LoginBloc>(context);   
//  return RepositoryProvider<AuthenticationRepository>(
//              create: (context) => authRepo,

      
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
            padding: const EdgeInsets.fromLTRB(40, 0, 50, 40),
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.teal
                // image: DecorationImage(
                //   image: AssetImage('assets/images/phone_5.jpg'),
                //   fit: BoxFit.cover,
                // ),
                ),
           
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: ((context, state) {
                        if (state is LoginFilure){
                         AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.ERROR,
                                    animType: AnimType.TOPSLIDE,
                                    title: 'ERROR',
                                    desc: 'invalid user name or password',
                                    btnOkOnPress: () {},
                                  ).show();}
                         if (state is UserLoginSuccess){
                           BlocProvider.of<AppBloc>(context).add(FetchByUserid(state.user.id));
                           BlocProvider.of<UserBloc>(context).add(FetchByuserName(state.user.id));

                        context.go('/UserNavigation');
                        }
                      }),
                      builder: (context, state) {
                         return Form(
                           key: _formKey,
                             child: SingleChildScrollView(
                             child: Column(
                            children: <Widget>[
                       Container(
                          margin: const EdgeInsets.only(bottom: 20, top: 20),
                          decoration: const BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                                    
                                // bottomRight: Radius.circular(50))),
                              )),
                          height: 130,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            "Intern Suit",
                            style: TextStyle(
                                fontSize: 60,
                                fontFamily: 'DancingScript',
                                color: Colors.white),
                          )),
  
                   
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: TextFormField(
                          controller: _username,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            
                            enabledBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            labelText: 'User Name',
                            labelStyle: TextStyle(color: Colors.white),
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedErrorBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'User Name is required';
                            }
                
                            return null;
                          },
                        ),
                      ),
                    if (isvisible)
                      Container(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: _password,
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              // border: OutlineInputBorder(),
                              labelText: 'Password',
                              labelStyle: const TextStyle(color: Colors.white),
                              errorStyle: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedErrorBorder:const  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ), 
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                  color: _showPassword
                                      ? Colors.white
                                      : Colors.grey,
                                  icon: Icon(
                                    !_showPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(
                                        () => _showPassword = !_showPassword);
                                  }),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              } else if (value.trim().length < 4) {
                                return 'password length is short';
                              }
                              return null;
                            },
                          )),
                    if (isvisible)
                      Align(
                         alignment: Alignment.centerRight,
                              child: Container(
                                  height: 40,
                                  width: 120,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            width: 1, color: Colors.white),
                                        // shape: const RoundedRectangleBorder(
                                        //     borderRadius: BorderRadius.all(
                                        //         Radius.circular(15))),
                                      ),
                                      child: const Text(
                                        'sign in',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                            onPressed: () async {
                              
                              
                              final password = _password.text;
                              final username = _username.text;
                              if (_formKey.currentState!.validate()) {
                                   BlocProvider.of<LoginBloc>(context).add(AttemptLogin(username,password));
                                   

                                  } 
                            },
                            
                          )
                          )),
                          
                           Row(
                        children: <Widget>[
                          const Text(
                            'Does not have account?',
                            style: TextStyle(color: Colors.yellow),
                          ),
                          TextButton(
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {
                             
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupView(),));
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),

                         Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(65, 0, 65, 0),
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side:
                                  const BorderSide(width: 1, color: Colors.white),
                              // shape: const RoundedRectangleBorder(
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(25))),
                            ),
                            child: const Text(
                              'Signin As Company',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyLoginView(),));

                            },
                          )),

                
                            ])));
                       }  )])))  

);}}