import 'package:flutter/material.dart';

import '../models/band.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
    Band(id: '1', name:'Metalica', votes: 5),
    Band(id: '2', name:'Queen', votes: 1),
    Band(id: '3', name:'Heroes del silencio', votes: 2),
    Band(id: '4', name:'Bon jovi', votes: 5),
  ];

  final AppBar _bar = AppBar(
    title: const Text('BandNames', style: TextStyle(color: Colors.black87)),
    backgroundColor: Colors.white,
    elevation: 1,
  );

  ListTile bandTile( Band band) {
    return ListTile(
      leading: CircleAvatar(
          child: Text(band.name.substring(0,2)),
          backgroundColor: Colors.blue[100]),
      title: Text(band.name),
      trailing: Text('${band.votes}', style: TextStyle(fontSize: 20)),
      onTap: () {
        print(band.name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _bar,
      body: ListView.builder(
        itemCount:bands.length,
        itemBuilder: (context, i) => bandTile(bands[i])
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        child: Icon(Icons.add),
        elevation: 1,
      ),
    );
  }

  addNewBand() {
    final TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('New band name'),
          content: TextField(
            controller: textController,
          ),
          actions: [
            MaterialButton(
                child: Text('Add'),
                elevation: 5,
                textColor: Colors.blue,
                onPressed: (){
                  print(textController.text);
                })
          ],
        );
      }
    );
  }
}