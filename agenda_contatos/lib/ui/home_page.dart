import 'dart:io';

import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:agenda_contatos/ui/contact_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper =
      ContactHelper(); // Eu poderia instanciar esta classe mais de uma vez, mas por ser singleton ela aponta somente para um único objeto.

  List<Contact> contacts = new List();

  @override
  void initState() {
    super.initState();
    _getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          // Retorna Widget e posicao
          return _contactCard(context, index);
        },
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
          _showContactPage();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: contacts[index].img != null &&
                              contacts[index].img.isNotEmpty
                          ? FileImage(File(contacts[index].img))
                          : AssetImage("images/user.png"),
                      repeat: ImageRepeat.noRepeat),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(contacts[index].name ?? "",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold)),
                    Text(contacts[index].email ?? "",
                        style: TextStyle(fontSize: 18.0)),
                    Text(contacts[index].phone ?? "",
                        style: TextStyle(fontSize: 18.0)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        _showOptions(context, index);
        //_showContactPage(contact: contacts[index]);
      },
    );
  }

  _showOptions(BuildContext context, int index) {
    showBottomSheet(
      backgroundColor: Colors.white,
        context: context,
        builder: (context){
          return BottomSheet(
              onClosing: (){},
              builder: (context){
                return Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FlatButton(
                        child: Text("Ligar",
                          style: TextStyle(color: Colors.orangeAccent, fontSize: 20.0),),
                        onPressed: (){},
                      ),
                      FlatButton(
                        child: Text("Ligar",
                          style: TextStyle(color: Colors.orangeAccent, fontSize: 20.0),),
                        onPressed: (){},
                      ),
                      FlatButton(
                        child: Text("Ligar",
                          style: TextStyle(color: Colors.orangeAccent, fontSize: 20.0),),
                        onPressed: (){},
                      ),
                    ],
                  ),
                );
              }
          );
        }
    );

  }

  void _showContactPage({Contact contact}) async {
    final reqContact = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactPage(contact: contact)));

    if (reqContact != null) {
      if (contact != null) {
        await helper.updateContact(reqContact);
      } else {
        await helper.saveContact(reqContact);
      }
      _getAllContacts();
    }
  }

  void _getAllContacts() {
    helper.getAllContacts().then((list) {
      setState(() {
        contacts = list;
      });
    });
  }
}
