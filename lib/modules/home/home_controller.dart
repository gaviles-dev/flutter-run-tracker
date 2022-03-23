
import 'package:f_run_tracker/constants/constants.dart';
import 'package:f_run_tracker/model/model_run_data.dart';
import 'package:f_run_tracker/modules/login/login_controller.dart';
import 'package:f_run_tracker/service/firebase_queries.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController distanceController = TextEditingController();
  final LoginController lc = Get.find();
  final FRunTrackerService dataSrc = FRunTrackerService();
  Rx<List<RunData>> runList = Rx<List<RunData>>();
  List<RunData> get todos => runList.value;
  var isRunDataFetched = false.obs;
  var isDataSet = false.obs;
  RunData run = RunData('',{});


  //Create New Run Entry
  create() async {
    run.title = titleController.text;
    run.desc = descController.text;
    run.distance = distanceController.text;
    run.dateCreated = DateTime.now();
    run.isArchived = false;
    try {
      await dataSrc.createRunEntry(lc.user.uid, run.setRunData());
    } finally {
      Get.back();
      Get.snackbar("Success", "Entry added successfully", backgroundColor: ConfigTheme.textLight);
      runList.bindStream(dataSrc.streamRunEntries(lc.user.uid));
      clear();
    } 
  }

  //Read Run Entry List
  fetchList() async {
    try{
      print('here');
      isRunDataFetched(false);
      runList.value = await dataSrc.getRunList(lc.user.uid);
      print(runList.value[0].id);
      print(runList.value[0].title);
      // runList.bindStream(FRunTrackerService().streamRunEntries(lc.user.uid));
    }finally{
      print('finally');
      isRunDataFetched(true);
    }
  }

  //Update Run Entry
  Future<void> edit(RunData runData) async {
    runData.title = titleController.text;
    runData.desc = descController.text;
    runData.distance = distanceController.text;
    try{
      await dataSrc.updateRunEntry(lc.user.uid, runData.id, runData.setRunData());
    }finally{
      Get.back();
      Get.snackbar("Success", "Entry updated successfully", backgroundColor: ConfigTheme.textLight);
      isDataSet(false);
      clear();
    }
  }

  //Delete Run Entry
  Future<void> delete(isDeleting, String recordId) async {
    if(isDeleting){
      try{
        await dataSrc.deleteRunEntry(lc.user.uid, recordId);
      }finally{
        Get.back();
        Get.snackbar("Success", "Entry deleted successfully", backgroundColor: ConfigTheme.textLight);
      }
    }
    
  }
   //set data 
  setEditData(RunData runData){
    titleController.text = runData.title;
    descController.text = runData.desc;
    distanceController.text = runData.distance;
    isDataSet(true);
    print(isDataSet.value);
  }

  //dispose data 
  clear(){
    titleController.text = "";
    descController.text = "";
    distanceController.text = "";
  }


 @override
   void onInit() {
    super.onInit();
    fetchList();
    runList.bindStream(FRunTrackerService().streamRunEntries(lc.user.uid));
   }
}