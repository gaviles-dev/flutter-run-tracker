import 'package:f_run_tracker/components/app_bottom_nav.dart';
import 'package:f_run_tracker/components/app_button.dart';
import 'package:f_run_tracker/components/app_card.dart';
import 'package:f_run_tracker/components/app_dialog_form.dart';
import 'package:f_run_tracker/components/app_header.dart';
import 'package:f_run_tracker/constants/constants.dart';
import 'package:f_run_tracker/modules/home/home_controller.dart';
import 'package:f_run_tracker/modules/login/login_controller.dart';
import 'package:f_run_tracker/modules/login/login_screen.dart';
import 'package:f_run_tracker/utils/text_formatters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({ Key key }) : super(key: key);

  final CustomDialog cd = CustomDialog();
  final LoginController lc = Get.find();
  final HomeController hc = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ConfigTheme.textLight,
        actions: [
          GestureDetector(
            onTap: () => cd.customDialogConfirmation(
              title: "Logout",
              subtitle: "Are you sure you want to logout?",
              onConfirm: lc.signOut()
            ),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(Icons.logout, color: ConfigTheme.disableDark,)))
        ],
      ),
      backgroundColor: ConfigTheme.textLight,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ScreenHeader(color: ConfigTheme.primary,),
            Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Obx((){
              switch(hc.isRunDataFetched.value){
                case true:
                  return ListView.builder(
                  itemCount: hc.runList.value.length,
                  itemBuilder: (context, i){
                    return Obx(() => CustomCard(
                      date: ConfigFormatter.dateWithTime(hc.runList.value[i].dateCreated),
                      distance: hc.runList.value[i].distance + ' km',
                      title: hc.runList.value[i].title,
                      desc: hc.runList.value[i].desc,
                      onTapEdit: () {      
                        hc.setEditData(hc.runList.value[i]); 
                        if(hc.isDataSet.value){
                          cd.customDialogForm(
                            title: ConfigString.dialog_form_header_edit,
                            c1: hc.titleController,
                            c2:hc.descController,
                            c3: hc.distanceController,
                            onTap:() => hc.edit(hc.runList.value[i]),
                          );
                        }
                      },
                      onTapDelete: () => cd.customDialogConfirmation(
                        title: 'Delete Entry',
                        subtitle: 'Are you sure you want to delete this entry?',
                        onConfirm: () => hc.delete(true, hc.runList.value[i].id),
                        onCancel: () => Get.back()
                      ),
                    ));
                  }
                );
                case false:
                return Center(child: CircularProgressIndicator());

                default:
                return Center(child: Text('Add Run Record'));
              }
              
            })
          ),
          ],
        ),
      ),
      bottomNavigationBar: ScreenBottomNav(
        color: ConfigTheme.primary,
        child: CustomButton(
          label: ConfigString.home_button,
          labelcolor: ConfigTheme.primary,
          onTap: () => cd.customDialogForm(
             title: ConfigString.dialog_form_header,
             c1: hc.titleController,
             c2: hc.descController,
             c3: hc.distanceController,
             onTap:() => hc.create(),
          ) 
        ),
      ),
    );
  }
}