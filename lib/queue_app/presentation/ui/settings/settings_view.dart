import 'package:flutter/material.dart';
import 'package:queue_app/queue_app/presentation/ui/settings/printer_services/print_preview_screen.dart';
import 'package:queue_app/queue_app/presentation/ui/settings/printer_services/printer_setting_screen.dart';

import 'invoices/food_and_drink_invoice/invoice_data.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final data = InvoiceData.localInvoiceData();
  bool showPreview = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              PrinterSettingScreen(data: data),
              ElevatedButton(
                onPressed: () {
                  showPreview = true;
                  setState(() {});
                },
                child: const Text('Invoice Preview'),
              ),
              showPreview
                  ? PrintPreviewScreen(
                      data: data,
                      showGeneratedInvoice: true,
                      mainContext: context,
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
