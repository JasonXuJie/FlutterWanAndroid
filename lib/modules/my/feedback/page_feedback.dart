import 'package:flutter/material.dart';
import 'package:Inke/widgets/app_bar.dart';
import 'package:Inke/widgets/text.dart';
import 'package:get/get.dart';
import 'package:Inke/modules/my/feedback/feedback_controller.dart';

class FeedBackPage extends GetView<FeedbackController> {
  final TextEditingController textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar.centerTitle('用户反馈'),
      body: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 10.0,
          children: <Widget>[
            Text('请将您的反馈填写下处，我们会及时收到'),
            TextField(
              decoration: InputDecoration(
                  hintText: '请填写此处',
                  hintStyle: TextStyle(color: const Color(0xFF808080)),
                  border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(10.0)))),
              maxLines: 6,
              maxLength: 150,
              controller: textController,
            ),
            ElevatedButton(
              child: Container(
                color: Colors.blue,
                height: 50.0,
                child: Center(
                  child: Text(
                    '提交',
                    style: TextStyles.whiteNormal14,
                  ),
                ),
              ),
              onPressed: () {
                controller.submit(textController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
