import 'package:flutter/cupertino.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:device_info/device_info.dart';
import 'dart:async';
import 'dart:io';

class DeviceInfo {
  DeviceInfo({@required this.udid, @required this.reportDeviceInfo});

  String udid;

  ReportDeviceInfo reportDeviceInfo;

  Map<String, dynamic> toJson() =>
      {'udid': this.udid, 'reportDeviceInfo': this.reportDeviceInfo.toJson()};

  factory DeviceInfo.fromJson(Map<String, dynamic> data) => DeviceInfo(
      udid: data['udid'],
      reportDeviceInfo: ReportDeviceInfo.fromJson(data['reportDeviceInfo']));
}

class HelperReportDeviceInfo {
  static Future<String> getUdid() async {
    String returnValue;

    try {
      returnValue = await FlutterUdid.udid;
    } catch (error) {}

    return returnValue;
  }

  static Future<ReportDeviceInfo> getReportDeviceInfo() async {
    ReportDeviceInfo returnValue;
    String platform = "unknown";

    try {
      Map<String, dynamic> deviceReport;
      if (Platform.isAndroid) {
        platform = "android";
        deviceReport =
        await  HelperReportDeviceInfo.readAndroidBuildData(await DeviceInfoPlugin().androidInfo);
      } else if (Platform.isIOS) {
        platform = "ios";
        deviceReport =
        HelperReportDeviceInfo.readIosDeviceInfo(await DeviceInfoPlugin().iosInfo);
      }

      returnValue =
          ReportDeviceInfo(deviceType: platform, deviceReport: deviceReport);
    } catch (error) {}

    return returnValue;
  }

  static Map<String, dynamic> readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  static Future<Map<String, dynamic>> readAndroidBuildData(
      AndroidDeviceInfo build) async {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
    };
  }
}

class ReportDeviceInfo {
  final String deviceType;
  final Map<String, dynamic> deviceReport;

  ReportDeviceInfo(
      { this.deviceType = "unknown", @required this.deviceReport});

  Map<String, dynamic> toJson() =>
      {'deviceType': this.deviceType, 'deviceReport': this.deviceReport};

  factory ReportDeviceInfo.fromJson(Map<String, dynamic> data) =>
      ReportDeviceInfo(
          deviceType: data['deviceType'], deviceReport: data['deviceReport']);
}

class LoginRequestBody {
  final String username;
  final String password;
  //final DeviceInfo deviceInfo;

  static const String username_fieldName = 'username';
  static const password_fieldName = 'password';
  static const deviceInfo_fieldName = 'deviceInfo';

  LoginRequestBody(
      {@required this.username, @required this.password});

  Map<String, dynamic> toJson() => {
    username_fieldName: this.username,
    password_fieldName: this.password

  };

  factory LoginRequestBody.fromJson(Map<String, dynamic> data) =>
      LoginRequestBody(
        username: data[LoginRequestBody.username_fieldName],
        password: data[LoginRequestBody.password_fieldName],
      );
}
