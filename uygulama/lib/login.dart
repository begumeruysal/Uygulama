import 'package:flutter/material.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GirisEkrani(),
    );
  }
}

class GirisEkrani extends StatefulWidget {
  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  String ad = '';
  String mail = '';
  String no = '';
  String sehir = '';
  String ilce = '';
  String mahalle = '';
  String sokak = '';
  bool _isSwitched = false;
  bool _showResult = false;
  String? _selectedUser = 'Bireysel'; // Varsayılan olarak Bireysel seçili
  bool _isDropdownError = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController adController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController noController = TextEditingController();
  TextEditingController sehirController = TextEditingController();
  TextEditingController ilceController = TextEditingController();
  TextEditingController mahalleController = TextEditingController();
  TextEditingController sokakController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Klavye çıktığında ekranın kaymasını sağlar
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shadowColor: Colors.black,
        titleSpacing: 25,
        backgroundColor: Colors.orange,
        title: Text(
          'Giriş Yapınız',
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              verticalDirection: VerticalDirection.down,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Lütfen kullanıcı türü seçiniz:'),
                    DropdownButton<String>(
                      value: _selectedUser,
                      onChanged: (_user) {
                        setState(() {
                          _selectedUser = _user;
                          _isDropdownError = false;
                        });
                      },
                      items: [
                        DropdownMenuItem(child: Text("Bireysel"), value: 'Bireysel'),
                        DropdownMenuItem(child: Text("Kurumsal"), value: 'Kurumsal'),
                      ],
                      hint: Text("Seçiniz"),
                    ),
                  ],
                ),
                if (_isDropdownError)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Lütfen kullanıcı türü seçiniz',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                if (_selectedUser == 'Bireysel') ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      onChanged: (_ad) {
                        setState(() {
                          ad = _ad;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        hintText: 'Lütfen adınızı ve soyadınızı giriniz.',
                        labelText: 'Adınız ve Soyadınız',
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                      controller: adController,
                      onTap: () {
                        print('Text editing\'e basıldı.');
                      },
                      onEditingComplete: () {
                        print("Text edit bitti!");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen adınızı ve soyadınızı giriniz';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      onChanged: (_mail) {
                        setState(() {
                          mail = _mail;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        hintText: 'Email giriniz',
                        labelText: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                      controller: mailController,
                      onTap: () {
                        print('Text editing\'e basıldı.');
                      },
                      onEditingComplete: () {
                        print("Text edit bitti!");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen email giriniz';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      onChanged: (_no) {
                        setState(() {
                          no = _no;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        hintText: 'Telefon numarası giriniz',
                        labelText: 'Telefon Numarası',
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                      ),
                      controller: noController,
                      onTap: () {
                        print('Text editing\'e basıldı.');
                      },
                      onEditingComplete: () {
                        print("Text edit bitti!");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen telefon numarası giriniz';
                        }
                        return null;
                      },
                    ),
                  ),
                ] else if (_selectedUser == 'Kurumsal') ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      onChanged: (_ad) {
                        setState(() {
                          ad = _ad;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        hintText: 'Kurum adı giriniz.',
                        labelText: 'Kurum Adı',
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                      controller: adController,
                      onTap: () {
                        print('Text editing\'e basıldı.');
                      },
                      onEditingComplete: () {
                        print("Text edit bitti!");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen kurum adı giriniz';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      onChanged: (_mail) {
                        setState(() {
                          mail = _mail;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        hintText: 'Email giriniz',
                        labelText: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                      controller: mailController,
                      onTap: () {
                        print('Text editing\'e basıldı.');
                      },
                      onEditingComplete: () {
                        print("Text edit bitti!");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen email giriniz';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      onChanged: (_no) {
                        setState(() {
                          no = _no;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        hintText: 'Kurum telefon numarası giriniz',
                        labelText: 'Kurum İletişim Numarası',
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                      ),
                      controller: noController,
                      onTap: () {
                        print('Text editing\'e basıldı.');
                      },
                      onEditingComplete: () {
                        print("Text edit bitti!");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen kurum telefon numarası giriniz';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    onChanged: (_sehir) {
                      setState(() {
                        sehir = _sehir;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      hintText: 'Şehir seçiniz',
                      labelText: 'Şehir',
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                    ),
                    controller: sehirController,
                    onTap: () {
                      print('Text editing\'e basıldı.');
                    },
                    onEditingComplete: () {
                      print("Text edit bitti!");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen şehir giriniz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    onChanged: (_ilce) {
                      setState(() {
                        ilce = _ilce;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      hintText: 'İlçe giriniz',
                      labelText: 'İlçe',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.black,
                      ),
                    ),
                    controller: ilceController,
                    onTap: () {
                      print('Text editing\'e basıldı.');
                    },
                    onEditingComplete: () {
                      print("Text edit bitti!");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen ilçe giriniz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    onChanged: (_mahalle) {
                      setState(() {
                        mahalle = _mahalle;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      hintText: 'Mahalle giriniz',
                      labelText: 'Mahalle',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.black,
                      ),
                    ),
                    controller: mahalleController,
                    onTap: () {
                      print('Text editing\'e basıldı.');
                    },
                    onEditingComplete: () {
                      print("Text edit bitti!");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen mahalle giriniz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    onChanged: (_sokak) {
                      setState(() {
                        sokak = _sokak;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      hintText: 'Sokak giriniz',
                      labelText: 'Sokak',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.black,
                      ),
                    ),
                    controller: sokakController,
                    onTap: () {
                      print('Text editing\'e basıldı.');
                    },
                    onEditingComplete: () {
                      print("Text edit bitti!");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen sokak giriniz';
                      }
                      return null;
                    },
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _isDropdownError = _selectedUser == null;
                    });
                    if (_formKey.currentState?.validate() ?? false && !_isDropdownError) {
                      Route bitisSayfasinaGec = MaterialPageRoute(
                        builder: (context) => AnaSayfa(
                          pass: ad,
                          selectedUser: _selectedUser!,
                        ),
                      );
                      Navigator.push(context, bitisSayfasinaGec);
                    }
                  },
                  child: Text('Giriş yap'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  final String pass;
  final String selectedUser;

  AnaSayfa({required this.pass, required this.selectedUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
      ),
      body: Center(
        child: Text('Hoşgeldiniz, $selectedUser kullanıcısı!'),
      ),
    );
  }
}
