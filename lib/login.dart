import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:utag_mobile/common/styles.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          //  padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Positioned.fill(
                child: Container(
                  child: WaveWidget(
                    config: CustomConfig(
                      gradients: [
                        [
                          CommonStyles.primaryColor,
                          CommonStyles.secondaryColor
                        ],
                        [CommonStyles.secondaryColor, Colors.indigo[200]],
                        [CommonStyles.secondaryColor, Colors.white],
                        [Colors.white, Colors.white12]
                      ],
                      durations: [35000, 19440, 10800, 6000],
                      heightPercentages: [0.20, 0.23, 0.25, 0.30],
                      blur: MaskFilter.blur(BlurStyle.solid, 10.0),
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                    ),
                    backgroundColor: CommonStyles.secondaryColor,
                    size: Size(double.infinity, double.infinity),
                    waveAmplitude: 0,
                  ),
                ),
                top: MediaQuery.of(context).size.height / 4 * (-1)),
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  alignment: Alignment.center,
                  child: Text(
                    'UTag',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        //  SizedBox(height: 200),
                        Column(
                          children: <Widget>[
                            TextFormField(
                                controller: _usernameController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                ))
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Column(
                          children: <Widget>[
                            TextFormField(
                                controller: _passwordController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 8) {
                                    return 'Your password must have at least 8 characters';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                ))
                          ],
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: Text('CANCEL'),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              onPressed: () {
                                _usernameController.clear();
                                _passwordController.clear();
                              },
                            ),
                            GradientButton(
                              child: Text('LOGIN'),
                              callback: () {
                                if (_formKey.currentState.validate()) {
                                  Navigator.pop(context);
                                }
                              },
                              gradient: CommonStyles.primaryGradient,
                            ),
                          ],
                        ),
                      ],
                    )),
)
                            ],
            )
          ],
        ),
      ),
    );
  }
}
