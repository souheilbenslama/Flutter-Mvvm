import 'package:archi_mvvm_app/model/user.dart';
import 'package:archi_mvvm_app/view/liste_secouristes.dart';
import 'package:archi_mvvm_app/view/profile_update.dart';
import 'package:archi_mvvm_app/view/sign_in.dart';
import 'package:archi_mvvm_app/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// The package used to get the location

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile();

  @override
  Widget build(BuildContext context) {
    User? secouriste = Provider.of<UserViewModel>(context, listen: true).user;

    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.vaccines,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ListeSecouristes(secouristes: [
                              "Polly Blair",
                              "Eleanor Leonard",
                              "Sydney Ramos",
                              "Georgia Miller",
                              "Austin Miller",
                              "Paul Mayor",
                              "John Doe",
                            ])));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ProfileUpdate(secouriste: secouriste!)));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.logout,
                  ),
                  onPressed: () async {
                    /* SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.remove('jwt');
                        Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(
                            builder: (BuildContext context) => new SignIn(),
                          ),
                        ); */
                  },
                ),
              ],
              backgroundColor: Colors.redAccent[700],
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text("profil"),
            ),
            body: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image(
                      image: AssetImage(
                        "images/logo_fr_tr.png",
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 200, 15, 15),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 95),
                                    child: Text(secouriste!.name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 80,
                              height: 80,
                              margin: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.15),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "images/user.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text("apropos"),
                              ),
                              Divider(),
                              ListTile(
                                title: Text("email"),
                                subtitle: Text(secouriste.email!),
                                leading: Icon(Icons.email_outlined),
                              ),
                              ListTile(
                                title: Text("cin"),
                                subtitle: Text(secouriste.cin!),
                                leading: Icon(Icons.badge),
                              ),
                              ListTile(
                                title: Text("num"),
                                subtitle: Text(secouriste.phone.toString()),
                                leading: Icon(Icons.call),
                              ),
                              ListTile(
                                title: Text("age"),
                                subtitle: (secouriste.age != null)
                                    ? Text(secouriste.age.toString())
                                    : Text("22"),
                                leading: Icon(Icons.date_range),
                              ),
                              ListTile(
                                title: Text("gouvernorat"),
                                subtitle:
                                    Text(secouriste.gouvernorat.toString()),
                                leading: Icon(Icons.place),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}

/* } else {
                      return Container(
                          color: Colors.white,
                          width: 500,
                          child: Align(
                              alignment: Alignment.center,
                              child: Center(
                                  child: SpinKitFadingCircle(
                                color: Colors.grey[800],
                                size: 140.0,
                              ))));
                    }
 */
