part of '../../udp.dart';

class CarTelemtryData {
  int speed;
  int throttle;
  int steering;
  int breaking;
  int clutch;
  int gear;
  int engineRMP;
  int drs;
  int revLightsPercentage;
  List<int> brakeTemperature = List(4);
  List<int> tyreSurfaceTemprature = List(4);
  List<int> tyresInnerTemprature = List(4);
  int engineTemprature;
  List<double> tyrePresure = List(4);

  CarTelemtryData(DKByteData data) {
    this.speed = data.nextUint16();
    this.throttle = data.nextUint8();
    this.steering = data.nextInt8();
    this.breaking = data.nextUint8();
    this.clutch = data.nextUint8();
    this.gear = data.nextInt8();
    this.engineRMP = data.nextUint16();
    this.drs = data.nextUint8();
    this.revLightsPercentage = data.nextUint8();

    for(int i = 0; i < 4; i++) {
      this.brakeTemperature[i] = data.nextUint16();
    }
    for(int i = 0; i < 4; i++) {
      this.tyreSurfaceTemprature[i] = data.nextUint16();
    }
    for(int i = 0; i < 4; i++) {
      this.tyresInnerTemprature[i] = data.nextUint16();
    }

    this.engineTemprature = data.nextUint16();

    for(int i = 0; i < 4; i++) {
      this.tyrePresure[i] = data.nextFloat();
    }
  }
}