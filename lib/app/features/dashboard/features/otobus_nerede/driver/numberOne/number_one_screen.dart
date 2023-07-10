import 'dart:async';

import 'package:amasyaappdriver/app/features/auth/features/login/ui/login_form.dart';
import 'package:amasyaappdriver/app/ui/widgets/location_service_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class NumberOneScreen extends StatefulWidget {
  const NumberOneScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _NumberOneScreenState createState() => _NumberOneScreenState();
}

class _NumberOneScreenState extends State<NumberOneScreen> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
  @override
  void initState() {
    super.initState();
    // location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      LocationServiceButton(
          onPressed: () {
            setState(() {});
            _listenLocation1();
          },
          title: "Sefere Başlıyorum Konumumu Paylaş",
          description: "1 numaralı otobüsle yaptığınız  seferin konum bilgisi bütün kullanıcılarla paylaşılacaktır."),
      const Divider(),
      LocationServiceButton(
          onPressed: () {
            _stopListening1();
          },
          title: "Seferi Tamamladım ve ya Sefere Devam Edemiyorum Konum Paylaşımını Durdur",
          description: "Yalnızca seferi tamamladıysanız ve ya sefere devam edemiyorsanız konum paylaşımını durdurun."),
      const Divider(),
      if (_locationSubscription != null)
        Expanded(
            child: Center(
          child: Text(
            "1 NUMARALI OTOBÜS OLARAK KONUMUNUZ PAYLAŞILIYOR\n(Yolculuk bittiğinde kapatınız.)",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ))
    ]);
  }

  Future<void> _listenLocation1() async {
    _locationSubscription?.cancel();
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      debugPrint(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('users').doc(deneme).set({
        //users1 yerine giris yapan kullanicinin kullanici adini alacak
        'numara1KonumLatitude': currentlocation.latitude,
        'numara1KonumLongitude': currentlocation.longitude,
        'isActiveLocationNumara1': true
      }, SetOptions(merge: true));
    });
  }

  _stopListening1() async {
    await FirebaseFirestore.instance.collection('users').doc(deneme).set({
      'isActiveLocationNumara1': false,
    }, SetOptions(merge: true));
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  // ignore: unused_element
  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      debugPrint('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
