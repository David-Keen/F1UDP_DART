part of '../../udp.dart';

class PacketSessionInfo{
  PacketHeadder headder;

  int weather;
  int trackTemprature;
  int airTemprature;
  int totalLaps;
  int trackLength;
  int sessionType;
  int trackID;
  int isModen;
  int sessionTimeLeft;
  int sessionDuration;
  int pitSpeedLimit;
  int isPaused;
  int isSpectating;
  int spectatorCarIndex;
  int sliProNativeSupport;
  int numberOfMarshalZones;
  List<MarshalZone> marshalZones;
  int saftyCarStatus;
  int isOnline;

  PacketSessionInfo(DKByteData data){
    weather = data.nextUint8();
    trackTemprature = data.nextInt8();
    airTemprature = data.nextInt8();
    totalLaps = data.nextUint8();
    trackLength = data.nextUint16();
    sessionType = data.nextUint8();
    trackID = data.nextInt8();
    isModen = data.nextUint8();
    sessionTimeLeft = data.nextUint16();
    sessionDuration = data.nextUint16();
    pitSpeedLimit = data.nextUint8();
    isPaused = data.nextUint8();
    isSpectating = data.nextUint8();
    spectatorCarIndex = data.nextUint8();
    sliProNativeSupport = data.nextUint8();
    numberOfMarshalZones = data.nextUint8();
    marshalZones = List<MarshalZone>(21);
    for(int i = 0; i < numberOfMarshalZones; i++){
      marshalZones[i] = MarshalZone(data);
    }
    saftyCarStatus = data.nextUint8();
    isOnline = data.nextUint8();
  }
}