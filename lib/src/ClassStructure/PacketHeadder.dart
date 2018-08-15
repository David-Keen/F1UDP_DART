part of '../udp.dart';

class PacketHeadder {
  int format;
  int version;
  int id;
  int sessionUDID;
  double sessionTime;
  int frameId;
  int playerCarIndex;

  PacketHeadder(DKByteData data) {
    this.format = data.nextUint16();
    this.version = data.nextUint8();
    this.id = data.nextUint8();
    this.sessionUDID = data.nextUint64();
    this.sessionTime = data.nextFloat();
    this.frameId = data.nextUint();
    this.playerCarIndex = data.nextUint8();
  }
}