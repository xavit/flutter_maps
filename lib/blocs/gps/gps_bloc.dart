import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  StreamSubscription? gpsSubscription;

  GpsBloc()
      : super(const GpsState(
            isGpsEnabled: false, isGpsPermissionGranted: false)) {
    on<GpsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GpsAndPermissionEnvent>((event, emit) {
      emit(
        state.copyWith(
          isGpsEnabled: event.isGpsEnabled,
          isGpsPermissionGranted: event.isGpsPermissionGranted,
        ),
      );
    });

    _init();
  }

  Future<void> _init() async {
    final isGpsEnabled = await _checkGpsStatus();
    print('isGpsEnabled: $isGpsEnabled');

    add(
      GpsAndPermissionEnvent(
        isGpsEnabled: isGpsEnabled,
        isGpsPermissionGranted: state.isGpsPermissionGranted,
      ),
    );
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();

    gpsSubscription = Geolocator.getServiceStatusStream().listen((status) {
      final isGpsEnabled = (status.index == 1) ? true : false;
      print("service status: $isGpsEnabled");
      add(
        GpsAndPermissionEnvent(
          isGpsEnabled: isGpsEnabled,
          isGpsPermissionGranted: state.isGpsPermissionGranted,
        ),
      );
    });

    return isEnable;
  }

  @override
  Future<void> close() {
    gpsSubscription!.cancel();
    return super.close();
  }
}
