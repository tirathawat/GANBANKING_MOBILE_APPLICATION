import 'package:flutter/material.dart';
import 'package:ganbanking/apis/account_api.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/pages/transfer/second_transfering_page.dart';
import 'package:ganbanking/services/qr_scan_service.dart';
import 'package:ganbanking/widgets/custom_progress_indicator.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanPage extends StatefulWidget {
  final AccountAPI accountAPI = Get.find<AccountAPI>();
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;

  @override
  void reassemble() {
    super.reassemble();
    if (GetPlatform.isAndroid) {
      controller.pauseCamera();
    } else if (GetPlatform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      extendBodyBehindAppBar: true,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Stack(
      children: <Widget>[
        QRView(
          overlay: QrScannerOverlayShape(
            overlayColor: Color.fromRGBO(0, 0, 0, 80),
            borderLength: 0,
            borderWidth: 0,
            borderRadius: 20,
            cutOutSize: getScreenWidth(300),
          ),
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
        ),
        _buildScanFrame(),
      ],
    );
  }

  _buildScanFrame() {
    return Align(
        alignment: Alignment.center,
        child: Container(
          width: getScreenWidth(300),
          height: getScreenWidth(300),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: getScreenWidth(520),
                  height: getScreenWidth(520),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(width: 10, color: Colors.white),
                          top: BorderSide(width: 10, color: Colors.white)),
                    )),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(width: 10, color: Colors.white),
                    top: BorderSide(width: 10, color: Colors.white),
                  )),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 10, color: Colors.white),
                      bottom: BorderSide(width: 10, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 10, color: Colors.white),
                      bottom: BorderSide(width: 10, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 100,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        "QR SCAN",
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData != null) {
        controller.pauseCamera().then((value) async {
          await QrScanService.scan().then((value) async {
            if (value == null) {
              Get.snackbar("แจ้งเตือน", "เกิดข้อผิดพลาด");
            } else {
              Get.dialog(
                CustomProgressIndicator(),
                barrierDismissible: false,
              );
              await widget.accountAPI.getInfoByQrcode(value).then((value) {
                Get.back();
                if (value) {
                  Get.to(SecondTransferingPage());
                } else {
                  Get.snackbar("แจ้งเตือน", "Qrcode ไม่ถูกต้อง");
                }
              });
            }
          });
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
