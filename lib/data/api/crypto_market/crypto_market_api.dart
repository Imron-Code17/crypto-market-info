import 'dart:async';
import '../../../lib.dart';

abstract class CryptoMarketApi {
  Future<SocketResponse<Stream<CryptoData>>> getCryptoWatchlist();
  Future<SocketResponse<Stream<CryptoData>>> getCryptoCurrentPrice(
      String symbol);
  Future<SocketResponse<bool>> unsubscribe(String symbols);
}

class CryptoMarketApiImpl implements CryptoMarketApi {
  final WebSocketService webSocketClient;

  CryptoMarketApiImpl(this.webSocketClient);

  @override
  Future<SocketResponse<Stream<CryptoData>>> getCryptoWatchlist() async {
    try {
      final controller = StreamController<CryptoData>.broadcast();
      await webSocketClient.subscribe(symbols: 'BTC-USD,ETH-USD');
      webSocketClient.listenData(onData: (data) {
        final cryptoData = CryptoData.fromJson(data);
        controller.add(cryptoData);
      });

      return SocketResponse<Stream<CryptoData>>(
        success: true,
        message: 'Success',
        data: controller.stream,
      );
    } catch (error) {
      return SocketResponse<Stream<CryptoData>>(
        success: false,
        message: 'Failed to fetch data: $error',
        data: null,
      );
    }
  }

  @override
  Future<SocketResponse<Stream<CryptoData>>> getCryptoCurrentPrice(
      String symbol) async {
    try {
      final controller = StreamController<CryptoData>.broadcast();
      await webSocketClient.subscribe(symbols: symbol);
      webSocketClient.listenData(onData: (data) {
        final cryptoData = CryptoData.fromJson(data);
        controller.add(cryptoData);
      });

      return SocketResponse<Stream<CryptoData>>(
        success: true,
        message: 'Success',
        data: controller.stream,
      );
    } catch (error) {
      return SocketResponse<Stream<CryptoData>>(
        success: false,
        message: 'Failed to fetch data: $error',
        data: null,
      );
    }
  }

  @override
  Future<SocketResponse<bool>> unsubscribe(String symbols) async {
    try {
      await webSocketClient.unsubscribe(symbols: symbols);
      return const SocketResponse<bool>(
        success: true,
        message: 'Success',
        data: true,
      );
    } catch (error) {
      return SocketResponse<bool>(
        success: false,
        message: 'Failed to unsubscribe: $error',
        data: false,
      );
    }
  }
}
