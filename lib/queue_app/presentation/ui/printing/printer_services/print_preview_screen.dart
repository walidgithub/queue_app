import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:queue_app/queue_app/presentation/router/arguments.dart';
import '../../invoice/invoice_format/invoice_builder.dart';
import '../../invoice/invoice_format/invoice_model.dart';
import '../../invoice/invoice_generator.dart';

// ignore: must_be_immutable
class PrintPreviewScreen extends StatelessWidget {
  bool showGeneratedInvoice;
  PreviewData arguments;

  PrintPreviewScreen({super.key,
    this.showGeneratedInvoice=false, required this.arguments
  });

  ValueNotifier<Uint8List?> invoiceImage = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// invoice widget preview
            InvoiceBuilder(invoice: Invoice.fromMap(arguments.data)),

            const SizedBox(height: 20,),

            /// Generate invoice button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await InvoiceGenerator.generateInvoice(
                        context: arguments.context,
                        dataToPrint: arguments.data
                    );
                    invoiceImage.value = InvoiceGenerator.generatedInvoiceImage;
                  },
                  child: const Text('View Generated Invoice'),
                ),

                /// Print invoice button
                ElevatedButton(
                  onPressed: () async {
                    await InvoiceGenerator.createInvoiceAndPrint(
                        context: arguments.context,
                        data: arguments.data
                    );
                  },
                  child: const Text('Print Invoice'),
                ),
              ],
            ),

            ValueListenableBuilder(
                valueListenable: invoiceImage,
                builder: (BuildContext ctx, Uint8List? img, Widget? widget) {
                  if (img == null) return const Center(child: Text('No generated invoice available'),);
                  return Image.memory(img);
                }
            )
          ],
        ),
      ),
    );
  }
}
