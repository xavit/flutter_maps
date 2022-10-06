part of 'gps_bloc.dart';

abstract class GpsEvent extends Equatable {
  const GpsEvent();

  @override
  List<Object> get props => [];
}

class GpsAndPermissionEnvent extends GpsEvent {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  const GpsAndPermissionEnvent({
    required this.isGpsEnabled,
    required this.isGpsPermissionGranted,
  });

  @override
  List<Object> get props => [isGpsEnabled, isGpsPermissionGranted];

  @override
  String toString() =>
      'GpsAndPermissionEnvent { isGpsEnabled: $isGpsEnabled, isGpsPermissionGranted: $isGpsPermissionGranted }';
}
