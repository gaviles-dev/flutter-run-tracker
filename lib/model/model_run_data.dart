
import 'package:cloud_firestore/cloud_firestore.dart';

class RunData {
  String id;
  String title;
  String desc;
  String distance;
  DateTime dateCreated;
  bool isArchived = false;

  RunData(String docId, Map<String, dynamic> data){
    id = docId;
    title = data['title'] ?? '';
    desc = data['desc'] ?? '';
    distance = data['distance'] ?? '';
    if (data['dateCreated'] is DateTime) {
      this.dateCreated = data['dateCreated'];
    } else {
      if ((data['dateCreated'] as Timestamp) != null) {
        this.dateCreated = (data['dateCreated'] as Timestamp).toDate();
      }
    }
    isArchived = data['isArchived'] ?? false;                 
  }

  Map<String, dynamic> setRunData() {
    return{
      "dateCreated" : dateCreated, 
      "title" :  title,              
      "desc" : desc,             
      "distance" : distance,                       
      "isArchived" : isArchived,  
    };
  }
    
}