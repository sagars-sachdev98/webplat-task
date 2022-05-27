import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:webplat_task/controller/graph_tree.controller.dart';
import 'package:get/get.dart' as g;

class GraphView extends StatelessWidget {
  GraphView({Key? key}) : super(key: key);

  final GraphTreeController graphController = g.Get.put(GraphTreeController());

  final ExpanderPosition _expanderPosition = ExpanderPosition.start;
  final ExpanderType _expanderType = ExpanderType.plusMinus;
  final ExpanderModifier _expanderModifier = ExpanderModifier.squareOutlined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tree view hierarchy'),
        elevation: 0,
      ),
      body: g.GetBuilder<GraphTreeController>(initState: ((state) {
        graphController.loadData().then((value) {
          graphController.treeViewController = graphController
              .treeViewController!
              .loadMap(list: graphController.nodeData);
          graphController.update();
        });
      }), builder: (lc) {
        TreeViewTheme treeViewTheme = TreeViewTheme(
          expanderTheme: ExpanderThemeData(
              type: _expanderType,
              modifier: _expanderModifier,
              position: _expanderPosition,
              size: 16,
              color: Theme.of(context).colorScheme.primary),
          colorScheme: Theme.of(context).colorScheme,
        );
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: TreeView(
                            controller: graphController.treeViewController!,
                            allowParentSelect: false,
                            shrinkWrap: true,
                            supportParentDoubleTap: false,
                            nodeBuilder: (cont, nodes) {
                              var map = graphController.allNodeData
                                  .where(
                                      (element) => element['Id'] == nodes.key)
                                  .first;

                              return Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Card(
                                        color: getNodeColor(map, context),
                                        elevation: 6,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            map["Username"],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(
                                      "- ${nodes.label}",
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ))
                                  ],
                                ),
                              );
                            },
                            onExpansionChanged: (key, expanded) =>
                                _expandNode(key, expanded),
                            onNodeTap: (key) {
                              debugPrint('Selected: $key');

                              graphController.selectedNode = key;
                              graphController.treeViewController =
                                  graphController.treeViewController!
                                      .copyWith(selectedKey: key);
                              graphController.update();
                            },
                            theme: treeViewTheme,
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Color getNodeColor(Map<String, dynamic> map, BuildContext context) {
    if (map["PackageAmount"] != null || map["PackageAmount"] == 0) {
      if (map["PackageAmount"] > 0 &&
          map["TotalAchievedIncome"] < map["TotalExpectedIncome"]) {
        return Theme.of(context).colorScheme.secondary;
      } else if (map["PackageAmount"] > 0 &&
          map["TotalAchievedIncome"] >= map["TotalExpectedIncome"]) {
        return Theme.of(context).colorScheme.onInverseSurface;
      } else {
        return Theme.of(context).colorScheme.error;
      }
    } else {
      return Theme.of(context).colorScheme.error;
    }
  }

  _expandNode(String key, bool expanded) {
    String msg = '${expanded ? "Expanded" : "Collapsed"}: $key';
    debugPrint(msg);
    Node? node = graphController.treeViewController!.getNode(key);
    if (node != null) {
      List<Node> updated;

      updated = graphController.treeViewController!
          .updateNode(key, node.copyWith(expanded: expanded));

      graphController.treeViewController =
          graphController.treeViewController!.copyWith(children: updated);

      graphController.update();
    }
  }
}
