import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class oneLinear extends StatefulWidget {
  @override
  _oneLinear createState() => _oneLinear();
}

class _oneLinear extends State<oneLinear> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          ' Test Perparation',
          style: TextStyle(
              color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.book,
              color: Colors.white,
              semanticLabel: 'Book',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        'https://drive.google.com/file/d/1ulcLbxUj_5D-yGiSbcSNEDRNiYPVZcE-/view',
        key: _pdfViewerKey,
      ),
    );
  }
}
