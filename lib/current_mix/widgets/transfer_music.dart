import 'package:get/get.dart';

class SelectrdListController extends GetxController{
final _selectedList = List<String>.empty(growable: true).obs;
getSelectedList(List<String> list) => _selectedList.value = list;
// getSelectedList(List<String> list) => _selectedList.value = list;
}