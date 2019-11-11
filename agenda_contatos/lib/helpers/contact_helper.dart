import 'package:sqflite/sqflite.dart';

final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String phoneColumn = "phoneColumn";
final String emailColumn = "emailColumn";
final String imgColumn = "imgColumn";

class ContactHelper{

}

class Contact {

  int id;
  String name;
  String phone;
  String email;
  String img;

  Contact.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    phone = map[phoneColumn];
    email = map[emailColumn];
    img = map[imgColumn];
  } //Isso serve para quando o Map com os dados do contato for passado ele irá
    // definir os campos iguais ao da coluna do banco.
    // De um mapa(Json) e passou para o contato


  Map toMap(){

    Map<String, dynamic> map =  {
      nameColumn: name,
      phoneColumn: phone,
      emailColumn: email,
      imgColumn: img,
    };

   if(id != null){
     map[idColumn] = id;
   }

  }


}