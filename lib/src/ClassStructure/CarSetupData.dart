part of '../../udp.dart';

class CarSetupData {
  int frontWing;
  int rearWing;
  
  int onThrottle;
  int offThrottle;

  double frontCamber;
  double rearCamber;
  
  double frontToe;
  double rearToe;

  int frontSuspension;
  int rearSuspension;

  int frontAntiRollBar;
  int rearAntiRollBar;

  int frontSuspensionHeight;
  int rearSuspensionHeight;

  int breakPresure;
  int breakBias;

  double frontTyrePresure;
  double rearTyrePresure;

  int ballast;

  double fuelLoad;

  CarSetupData(DKByteData data){
    frontWing = data.nextUint8();
    rearWing = data.nextUint8();

    onThrottle = data.nextUint8();
    offThrottle = data.nextUint8();

    frontCamber = data.nextFloat();
    rearCamber = data.nextFloat();
    
    frontToe = data.nextFloat();
    rearToe = data.nextFloat();

    frontSuspension = data.nextUint8();
    rearSuspension = data.nextUint8();

    frontAntiRollBar = data.nextUint8();
    rearAntiRollBar = data.nextUint8();

    frontSuspensionHeight = data.nextUint8();
    rearSuspensionHeight = data.nextUint8();

    breakPresure = data.nextUint8();
    breakBias = data.nextUint8();

    frontTyrePresure = data.nextFloat();
    rearTyrePresure = data.nextFloat();

    ballast = data.nextUint8();
    fuelLoad = data.nextFloat();
  }
}