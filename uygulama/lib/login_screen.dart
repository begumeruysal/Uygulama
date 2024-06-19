import 'package:flutter/material.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  final String? initialName;
  final String? initialEmail;

  LoginScreen({this.initialName, this.initialEmail});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _userType = 'Bireysel';
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {
    'name': '',
    'email': '',
    'phone': '',
    'city': '',
    'district': '',
    'neighborhood': '',
    'street': '',
  };

  @override
  void initState() {
    super.initState();
    if (widget.initialName != null) {
      _formData['name'] = widget.initialName!;
    }
    if (widget.initialEmail != null) {
      _formData['email'] = widget.initialEmail!;
    }
  }

  void _handleInputChange(String field, String value) {
    setState(() {
      _formData[field] = value;
    });
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(
            name: _formData['name']!,
            email: _formData['email']!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yap'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: _userType,
                onChanged: (value) {
                  setState(() {
                    _userType = value ?? 'Bireysel';
                  });
                },
                items: [
                  DropdownMenuItem(value: 'Bireysel', child: Text('Bireysel')),
                  DropdownMenuItem(value: 'Kurumsal', child: Text('Kurumsal')),
                ],
                decoration: InputDecoration(labelText: 'Kullanıcı Türü'),
              ),
              if (_userType == 'Bireysel') ...[
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: InputDecoration(labelText: 'Ad Soyad'),
                  onChanged: (value) => _handleInputChange('name', value),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Lütfen ad soyad girin';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _formData['email'],
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (value) => _handleInputChange('email', value),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Lütfen email girin';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Cep Telefon No'),
                  onChanged: (value) => _handleInputChange('phone', value),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Lütfen telefon numarası girin';
                    }
                    return null;
                  },
                ),
              ] else ...[
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: InputDecoration(labelText: 'Kurum Adı'),
                  onChanged: (value) => _handleInputChange('name', value),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Lütfen kurum adı girin';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _formData['email'],
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (value) => _handleInputChange('email', value),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Lütfen email girin';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Kurum Telefon No'),
                  onChanged: (value) => _handleInputChange('phone', value),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Lütfen kurum telefon numarası girin';
                    }
                    return null;
                  },
                ),
              ],
              TextFormField(
                decoration: InputDecoration(labelText: 'Şehir'),
                onChanged: (value) => _handleInputChange('city', value),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'İlçe'),
                onChanged: (value) => _handleInputChange('district', value),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mahalle'),
                onChanged: (value) => _handleInputChange('neighborhood', value),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Sokak'),
                onChanged: (value) => _handleInputChange('street', value),
              ),
              ElevatedButton(
                onPressed: _handleLogin,
                child: Text('Giriş'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
