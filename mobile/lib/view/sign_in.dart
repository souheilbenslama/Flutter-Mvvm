import 'dart:convert';

import 'package:archi_mvvm_app/view/Profile.dart';
import 'package:archi_mvvm_app/view/sign_up.dart';
import 'package:archi_mvvm_app/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

// Displaying dialogs
void displayDialog(BuildContext context, String title, String text) =>
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(title: Text(title), content: Text(text)),
    );

class SignIn extends StatelessWidget {
  // Defining the passwordcontroller and the email controller
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'email' + " :",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            controller: _usernameController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.grey[300]),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'email', //.tr,
              hintStyle: TextStyle(color: Colors.grey[300]),
            ),
          ),
        )
      ],
    );
  }

  _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password', //.tr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            controller: _passwordController,
            validator: (val) {
              /*   if (val.isEmpty) return 'mdpInvalide'.tr;
              return null; */
            },
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.grey[300]),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.grey[300]),
            ),
          ),
        )
      ],
    );
  }

  _buildForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        padding: EdgeInsets.only(right: 0.0),
        onPressed: () {},
        child: const Text(
          'forget Password',
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar:
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFFe84f4c),
                    Color(0xFFe53935),
                    Color(0xFFe2231e),
                    Color(0xFFe2231e),
                  ],
                      stops: [
                    0.2,
                    0.5,
                    0.9,
                    0.9
                  ])),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
                child: Form(
                  key: _form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Image.asset("images/logo_fr.png"),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        width: 100,
                      ),
                      /*                   backgroundColor: Colors.white, */

                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'Sign in ',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      _buildEmail(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPassword(),
                      _buildForgotPassword(),
                      SizedBox(
                        height: 20.0,
                      ),
                      //Login Button
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () async {
                              _form.currentState?.validate();
                              print("form valdiated ");
                              var username = _usernameController.text;
                              var password = _passwordController.text;

                              await Provider.of<UserViewModel>(context,
                                      listen: false)
                                  .loginUser(username, password);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile()));

                              /*  _form.currentState.validate();
                                  print("form valdiated ");
                                  var username = _usernameController.text;
                                  var password = _passwordController.text;
                                  var jwt = await LoginServiceImp()
                                      .attemptLogIn(username, password);
                                  print(jwt);
                                  //print("attempt to login finished " + jwt);
                                  if (jwt != null) {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString("jwt", jwt);
                                    print("string set to " + jwt);

                                    var ss =
                                        Secouriste.fromJson(jsonDecode(jwt));
                                    if (!ss.isActivated && !ss.isNormalUser) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ActivateAccount()));
                                    } else {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Profile(ss)));
                                    }
                                  } else {
                                    displayDialog(context, "erreur".tr,
                                        "compteIntrouvable".tr);
                                  } */
                            },
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.white,
                            child: Text(
                              'connexion',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          )),
                      //SIGNUP
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "create account",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold))
                          ])))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
