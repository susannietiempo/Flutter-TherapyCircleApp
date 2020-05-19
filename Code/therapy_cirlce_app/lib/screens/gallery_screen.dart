import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GalleryScreen extends StatefulWidget {
  static const String id = 'gallery_screen';

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          Icon(FontAwesomeIcons.ellipsisV),
        ],
        title: Center(
          child: Text(
            'Gallery',
            style: kappBarText,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add),
          onPressed: () {}),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  'Therapy Moments',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            //THIS IS A PLACE HOLDER ONLY
            //TO DO: Implement Calendar functionality
            Expanded(child: Image.asset('images/gallery.jpg'),)
          ],
        ),
      ),
    );
  }
}
