import 'package:dash_chat/dash_chat.dart';
import 'package:motshelo_cash/models/user.dart';

class Group {

  final String uid;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  User member;
  

  Group({ this.uid, this.title, this.description ,this.startDate,this.endDate});

  Group.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        title = data['title'],
        description = data['desciption'],
        startDate = data['startDate'],
        endDate = data['endDate'],
        member = data['member']
  
;toJson() {
    return {
      'uid': uid,
      'tiltle': title,
      'description': description,
      'startDate': startDate,
      'endDate' : endDate,
      'member' : member,
    };
  }
  
}