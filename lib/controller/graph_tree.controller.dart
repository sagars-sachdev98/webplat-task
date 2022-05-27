import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:get/get.dart';
import 'package:webplat_task/common/file_helper.dart';
import 'package:webplat_task/model/user_node.model.dart';

class GraphTreeController extends GetxController {
  List _dataJson = [];
  List<Map<String, dynamic>> nodeData = [];
  List<Map<String, dynamic>> allNodeData = [];
  List<UserNode> userNodes = [];
  TreeViewController? treeViewController = TreeViewController(
    children: [],
    selectedKey: null,
  );
  String? selectedNode;

  Future<void> loadData() async {
    _dataJson = await FileHelper.readDataFrom("data/user_node.data.json");
    for (var map in _dataJson) {
      UserNode userNode = UserNode.fromJson(map);
      nodeData.add(
        {
          "label": userNode.name,
          "key": userNode.id,
          "selectedIconColor": "red",
          "children": userNode.children!.isEmpty
              ? []
              : userNode.children!
                  .map((e) => {
                        "label": e.name,
                        "key": e.id,
                        "children": e.children!.isEmpty
                            ? []
                            : e.children!
                                .map((el) => {
                                      "label": el.name,
                                      "key": el.id,
                                      "children": el.children!.isEmpty
                                          ? []
                                          : el.children!
                                              .map((ele) => {
                                                    "label": ele.name,
                                                    "key": ele.id,
                                                    "children": ele
                                                            .children!.isEmpty
                                                        ? []
                                                        : ele.children!
                                                            .map((elem) => {
                                                                  "label":
                                                                      elem.name,
                                                                  "key":
                                                                      elem.id,
                                                                })
                                                            .toList()
                                                  })
                                              .toList()
                                    })
                                .toList()
                      })
                  .toList()
        },
      );
      allNodeData.add(userNode.toJson());

      for (var e in userNode.children!) {
        allNodeData.add(e.toJson());
        if (e.children!.isNotEmpty) {
          for (var el in e.children!) {
            allNodeData.add(el.toJson());
            if (el.children!.isNotEmpty) {
              for (var ele in el.children!) {
                allNodeData.add(ele.toJson());
                if (ele.children!.isNotEmpty) {
                  for (var elem in ele.children!) {
                    allNodeData.add(elem.toJson());
                  }
                }
              }
            }
          }
        }
      }
    }

    update();
    return;
  }
}
