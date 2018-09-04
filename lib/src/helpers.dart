part of '../udp.dart';

StreamController<PacketCarTelemtryData> carTelemtryDataStream = StreamController();
StreamController<PacketCarSetup> carSetupDataStream = StreamController();
StreamController<PacketCarStatus> carStatusDataStream = StreamController();
StreamController<PacketSessionInfo> sessionInfoStream = StreamController();

void startF1UDP(int port) async {
  print("Starting");
  await RawDatagramSocket.bind(InternetAddress.anyIPv4, port).then((RawDatagramSocket socket){
    socket.listen((RawSocketEvent e){
      Datagram datagram = socket.receive();
      ByteBuffer buffer = Uint8List.fromList(datagram.data).buffer;
      DKByteData data = DKByteData(buffer);
      PacketHeadder packetHeadder = PacketHeadder(data);

      if(packetHeadder.id == PacketId.CAR_TELEMTRY) {
        carTelemtryDataStream.add(PacketCarTelemtryData(data, packetHeadder));
      } else if(packetHeadder.id == PacketId.CAR_SETUPS){
        carSetupDataStream.add(PacketCarSetup(data, packetHeadder));
      } else if(packetHeadder.id == PacketId.CAR_STATUS) {
        carStatusDataStream.add(PacketCarStatus(data, packetHeadder));
      } else if(packetHeadder.id == PacketId.SESSION) {
        sessionInfoStream.add(PacketSessionInfo(data));
      }
    });
  });
}
