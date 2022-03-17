import 'package:flutter/material.dart';

class ListeSecouristes extends StatefulWidget {
  final secouristes;
  const ListeSecouristes({@required this.secouristes});
  @override
  _ListeSecouristesState createState() => _ListeSecouristesState();
}

class _ListeSecouristesState extends State<ListeSecouristes> {
  var secouristes = [
    "Polly Blair",
    "Eleanor Leonard",
    "Sydney Ramos",
    "Georgia Miller",
    "Austin Miller",
    "Paul Mayor",
    "John Doe",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Text("listeSec"),
      ),
      body: ListView.builder(
        itemCount: widget.secouristes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/interventionParSecouriste');
            },
            child: Card(
              color: Colors.white,
              elevation: 3,
              child: ListTile(
                title: Text(
                  widget.secouristes[index] != null
                      ? widget.secouristes[index]
                      : "none",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
