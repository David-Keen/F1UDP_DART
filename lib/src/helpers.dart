part of '../udp.dart';

StreamController<PacketCarTelemtryData> _carTelemtryDataStream = StreamController();
StreamController<PacketCarSetup> _carSetupDataStream = StreamController();
StreamController<PacketCarStatus> _carStatusDataStream = StreamController();
StreamController<PacketSessionInfo> _sessionInfoStream = StreamController<PacketSessionInfo>();


Stream<PacketCarTelemtryData> carTelemtryStream = _carTelemtryDataStream.stream.asBroadcastStream();
Stream<PacketSessionInfo> sessionStream = _sessionInfoStream.stream.asBroadcastStream();
Stream<PacketCarSetup> carSetupDataStream = _carSetupDataStream.stream.asBroadcastStream();
Stream<PacketCarStatus> carStatusDataStream = _carStatusDataStream.stream.asBroadcastStream();
Stream<PacketSessionInfo> sessionInfoStream = _sessionInfoStream.stream.asBroadcastStream();

void startF1UDP(int port) async {
  await RawDatagramSocket.bind(InternetAddress.anyIPv4, port).then((RawDatagramSocket socket){
    socket.listen((RawSocketEvent e){
      Datagram datagram = socket.receive();
      ByteBuffer buffer = Uint8List.fromList(datagram.data).buffer;
      DKByteData data = DKByteData(buffer);
      PacketHeadder packetHeadder = PacketHeadder(data);

      if(packetHeadder.id == PacketId.CAR_TELEMTRY) {
        _carTelemtryDataStream.add(PacketCarTelemtryData(data, packetHeadder));
      } else if(packetHeadder.id == PacketId.CAR_SETUPS){
        _carSetupDataStream.add(PacketCarSetup(data, packetHeadder));
      } else if(packetHeadder.id == PacketId.CAR_STATUS) {
        _carStatusDataStream.add(PacketCarStatus(data, packetHeadder));
      } else if(packetHeadder.id == PacketId.SESSION) {
        _sessionInfoStream.add(PacketSessionInfo(data));
      }
    });
  });
}
