// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_shimmer_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicShimmerRow _$DynamicShimmerRowFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicShimmerRow(
    key: json['key'] as String?,
    childItems: WidgetUtil.childrenFilter((json['childItems'] as List<dynamic>?)
        ?.map((e) => e == null
        ? null
        : DynamicWidget.fromJson(e as Map<String, dynamic>))
        .toList()),
    mainAxisAlignment:
        WidgetUtil.getMainAxisAlignment(json['mainAxisAlignment'] as String?),
    crossAxisAlignment:
        WidgetUtil.getCrossAxisAlignment(json['crossAxisAlignment'] as String?),
    itemCount: (json['itemCount'] as num?)?.toInt() ?? 5,
    interItemSpacing: (json['interItemSpacing'] as num?)?.toDouble() ?? 5,
    height: (json['height'] as num?)?.toDouble(),
    width: (json['width'] as num?)?.toDouble()
  );
}
