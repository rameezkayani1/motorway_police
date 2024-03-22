import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Uhad extends StatefulWidget {
  const Uhad({super.key});

  @override
  State<Uhad> createState() => _UhadState();
}

class _UhadState extends State<Uhad> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  late bool _isPDFLoaded;
  late bool _isConnected;
  @override
  void initState() {
    super.initState();
    _isPDFLoaded = false;
    _isConnected = true;
    _checkinternet();
  }

  Future<void> _checkinternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _isConnected = false;
        _isPDFLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: !_isConnected
          ? _buildNoInternetWidget()
          : Stack(
              children: [
                SfPdfViewer.network(
                  'https://firebasestorage.googleapis.com/v0/b/testperparationbook.appspot.com/o/5.%20Mid%20Events%20between%20Uhad%20and%20Khandaq-converted.pdf?alt=media&token=4467aa0e-7868-4b74-b51d-7bb0dd54111d',
                  key: _pdfViewerKey,
                  onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                    setState(() {
                      _isPDFLoaded = true;
                    });
                  },
                ),
                if (!_isPDFLoaded)
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
    ));
  }

  Widget _buildNoInternetWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            size: 80,
            color: Colors.grey[500],
          ),
          SizedBox(height: 20),
          Text(
            'No internet connection!',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _checkinternet(); // Check internet connection again
            },
            child: Text('Try Again',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
