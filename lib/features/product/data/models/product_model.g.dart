// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      localId: (json['localId'] as num?)?.toInt(),
      serverId: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      description: json['description'] as String,
      status: json['status'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      synced: json['synced'] as bool? ?? true,
      lastSyncedAt: json['lastSyncedAt'] == null
          ? null
          : DateTime.parse(json['lastSyncedAt'] as String),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'id': instance.serverId,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'status': instance.status,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'synced': instance.synced,
      'lastSyncedAt': instance.lastSyncedAt?.toIso8601String(),
    };
