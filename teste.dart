// // REDE

// import 'package:flutter/material.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:esc_pos_flutter/esc_pos_flutter.dart';
// import 'package:esc_pos_flutter/esc_pos_flutter.dart';

// class NetworkPrinterPage extends StatefulWidget {
//   @override
//   _NetworkPrinterPageState createState() => _NetworkPrinterPageState();
// }

// class _NetworkPrinterPageState extends State<NetworkPrinterPage> {
//   @override
//   void initState() {
//     super.initState();
//     _print();
//   }

//   Future<void> _print() async {
//     final profile = await CapabilityProfile.load();
//     final printer = NetworkPrinter(PaperSize.mm80, profile);

//     // Substitua pelo endereço IP da impressora e pela porta
//     final printerIp = '192.168.0.100';
//     final printerPort = 9100;
//     final printerSocket = NetworkPrinterSocket(printerIp, printerPort);

//     try {
//       await printer.connect(printerSocket);

//       printer.text('Hello World!',
//           styles: PosStyles(
//             align: PosAlign.center,
//             height: PosTextSize.size2,
//             width: PosTextSize.size2,
//           ));

//       printer.cut();
//       await printer.disconnect();
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Network Printer')),
//       body: Center(
//         child: Text('Printing...'),
//       ),
//     );
//   }
// }

// // USB

// import 'package:flutter/material.dart';
// import 'package:usb_serial/usb_serial.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';

// class UsbPrinter extends StatefulWidget {
//   @override
//   _UsbPrinterState createState() => _UsbPrinterState();
// }

// class _UsbPrinterState extends State<UsbPrinter> {
//   UsbPort _port;
//   final UsbSerial _usbSerial = UsbSerial();

//   @override
//   void initState() {
//     super.initState();
//     _initUsb();
//   }

//   Future<void> _initUsb() async {
//     final ports = await _usbSerial.getDevices();
//     if (ports.isEmpty) {
//       print('No USB devices found');
//       return;
//     }

//     _port = await _usbSerial.createPort(ports.first);
//     if (_port != null) {
//       await _port.open();
//       await _port.setDTR(true);
//       await _port.setRTS(true);
//       _print();
//     }
//   }

//   Future<void> _print() async {
//     if (_port == null) return;

//     final profile = await CapabilityProfile.load();
//     final printer = NetworkPrinter(PaperSize.mm80, profile);
//     final printerUtils = EscPosUtils(printer);

//     // Comando ESC/POS para impressora
//     final commands = printerUtils.getCommands();

//     await _port.write(commands);
//     await _port.close();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('USB Printer')),
//       body: Center(
//         child: Text('Printing...'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PdfPrinterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PDF Printer')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Criação do documento PDF
            final pdf = pdfWidgets.Document();
            pdf.addPage(
              pdfWidgets.Page(
                build: (pdfWidgets.Context context) {
                  return pdfWidgets.Center(
                    child: pdfWidgets.Text('Hello World',
                        style: pdfWidgets.TextStyle(fontSize: 40)),
                  );
                },
              ),
            );

            // Criação de uma instância de PrintJob
            final pdfFile = pdf.save();

            // Imprimir o documento
            await Printing.layoutPdf(
              onLayout: (PdfPageFormat format) async => pdfFile,
            );
          },
          child: Text('Print PDF'),
        ),
      ),
    );
  }
}
