part of '../../udp.dart';

class MarshalZone{
  double zoneStart;
  int zoneFlag;

  MarshalZone(DKByteData data){
    zoneStart = data.nextFloat();
    zoneFlag = data.nextInt8();
  }
}