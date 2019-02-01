part of '../../udp.dart';

class PacketCarStatus {
  PacketHeadder headder;
  List<CarStatus> carStatus = List(20);
  int buttonStatus;

  PacketCarStatus(DKByteData data,this.headder) {
    for(int i = 0; i < 20; i++) {
      carStatus[i] = CarStatus(data);
    }
    buttonStatus = data.nextUint8();
    // buttonStatus = data.nextUint();
  }
}