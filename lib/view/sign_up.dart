import 'package:archi_mvvm_app/view/sign_in.dart';
import 'package:flutter/material.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _cinController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _ageController = TextEditingController();
final TextEditingController _adressController = TextEditingController();

// Displaying dialogs
void displayDialog(BuildContext context, String title, String text) =>
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(title: Text(title), content: Text(text)),
    );

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _checkbox = false;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  _buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.redAccent[700],
            fontSize: 15.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.topLeft,
          height: 50.0,
          child: TextFormField(
            controller: _nameController,
            style: TextStyle(
              color: Colors.grey[700],
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: Colors.red[300],
              ),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.redAccent[700],
              ),
              hintText: 'Name',
              hintStyle: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email' + ' : ',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.redAccent[700],
            fontSize: 15.0,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.topLeft,
          height: 50.0,
          child: TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.grey[700],
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: Colors.red[300],
              ),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.redAccent[700],
              ),
              hintText: 'email',
              hintStyle: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildCIN() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Cin',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.redAccent[700],
            fontSize: 15.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.topLeft,
          height: 50.0,
          child: TextFormField(
            controller: _cinController,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.grey[700],
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: Colors.red[300],
              ),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.badge,
                color: Colors.redAccent[700],
              ),
              hintText: 'cin',
              hintStyle: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildTel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Telephone',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.redAccent[700],
            fontSize: 15.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.topLeft,
          height: 50.0,
          child: TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.grey[700],
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: Colors.red[300],
              ),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.redAccent[700],
              ),
              hintText: 'telephone',
              hintStyle: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildAge() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Age',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.redAccent[700],
            fontSize: 15.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.topLeft,
          height: 50.0,
          child: TextFormField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.grey[700],
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: Colors.red[300],
              ),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.calendar_today,
                color: Colors.redAccent[700],
              ),
              hintText: 'age',
              hintStyle: TextStyle(
                color: Colors.grey[700],
              ),
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
          'Password',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.redAccent[700],
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
            controller: _pass,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.grey[700],
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: Colors.red[300],
              ),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.redAccent[700],
              ),
              hintText: 'password',
              hintStyle: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            controller: _confirmPass,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.grey[700],
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: Colors.red[300],
              ),
              prefixIcon: Icon(Icons.lock),
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'confirm password',
              hintStyle: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildAdress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Adresse' + ' : ',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.redAccent[700],
            fontSize: 15.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.topLeft,
          height: 50.0,
          child: TextFormField(
            controller: _adressController,
            style: TextStyle(
              color: Colors.grey[700],
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: Colors.red[300],
              ),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.add_location_alt_rounded,
                color: Colors.redAccent[700],
              ),
              hintText: 'adresse',
              hintStyle: TextStyle(color: Colors.grey[700]),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Color(0xFFeeeeee),
                    Color(0xFFe9e9e9),
                    Color(0xFFe5e5e5),
                    Color(0xFFe0e0e0),
                  ],
                      stops: [
                    0.2,
                    0.4,
                    0.7,
                    0.9
                  ])),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 50.0),
                //FORM
                child: Form(
                  key: _form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.redAccent[700],
                            fontFamily: 'OpenSans',
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          height: 100,
                          child: Image.asset("images/logo_fr.png")),

                      SizedBox(
                        height: 20.0,
                      ),
                      _buildName(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildEmail(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildPassword(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildCIN(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildAge(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildAdress(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildTel(),
                      SizedBox(height: 20.0),
                      //SIGNUP Button
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () async {
                              /*  _form.currentState.validate();
                              var email = _emailController.text;
                              var password = _pass.text;
                              var name = _nameController.text;
                              var cin = _cinController.text;
                              var phone = _phoneController.text;
                              var address = _adressController.text;
                              var age = _ageController.text;

                              if (name.length < 4)
                                displayDialog(
                                    context, "erreur".tr, "errNom".tr);
                              else if (password.length < 4)
                                displayDialog(
                                    context, "erreur".tr, "errMdp".tr);
                              else {
                                var res = await LoginServiceImp().attemptSignUp(
                                    email,
                                    password,
                                    name,
                                    cin,
                                    phone,
                                    address,
                                    age,
                                    _checkbox);
                                if (res == 200) {
                                  displayDialog(context, "succes".tr,
                                      "secouristeCree".tr);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                } else if (res == 404)
                                  displayDialog(
                                      context, "nomExiste".tr, "nomExiste2".tr);
                                else if (res == 404)
                                  displayDialog(context, "Verifdonné".tr,
                                      "Verifdonné2".tr);
                                else {
                                  print(res);
                                  displayDialog(
                                      context, "erreur".tr, "errInconnue".tr);
                                }
                              } */
                            },
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.redAccent[700],
                            child: Text(
                              'Create',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          )),
                      //SIGNIN
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                          );
                        },
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Singn in",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.redAccent[700],
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ),
                      )
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
