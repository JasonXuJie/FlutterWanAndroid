import 'package:Inke/modules/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/widgets/app_bar.dart';

class RegisterPage extends GetView<RegisterController> {
  final TextEditingController _phoneController =
      TextEditingController(text: '');
  final TextEditingController _pwdController = TextEditingController(text: '');
  final TextEditingController _repwdController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar.centerTitle('注册'),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
              child:_buildTextField(_phoneController, '请输入账号', TextInputType.text,false),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
              child:_buildTextField(_pwdController, '请输入密码', TextInputType.text,true),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
              child:_buildTextField(_repwdController, '请确认密码', TextInputType.text,true),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: ElevatedButton(
                  child: Container(
                    height: 50.0,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        '确定',
                        style: TextStyles.whiteNormal14,
                      ),
                    ),
                  ),
                  onPressed: () {
                      controller.submit(_phoneController.text, _pwdController.text,_repwdController.text);
                  }),
            ),
          ],
        ));
  }

  Widget _buildTextField(TextEditingController controller,String hint,TextInputType type,bool obscure){
    return TextField(
      controller: controller,
      keyboardType: type,
      obscureText: obscure,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyles.greyNormal15),
    );
  }
}
