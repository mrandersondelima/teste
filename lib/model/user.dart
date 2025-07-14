import 'package:hora_do_foco/model/task.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class User {

  User();

  late String username, name;
  late List<Task>? tasksList = List.empty();

  factory User.fromParse(ParseUser parseUser){
    var user = User();
    user.name = parseUser.get('username');
    user.tasksList = parseUser.get('tasksList');
    user.name = parseUser.get('name');
    return user;
  }
  
   
}
