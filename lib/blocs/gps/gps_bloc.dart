import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

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

  Future<void> askGpsAcces() async {
    final status = await Permission.location.request();

    final isGpsPermissionGranted = (status.isGranted) ? true : false;

    switch (status) {
      case PermissionStatus.granted:
        add(GpsAndPermissionEnvent(
            isGpsEnabled: state.isGpsEnabled, isGpsPermissionGranted: true));
        break;
      case PermissionStatus.denied:
        print("PermissionStatus.denied");
        break;

      case PermissionStatus.limited:
        print("PermissionStatus.limited");
        break;
      case PermissionStatus.restricted:
        print("PermissionStatus.restricted");
        break;

      case PermissionStatus.permanentlyDenied:
        // TODO: Handle this case.
        break;
    }
  }

  @override
  Future<void> close() {
    gpsSubscription!.cancel();
    return super.close();
  }
}
