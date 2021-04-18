// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeetingAdapter extends TypeAdapter<Meeting> {
  @override
  final int typeId = 50002;

  @override
  Meeting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meeting(
      meeting_id: fields[0] as String,
      meeting_meetingtype_id: fields[1] as String,
      meeting_meetingstatus_id: fields[2] as String,
      meeting_name: fields[3] as String,
      meeting_start_datetime: fields[4] as String,
      meeting_end_datetime: fields[5] as String,
      meeting_owner_actor_id: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Meeting obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.meeting_id)
      ..writeByte(1)
      ..write(obj.meeting_meetingtype_id)
      ..writeByte(2)
      ..write(obj.meeting_meetingstatus_id)
      ..writeByte(3)
      ..write(obj.meeting_name)
      ..writeByte(4)
      ..write(obj.meeting_start_datetime)
      ..writeByte(5)
      ..write(obj.meeting_end_datetime)
      ..writeByte(6)
      ..write(obj.meeting_owner_actor_id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeetingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meeting _$MeetingFromJson(Map<String, dynamic> json) {
  return Meeting(
    meeting_id: json['meeting_id'] as String,
    meeting_meetingtype_id: json['meeting_meetingtype_id'] as String,
    meeting_meetingstatus_id: json['meeting_meetingstatus_id'] as String,
    meeting_name: json['meeting_name'] as String,
    meeting_start_datetime: json['meeting_start_datetime'] as String,
    meeting_end_datetime: json['meeting_end_datetime'] as String,
    meeting_owner_actor_id: json['meeting_owner_actor_id'] as String,
  );
}

Map<String, dynamic> _$MeetingToJson(Meeting instance) => <String, dynamic>{
      'meeting_id': instance.meeting_id,
      'meeting_meetingtype_id': instance.meeting_meetingtype_id,
      'meeting_meetingstatus_id': instance.meeting_meetingstatus_id,
      'meeting_name': instance.meeting_name,
      'meeting_start_datetime': instance.meeting_start_datetime,
      'meeting_end_datetime': instance.meeting_end_datetime,
      'meeting_owner_actor_id': instance.meeting_owner_actor_id,
    };
