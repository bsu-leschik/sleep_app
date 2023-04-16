import 'package:flutter/material.dart';
import 'package:filter_list/filter_list.dart';
import 'package:sleep_app/class/data_type_list.dart';



class RememberList extends StatelessWidget {
  int current = 0;


  void openFilterDialog(context) async {
    
    await FilterListDialog.display<String>(context, 
    listData: [context.read<DataTypeList>().secondList[current].title],);
    

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}