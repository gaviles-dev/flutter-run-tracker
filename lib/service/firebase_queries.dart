
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_run_tracker/model/model_run_data.dart';
import 'package:uuid/uuid.dart';

class FRunTrackerService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  

  //Create New Run Entry
  Future createRunEntry(String uid, var dataToInsert) async {
    var submitted = false;

    try{
      var batch = _firestore.batch();
      final docId = Uuid().v4();
      batch.set(_firestore.collection('f_run_tracker/0001/User/$uid/RunData').doc(docId), dataToInsert);
      batch.commit().then((value) => submitted = true );
    } catch (e) {
      print(e.toString());
      rethrow;
    }
    return submitted;
  }

  //Read Run List
  Future<List<RunData>> getRunList(String uid) async {
    QuerySnapshot querySnapshot = await _firestore.collection('f_run_tracker/0001/User/$uid/RunData').orderBy("dateCreated", descending: true).get();
    List<RunData> queryList = [];
    querySnapshot.docs.forEach((element) {
      RunData runDataModel = RunData(element.id,element.data());
      queryList.add(runDataModel);
    });

    return queryList;
  }
  
  //Update Run Entry
   Future<dynamic> updateRunEntry(String uid, String docId, dataToUpdate) async {
    try{
      var batch = _firestore.batch();
      batch.update(_firestore.collection('f_run_tracker/0001/User/$uid/RunData').doc(docId), dataToUpdate);
      batch.commit().then((value) =>  print("Success update data"));
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  //Delete Run Entry
   Future<dynamic> deleteRunEntry(String uid, String docId) async{
    try{
      var batch = _firestore.batch();
      batch.delete(_firestore.collection('f_run_tracker/0001/User/$uid/RunData').doc(docId));
      batch.commit().then((value) =>  print("Success delete $uid $docId"));
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }



  //Stream Run Entry List
  Stream<List<RunData>> streamRunEntries(String uid) {
    return _firestore.collection('f_run_tracker/0001/User/$uid/RunData').orderBy("dateCreated", descending: true).snapshots().map((QuerySnapshot query) {
      List<RunData> queryList = [];
      query.docs.forEach((element) { 
        queryList.add(RunData(element.id, element.data())); 
      });
      return queryList;
    });
  }
}