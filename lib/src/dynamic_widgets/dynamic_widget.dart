import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_container/dy_container.dart';

///[DynamicWidget] : an abstract class that helps to create a dynamic widget from json.
@JsonSerializable(
  createToJson: false,
  createFactory: false,
)
abstract class DynamicWidget {
  @JsonKey(required: true)
  final String? key;

  @JsonKey(includeFromJson: false, includeToJson: false)
  DynamicWidget? parent;

  DynamicWidget({this.key, this.parent});

  ///helps to build in-built flutter widget.
  Widget build(BuildContext context);

  ///this factory constructor takes the json and creates a dynamic widget and its sub children.
  factory DynamicWidget.fromJson(Map<String, dynamic> json) {
    try {
      String type = json[Strings.type];
      DynamicWidgetHandler? dynamicWidgetHandler =
          DynamicWidgetHandlerRepo.getDynamicWidgetHandlerForType(type);
      if (dynamicWidgetHandler != null && json.containsKey(Strings.data)) {
        DynamicWidget widget = dynamicWidgetHandler(json[Strings.data]);
        List<DynamicWidget?>? children = widget.childWidgets;
        children?.forEach((element) {
          element?.parent = widget;
        });
        return widget;
      } else {
        debugPrint(
            'failed to create dynamic widget ${json[Strings.type]} ${json[Strings.data][Strings.key]}');
        return DynamicContainer(width: 0.0, showBorder: false);
      }
    } catch (e) {
      debugPrint(
          'failed to create dynamic widget  ${json[Strings.type]} ${json[Strings.data][Strings.key]}');
      return DynamicContainer(width: 0.0, showBorder: false);
    }
  }

  ///used to invoke methods in a dynamic widget
  FutureOr<dynamic> invokeMethod(
    String methodName, {
    Map<String, dynamic>? params,
  });

  List<DynamicWidget?>? get childWidgets;
}
