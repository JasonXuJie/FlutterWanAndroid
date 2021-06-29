import 'package:Inke/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:Inke/util/image_util.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:get/get.dart';
import 'package:Inke/widgets/app_bar.dart';


class LoginPage extends GetView<LoginController> {

  final TextEditingController _phoneController = TextEditingController(text: '');
  final TextEditingController _pwdController = TextEditingController(text: '');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,///防止部件被键盘遮挡
        appBar: TopBar.centerTitle('登陆'),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
          child: Column(
            children: <Widget>[
              loadAssetImage('app_icon',width: 80.0,height: 80.0),
              Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Theme(
                    data: ThemeData(primaryColor: Colors.black, hintColor: Colors.black),
                    child:_buildEdit(Icons.phone, '请输入账号', TextInputType.phone, false, _phoneController),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child:_buildEdit(Icons.lock, '请输入密码',  TextInputType.text, true, _pwdController),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 15.0),
                child: ElevatedButton(
                    child: Container(
                        height: 50.0,
                        color: Colors.blue,
                        child: Center(
                          child: Text('登陆',style: TextStyles.whiteNormal18,),
                        )),
                    onPressed: ()=>controller.login(_phoneController.text, _pwdController.text)),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 2.0, color: Colors.blue)
                      ),
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text( '注册', style: TextStyles.blueNormal18,
                          ),
                        ),
                      ),
                      onPressed: () => NavigatorUtil.push(Routes.register)
                  )),
              Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(text: '注册即表示同意',style:TextStyles.blackNormal14,
                          children: <TextSpan>[
                            TextSpan(text: '用户协议',style:TextStyles.blueNormal14,)
                          ]),
                    ),
                  ),),
            ],
          ),
        ));
  }



  TextField _buildEdit(IconData icon,String hint,TextInputType type,bool obscure,TextEditingController controller){
    return TextField(
      style: TextStyles.blackNormal18,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          hintStyle: TextStyles.greyNormal18,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                width: 1.0,
              ))),
      keyboardType: type,
      controller: controller,
      obscureText: obscure,
      maxLines: 1,
      autofocus: false,
    );
  }


}
