import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_shimmer_card.g.dart';

/// [DynamicShimmerCard] : A dynamic widget that extends [DynamicCard] and adds a shimmer effect.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicShimmerCard extends DynamicCard {
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shimmerBaseColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shimmerHighlightColor;
  bool shimmerEnabled;

  DynamicShimmerCard({
    String? key,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.shimmerEnabled = true,
    super.child,
    super.borderRadius,
    super.height,
    super.width
  }) : super(
    key: key ?? "",
  );

  factory DynamicShimmerCard.fromJson(Map<String, dynamic> json) =>
      _$DynamicShimmerCardFromJson(json);

  @override
  Widget build(BuildContext context) {
    Widget cardContent = super.build(context);

    return cardContent = Shimmer.fromColors(
      baseColor: shimmerBaseColor ?? Colors.grey[300]!,
      highlightColor: shimmerHighlightColor ?? Colors.grey[100]!,
      child: cardContent,
    );;
  }

  @override
  List<DynamicWidget>? get childWidgets => child != null ? [child!] : [];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}
}
