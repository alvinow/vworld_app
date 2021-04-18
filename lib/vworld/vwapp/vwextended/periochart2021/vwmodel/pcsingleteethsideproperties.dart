import 'package:vworld_app/vworld/vwcore/vwmodel/vwdocumentcontent.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'pcsingleteethsideproperties.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()

class PcSingleTeethSideProperties  {
  PcSingleTeethSideProperties(
      {this.teethNumber,
      this.teethSide,
      this.furcationLevelPointA: 0,
        this.furcationLevelPointB: 0,
      this.isBleedingOnProbingPointA: 0,
      this.isBleedingOnProbingPointB: 0,
      this.isBleedingOnProbingPointC: 0,
      this.isPlaquePointA: 0,
      this.isPlaquePointB: 0,
      this.isPlaquePointC: 0,
      this.gingivalMarginPointA: 0,
      this.gingivalMarginPointB: 0,
      this.gingivalMarginPointC: 0,
      this.probingDepthPointA: 0,
      this.probingDepthPointB: 0,
      this.probingDepthPointC: 0});

  static final String pcSingleTeethSideLingualFMS = 'PcSingleTeethSideLingual';
  static final String pcSingleTeethSideBuccalFMS = 'PcSingleTeethSideBuccal';

  @HiveField(0)
  String teethNumber;

  @HiveField(1)
  String teethSide;

  @HiveField(2)
  int furcationLevelPointA;

  @HiveField(3)
  int furcationLevelPointB;

  @HiveField(4)
  int isBleedingOnProbingPointA;

  @HiveField(5)
  int isBleedingOnProbingPointB;

  @HiveField(6)
  int isBleedingOnProbingPointC;

  @HiveField(7)
  int isPlaquePointA;

  @HiveField(8)
  int isPlaquePointB;

  @HiveField(9)
  int isPlaquePointC;

  @HiveField(10)
  int gingivalMarginPointA;

  @HiveField(11)
  int gingivalMarginPointB;

  @HiveField(12)
  int gingivalMarginPointC;

  @HiveField(13)
  int probingDepthPointA;

  @HiveField(14)
  int probingDepthPointB;

  @HiveField(15)
  int probingDepthPointC;

  static final String teethNumberCCFN = 'teethNumber';
  static final String teethSideCCFN = 'teethSide';
  static final String furcationLevelPointACCFN = 'furcationLevelPointA';
  static final String furcationLevelPointBCCFN = 'furcationLevelPointB';
  static final String isBleedingOnProbingPointACCFN =
      ' isBleedingOnProbingPointA';
  static final String isBleedingOnProbingPointBCCFN =
      'isBleedingOnProbingPointB';
  static final String isBleedingOnProbingPointCCCFN =
      'isBleedingOnProbingPointC';
  static final String isPlaquePointACCFN = 'isPlaquePointA';
  static final String isPlaquePointBCCFN = 'isPlaquePointB';
  static final String isPlaquePointCCCFN = 'isPlaquePointC';
  static final String gingivalMarginPointACCFN = 'gingivalMarginPointA';
  static final String gingivalMarginPointBCCFN = 'gingivalMarginPointB';
  static final String gingivalMarginPointCCCFN = 'gingivalMarginPointC';
  static final String probingDepthPointACCFN = 'probingDepthPointA';
  static final String probingDepthPointBCCFN = 'probingDepthPointB';
  static final String probingDepthPointCCCFN = 'probingDepthPointC';


  String getDocumenttypeId() {
    return VwDocumentContent.documenttypeIdUnknown;
  }

  factory PcSingleTeethSideProperties.fromJson(Map<String, dynamic> json) =>
      _$PcSingleTeethSidePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$PcSingleTeethSidePropertiesToJson(this);

  /*
  @override
  Map<String, dynamic> toJson() {
    return {
      PcSingleTeethSideProperties.teethNumberCCFN: this.teethNumber,
      PcSingleTeethSideProperties.teethSideCCFN: this.teethSide,
      PcSingleTeethSideProperties.furcationLevelPointACCFN: this.furcationLevelPointA,
      PcSingleTeethSideProperties.furcationLevelPointBCCFN: this.furcationLevelPointB,
      PcSingleTeethSideProperties.isBleedingOnProbingPointACCFN:
          this.isBleedingOnProbingPointA,
      PcSingleTeethSideProperties.isBleedingOnProbingPointBCCFN:
          this.isBleedingOnProbingPointB,
      PcSingleTeethSideProperties.isBleedingOnProbingPointCCCFN:
          this.isBleedingOnProbingPointC,
      PcSingleTeethSideProperties.gingivalMarginPointACCFN:
          this.gingivalMarginPointA,
      PcSingleTeethSideProperties.gingivalMarginPointBCCFN:
          this.gingivalMarginPointB,
      PcSingleTeethSideProperties.gingivalMarginPointCCCFN:
          this.gingivalMarginPointC,
      PcSingleTeethSideProperties.probingDepthPointACCFN:
          this.probingDepthPointA,
      PcSingleTeethSideProperties.probingDepthPointBCCFN:
          this.probingDepthPointB,
      PcSingleTeethSideProperties.probingDepthPointCCCFN:
          this.probingDepthPointC
    };
  }

   */

  /*
  @override
  factory PcSingleTeethSideProperties.fromJson(Map<String, dynamic> data) =>
      PcSingleTeethSideProperties(
          teethNumber: data[PcSingleTeethSideProperties.teethNumberCCFN],
          teethSide: data[PcSingleTeethSideProperties.teethSideCCFN],
          furcationLevelPointA: data[PcSingleTeethSideProperties.furcationLevelPointACCFN],
          furcationLevelPointB: data[PcSingleTeethSideProperties.furcationLevelPointBCCFN],
          isBleedingOnProbingPointA:
              data[PcSingleTeethSideProperties.isBleedingOnProbingPointACCFN],
          isBleedingOnProbingPointB:
              data[PcSingleTeethSideProperties.isBleedingOnProbingPointBCCFN],
          isBleedingOnProbingPointC:
              data[PcSingleTeethSideProperties.isBleedingOnProbingPointCCCFN],
          isPlaquePointA: data[PcSingleTeethSideProperties.isPlaquePointACCFN],
          isPlaquePointB: data[PcSingleTeethSideProperties.isPlaquePointBCCFN],
          isPlaquePointC: data[PcSingleTeethSideProperties.isPlaquePointCCCFN],
          gingivalMarginPointA:
              data[PcSingleTeethSideProperties.gingivalMarginPointACCFN],
          gingivalMarginPointB:
              data[PcSingleTeethSideProperties.gingivalMarginPointBCCFN],
          gingivalMarginPointC:
              data[PcSingleTeethSideProperties.gingivalMarginPointCCCFN],
          probingDepthPointA:
              data[PcSingleTeethSideProperties.probingDepthPointACCFN],
          probingDepthPointB:
              data[PcSingleTeethSideProperties.probingDepthPointBCCFN],
          probingDepthPointC:
              data[PcSingleTeethSideProperties.probingDepthPointCCCFN]);*/
}
