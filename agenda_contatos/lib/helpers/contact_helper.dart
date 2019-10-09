import 'package:sqflite/sql.dart';

final String idColumn = "idColum";
final String nomeColumn = "nomeColumn";
final String emailColumn = "emailColumn";
final String phoneColumn = "phoneColumn";
final String imgColumn = "imgColumn";

class ContactHelper {}

class Contact {
  int id;
  String nome;
  String email;
  String phone;
  String img;

  Contact.fromMap(Map map) {
    id = map[idColumn];
    nome = map[nomeColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nomeColumn: nome,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img
    };

    if(id != null){
      id = map[idColumn];
    }
  }

  @override
  String toString() {
    return "Contact(id: $id, name: $nome, email: $email, phone: $phone, img: $img)";
  }


}
