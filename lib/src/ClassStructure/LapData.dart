part of '../../udp.dart';

class LapData {
  PacketHeadder headder;
  double lastLapTime;
  double currentLapTime;
  double bestLapTime;
  double sectorOneTime;
  double sectorTwoTime;
  double lapDistance;
  double totalDistance;
  double safteyCarDelta;
  int carPosistion;
  int currentLapNumber;
  int pitStatus;
  int sector;
  int isCurrentLapInvalid;
  int penalties;
  int gridPosistion;
  int driverStatus;
  int resultStatus;

  LapData(DKByteData data){
    lastLapTime = data.nextFloat();
    currentLapTime = data.nextFloat();
    bestLapTime = data.nextFloat();
    sectorOneTime = data.nextFloat();
    sectorTwoTime = data.nextFloat();
    lapDistance = data.nextFloat();
    totalDistance = data.nextFloat();
    safteyCarDelta = data.nextFloat();
    carPosistion = data.nextUint8();
    currentLapNumber = data.nextUint8();
    pitStatus = data.nextUint8();
    sector = data.nextUint8();
    isCurrentLapInvalid = data.nextUint8();
    penalties = data.nextUint8();
    gridPosistion = data.nextUint8();
    driverStatus = data.nextUint8();
    resultStatus = data.nextUint8(); 
  }
}