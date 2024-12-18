import 'dart:io';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:minelibs2/models/bookModel.dart';
import 'package:minelibs2/screens/services/savedBook.dart';
import 'package:pdfx/pdfx.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ReadBookScreen extends StatefulWidget {
  final BookModel book;
  const ReadBookScreen({super.key, required this.book});

  @override
  State<ReadBookScreen> createState() => _ReadBookScreenState();
}

class _ReadBookScreenState extends State<ReadBookScreen> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    _downloadFile(widget.book.bookLink);
  }

  Future<void> _downloadFile(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/temp.pdf');

    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      localPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: localPath == null
          ? Center(child: FluLoader())
          : PdfView(
              onPageChanged: (int page) async {
                print('page $page');
                await BookDatabase().updatePageRead(widget.book.id, page);
              },
              controller: PdfController(
                document: PdfDocument.openFile(localPath!),
              ),
            ),
    );
  }
}
