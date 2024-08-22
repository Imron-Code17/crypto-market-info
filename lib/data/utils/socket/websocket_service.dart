import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late WebSocketChannel _channel;
  late StreamSubscription _subscription;

  WebSocketService() {
    init();
  }

  Future<void> init() async {
    final wsUrl =
        Uri.parse('wss://ws.eodhistoricaldata.com/ws/crypto?api_token=demo');

    bool initialized = false;
    await Future.doWhile(() async {
      try {
        _channel = WebSocketChannel.connect(wsUrl);

        await _channel.ready;
        _subscription = _channel.stream.listen(
          null,
          onDone: () async => await init(),
          onError: (_) async => await init(),
        );
        initialized = true;
      } catch (e) {
        initialized = false;
      }

      return !initialized;
    });
  }

  Future<void> subscribe({required String symbols}) async {
    final request = json.encode({
      "action": "subscribe",
      "symbols": symbols,
    });
    _channel.sink.add(request);
  }

  Future<void> unsubscribe({required String symbols}) async {
    final request = json.encode({
      "action": "unsubscribe",
      "symbols": symbols,
    });
    _channel.sink.add(request);
    clear();
  }

  Future<void> listenData({void Function(Map<String, dynamic>)? onData}) async {
    try {
      await _channel.ready;

      _subscription.onData((data) {
        Map<String, dynamic> dataCrypto = jsonDecode(data);
        if (onData != null) {
          onData(dataCrypto);
        }
      });
    } on SocketException catch (_) {
      await init();
    } on WebSocketChannelException catch (_) {
      await init();
    }
  }

  void clear() => _subscription.onData(null);
}
