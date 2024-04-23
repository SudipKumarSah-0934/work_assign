import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_assign/task_1/data/url_create_model.dart';
import 'package:work_assign/task_1/presentation/qr_image_file.dart';
import 'package:work_assign/task_1/presentation/widgets/custom_button.dart';
import 'package:work_assign/task_1/presentation/widgets/custom_textfield.dart';

import '../../core/api_manager.dart';

class LinkGeneratePage extends StatefulWidget {
  const LinkGeneratePage({super.key});

  @override
  State<LinkGeneratePage> createState() => _LinkGeneratePageState();
}

class _LinkGeneratePageState extends State<LinkGeneratePage> {
  String generatedLink = '';
  TextEditingController urlText = TextEditingController();
  final _apiService = ApiManager.instance;

  urlResponseHandling() async {
    UrlCreateModel response = await _apiService.getUrl(urlText.text.toString());
    print(response);
    return response.data.url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task-1"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Column(
          children: [
            CustomTextField(
              controller: urlText,
            ),
            SizedBox(height: 10.sp),
            CustomButton(
                text: "Generate short links",
                onPressed: () async {
                  final link = await urlResponseHandling();
                  if (link != null) {
                    setState(() {
                      generatedLink = link;
                    });
                  }
                }),
            generatedLink == ''
                ? const Text('No Qr code')
                : QrImage(generatedLink),
          ],
        ),
      ),
    );
  }
}
