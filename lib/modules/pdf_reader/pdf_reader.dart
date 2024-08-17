import 'package:flutter/material.dart';
import 'package:library_app/shared/styles/styles.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PdfReader extends StatefulWidget {
  final String path; 
  const PdfReader({ super.key, required this.path});

  @override
  _PdfReader createState() => _PdfReader();
}

class _PdfReader extends State<PdfReader> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        'https://c3ce-169-150-218-23.ngrok-free.app/storage/books/pdf/ij9aiIuURIaa3ZuA28DlR8bZBZiwOW3GICTzvsZO.pdf',
        key: _pdfViewerKey,
      ),
    );
  }
}