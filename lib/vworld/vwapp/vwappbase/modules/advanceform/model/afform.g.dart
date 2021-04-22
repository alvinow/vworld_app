// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'afform.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AfFormAdapter extends TypeAdapter<AfForm> {
  @override
  final int typeId = 101;

  @override
  AfForm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AfForm(
      fieldFormList: (fields[0] as List)?.cast<AfFieldForm>(),
    );
  }

  @override
  void write(BinaryWriter writer, AfForm obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.fieldFormList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AfFormAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfForm _$AfFormFromJson(Map<String, dynamic> json) {
  return AfForm(
    fieldFormList: (json['fieldFormList'] as List)
        ?.map((e) =>
            e == null ? null : AfFieldForm.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AfFormToJson(AfForm instance) => <String, dynamic>{
      'fieldFormList': instance.fieldFormList,
    };
