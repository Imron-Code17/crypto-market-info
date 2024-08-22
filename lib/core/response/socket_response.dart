import 'package:equatable/equatable.dart';

class SocketResponse<T> extends Equatable {
  final bool success;
  final String message;
  final T? data;

  const SocketResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [success, message, data.runtimeType];

  factory SocketResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJson) {
    final isSuccess = json.containsKey('s') && json['s'] != null;
    return SocketResponse(
      success: isSuccess,
      message: json['message'] ?? '',
      data: isSuccess ? fromJson(json) : null,
    );
  }
}
