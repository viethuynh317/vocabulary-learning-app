import 'package:editable/editable.dart';
import 'package:flutter/material.dart';


class TablePage extends StatefulWidget {
 @override
 _TablePageState createState() => _TablePageState();
}
class _TablePageState extends State<TablePage> {
  final _editableKey = GlobalKey<EditableState>();
   List listOfColumns = [
    {"word": "civilization(n)", "mean": "nền văn minh", "level": "1"},
    {"word": "virtual(adj)", "mean": "ảo", "level": "3"},
    {"word": "independence(n)", "mean": "sự độc lập", "level": "5"},
    {"word": "Indian(n)", "mean": "Người Ấn Độ", "level": "5"},
    {}
  ];


@override
 Widget build(BuildContext context) {
   const PrimaryColor = const Color(0xFF151026);
   List rows = [
   {"Word": 'Essien Ikpa', "Definition":'this is the name',"Level":'2'}, 
 ];
//Headers or Columns
List headers = [
   {"title":'Word', 'index': 1, 'key':'Word'},
   {"title":'Definition', 'index': 2, 'key':'Definition'},
   {"title":'Level', 'index': 3, 'key':'Level'},
 ];
 return Scaffold(
   
    appBar: AppBar(
      title: Text('Vocab list', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blue,
      ),
    body: ListView(
          // scrollDirection: Axis.horizontal,   
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Center(
                  child: Text(
                'List Word',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: addNewRow,
                iconSize: 30,
                // alignment: Alignment.topLeft, 
              ),
            ),

          SingleChildScrollView(
            child: DataTable(
            sortColumnIndex: 0,
            sortAscending: true,
            columns: [
              
              DataColumn(
                  label: Text('Word',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Mean',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ))),
              DataColumn(
                  label: Text('Level',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Edit',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Delete',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))),
            ],
            rows: listOfColumns
                .map(((element) => DataRow(cells: <DataCell>[
                      DataCell(
                        TextFormField(
                          initialValue: element['word'] ?? "",
                          keyboardType: TextInputType.text,
                        ),
                        showEditIcon: true,
                      ),
                      DataCell(
                          TextFormField( 
                            initialValue: element['mean'] ?? "",
                            keyboardType: TextInputType.text,
                          ),
                          showEditIcon: true),
                      DataCell(Text(element['level'] ?? "")),
                      DataCell(
                        FlatButton(
                          child: Text("Edit"),
                          
                          onPressed: () {
                             
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ),
                      DataCell(
                        FlatButton(
                          child: Text("Delete"),
                          onPressed: () {
                            xoa(element);
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ),
                    ])))
                .toList(),
          ),
        ),
         Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  // onPressed: onCreateCourse,
                  child: Text(
                    "Create",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
      ]),
    );
  }
  void xoa(Object x) async {
    setState(() {
      listOfColumns.remove(x);
    });
  }
  void addNewRow() {
    setState(() {
      listOfColumns.add({});
    });
  }

  void sua(Object x,Object y) {
   
  }
  void read() async{
    
  }
}
