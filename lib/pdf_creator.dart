import 'package:pdf/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:printing/printing.dart';
class PDFGenerator{
  static createPdf(String txt)async{
    final output = await getTemporaryDirectory();
    Document pdf =Document();
    final file = File('${output.path}/HMA.pdf');
    pdf.addPage(createpage(txt));

    await file.writeAsBytes(await pdf.save());
    await Printing.sharePdf(bytes: await pdf.save(), filename: 'HMA.pdf');

  }
  static Page createpage(String text){
return Page(build: (context){
  return Container(
    child: Text(text)
  );
});
  }
}