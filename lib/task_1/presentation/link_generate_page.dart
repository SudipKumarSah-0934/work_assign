import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_assign/core/constants.dart';
import 'package:work_assign/task_1/data/url_create_model.dart';
import 'package:work_assign/task_1/presentation/qr_image_file.dart';
import 'package:work_assign/task_1/presentation/widgets/custom_button.dart';
import 'package:work_assign/task_1/presentation/widgets/custom_textfield.dart';

class LinkGeneratePage extends StatefulWidget {
  const LinkGeneratePage({super.key});

  @override
  State<LinkGeneratePage> createState() => _LinkGeneratePageState();
}

class _LinkGeneratePageState extends State<LinkGeneratePage> {
  String generatedLink = '';
  TextEditingController urlText= TextEditingController();
  final dio = Dio(); // With default `Options`.

    // Or create `Dio` with a `BaseOptions` instance.
    final options = BaseOptions(
      baseUrl:
          '$baseurl+create?api_token=$apiToken',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    );

  urlReponseHandling() async {
    final response = await dio.post(
      '$baseurl/create?api_token=$apiToken',
      data: {
        "url": urlText.text,
        "domain": domainName,
        "description": "string"
      },
      options: Options(
        headers: {
          'accept': 'application/json',
          "authorization":
              "Bearer $apiToken",
          "Content-Type": "application/json",
        },
      ),
      onSendProgress: (int sent, int total) {
        print('$sent $total');
      },
    );
    return UrlCreateModel.fromJson(response.data).data.url.toString();
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
                final link = await urlReponseHandling();
                if (link != null) {
                  setState(() {
                    generatedLink = link;
                  });
                }
              }
    ),
            generatedLink == ''
                ? const Text('No Qr code')
                : QrImage(generatedLink),
          ],
        ),
      ),
    );
  }
}
