import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // (pertemuan 5)
        // child: Text('Home Page',
        // style: GoogleFonts.abel(fontSize: 24)),
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeS0IFabW0alfxNjicu7Rsq6WVm7vyg_LPdw&s",
              ),
            ),
            title: Text(
              "Septian",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text("10.13", style: TextStyle(fontSize: 12)),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://cdn1.katadata.co.id/media/images/thumb/2021/08/13/zigi-6115d942dd871-fiki-un1ty_620x413_thumb.jpeg",
              ),
            ),
            title: Text(
              "Fiki",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text(
              "kamu kenapa bubar grup nya?",
              style: TextStyle(fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text("10.15", style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
