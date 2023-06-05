import 'package:flutter/material.dart';

class Demo2Dart extends StatefulWidget {
  const Demo2Dart({super.key});

  @override
  State<Demo2Dart> createState() => _Demo2DartState();
}

class _Demo2DartState extends State<Demo2Dart> {
  List<Color> colors = [const Color(0xfffb9245), const Color(0xfff54e6b)];
  int _index = 0;
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
      body: SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,
        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: colors)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 100,
                ),
                Tab(context),
                _index == 0 ? Login(context) : LoginBursiyer(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget LoginBursiyer(BuildContext context) {
    return Card(
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
              Text(
                'Bursiyer Girisine Hos geldin',
              ),
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
                  floatingLabelAlignment: FloatingLabelAlignment.start,
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
    );
    
  }

  @override
  Widget Login(BuildContext context) {
    return Card(
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
              Text(
                'mezun Girisine Hos geldin',
              ),
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
                  floatingLabelAlignment: FloatingLabelAlignment.start,
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

  @override
  Widget Tab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: _index == 0 ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Mezun girisi',
                        style: TextStyle(
                            color: _index == 0 ? Colors.black : Colors.white,
                            fontSize: 18,
                            fontWeight: _index == 0
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _index = 0;
                  });
                },
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: _index == 1 ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Bursiyer girisi',
                        style: TextStyle(
                            color: _index == 1 ? Colors.black : Colors.white,
                            fontSize: 18,
                            fontWeight: _index == 1
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _index = 1;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
