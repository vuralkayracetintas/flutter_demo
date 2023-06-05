import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;

  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      if (_username == 'user' && _password == '1234') {
        // Kullanıcı adı ve şifre doğruysa, bir sonraki sayfaya yönlendirin
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const Ana_sayfa()),
        // );
      } else {
        // Kullanıcı adı veya şifre yanlışsa, bir hata mesajı gösterin
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Kullanıcı adı veya şifre yanlış.'),
          ),
        );
      }
    }
  }

  final emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7454E1),
      body: Center(
        child: Stack(
          children: [
            ClipPath(
              clipper: CustomShape(),
              child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff9A82E9)),
            ),
            Positioned(
              //left: 200,
              top: 550,
              child: ClipPath(
                  clipper: CustomShape2(),
                  child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xff9A82E9))),
            ),
            // Image.asset(
            //   'assets/images/bg.jpeg',
            //   fit: BoxFit.cover,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image(image: AssetImage('assets/images/oua.png')),
                const CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 100,
                  //backgroundImage: AssetImage('assets/images/akademi.png')
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIconColor: Colors.deepPurpleAccent,
                                  suffixIconColor: Colors.deepPurpleAccent,
                                  prefixIcon: const Icon(Icons.mail_outline),
                                  border: const OutlineInputBorder(),
                                  labelText: 'E-Mail',
                                  hintText: 'E-Mail Adresinizi Giriniz',
                                  suffixIcon: emailController.text.isEmpty
                                      ? Container(width: 0)
                                      : IconButton(
                                          icon: const Icon(Icons.close),
                                          onPressed: () {
                                            emailController.clear();
                                          },
                                        ),
                                ),
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Lütfen bir kullanıcı adı girin.';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _username = value!,
                              ),
                              const SizedBox(height: 16.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIconColor: Colors.deepPurpleAccent,
                                  suffixIconColor: Colors.deepPurpleAccent,
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.start,
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  suffixIcon: onVisibilityIcon(),
                                  border: const OutlineInputBorder(),
                                  labelText: 'Sifre',
                                  hintText: 'Şifrenizi Giriniz',
                                  //errorText: "a",
                                  //suffix: onVisibilityIcon(),
                                  //prefix: onVisibilityIcon(),
                                ),
                                obscureText: _isSecure,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Lütfen bir şifre girin.';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _password = value!,
                              ),
                              const SizedBox(height: 16),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Şifremi Unuttum ',
                                    style: TextStyle(color: Colors.grey)),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff7454E1),
                                ),
                                onPressed: _submit,
                                child: const Text('Giriş Yap'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconButton onVisibilityIcon() {
    return IconButton(
      onPressed: _changeLoading,
      icon: AnimatedCrossFade(
          firstChild: const Icon(Icons.visibility_off_outlined),
          secondChild: const Icon(Icons.visibility_outlined),
          crossFadeState:
              _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 10)),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height);
    path.quadraticBezierTo(width * 0.6, height, width, height - 300);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// class CustomShape2 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     double height = size.height;
//     double width = size.width;
//     path.quadraticBezierTo(0, height * 0.5, 200, height * 0.8);
//     path.quadraticBezierTo(width / 2, height / 2, width / 2, height - 200);
//     path.quadraticBezierTo(width / 2, height, width - 200, height);
//     path.quadraticBezierTo(width, height, width, height - 200);
//     path.lineTo(width, 0);
//     path.lineTo(0, 0);
//     path.close();
//     // path.lineTo(0, 10);
//     // path.quadraticBezierTo(width * 0.6, height, width, height);
//     // path.lineTo(2030, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }

// class CustomShape2 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.addOval(Rect.fromCircle(
//         center: Offset(size.width / 2, size.height / 2),
//         radius: size.width / 2));
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

class CustomShape2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double height = size.height;
    double width = size.width;
    double controlPointX = width / 2;
    double controlPointY = height / 8;
    path.lineTo(0, height - 50);
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, height - 50);
    path.quadraticBezierTo(controlPointX, controlPointY, 0, height - 50);
    path.close();

    // path.moveTo(0, size.height / 2);
    // path.quadraticBezierTo(0, 0, size.width / 2, 0);
    // path.quadraticBezierTo(size.width, 0, size.width, size.height / 2);
    // path.quadraticBezierTo(
    //     size.width, size.height, size.width / 2, size.height);
    // path.quadraticBezierTo(0, size.height, 0, size.height / 2);
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
