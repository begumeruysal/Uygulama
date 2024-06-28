import 'dart:ui';
import 'package:flutter/material.dart';
import 'atıkListe.dart';
import 'atıkSec.dart';
import 'ayarlar.dart';
import 'profile.dart';
import 'loginFire.dart';
import 'help.dart';
import 'rozet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GirisEkrani(),
      title: 'Uygulama Adı',
    );
  }
}

class AnaSayfa extends StatefulWidget {
  final String pass;
  final String ad;
  final String mail;
  final String no;
  final String sehir;
  final String ilce;
  final String mahalle;
  final String sokak;

  AnaSayfa({
    required this.pass,
    required this.ad,
    required this.mail,
    required this.no,
    required this.sehir,
    required this.ilce,
    required this.mahalle,
    required this.sokak,
  });

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _selectedWastes = [];

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      // Ana Sayfa İçeriği
      ListView(
        children: [
          buildSection('Her Yıl Dünya Çapında Üretilen Gıdaların Üçte Biri İsraf Edilmektedir',
              'Gıda maddeleri, kolayca çöpe atılıp çürümeye terkedilemeyecek kadar değerlidir.'),
          buildSection('BİZ NE YAPIYORUZ',
              'Çevre dostu bir gelecek için çalışıyoruz! Kullanıcılarımızın atık bildirimleri aracılığıyla, geri dönüştürülebilir atıkları toplayarak geri dönüşüm süreçlerine dahil ediyoruz. '
                  'Böylece, doğanın korunmasına katkıda bulunuyor ve sürdürülebilir bir dünya için adımlar atıyoruz. Siz de atıklarınızı bizimle paylaşarak, geri dönüşüm hareketine destek olabilirsiniz!'),
          buildSection('GIDA ATIĞI NEDİR',
              'Gıda atığı, yemek yapım sürecinde veya tüketim sırasında israf edilen yiyecekleri ifade eder. Bu, hasat sonrası kayıplar, işlenmemiş gıdalar, bozulmuş veya son kullanma tarihi geçmiş ürünler gibi çeşitli aşamalarda meydana gelebilir. Gıda atıkları, sadece ekonomik kayıplara değil, aynı zamanda çevresel zararlara da yol açar.'),
          buildSection('GIDA ATIKLARININ GERİ DÖNÜŞÜM YOLLARI',
              'Gıda atıklarının miktarı dünya çapında yıllık 1,3 milyar tona ulaşmaktadır. Bu atıklar toplanarak kompost haline getirilerek organik gübreye dönüştürülmektedir. Uygun gıda atıkları, hayvan yemi olarak tekrar kullanılabilir. Gıda atıkları anaerobik sindirim yoluyla biyogaza dönüştürülebilir. Bu süreç, enerji üretimi ve organik gübre elde etmek için kullanılır.'),
          buildSection('ATIK YAĞ NEDİR?',
              'Atık yağ, yağlı yiyeceklerin pişirilmesi sırasında oluşan ya da işletmelerde kullanılan yağların atılması sonucu oluşan yağlardır. Bu yağlar genellikle tesislerde, restoranlarda ve evlerde oluşur ve doğal olarak çevreye zararlıdır. su kaynaklarının kirlenmesine ve tıkanmasına yol açar.'),
          buildSection("ATIK YAĞLAR NEDEN DÖNÜŞTÜRÜLMELİ",
              'Su kirliliğini önlemek, küresel ısınmayı azaltmak ve biyo-yakıtlar elde etmek için doğru bir şekilde geri dönüştürülmeli veya yok edilmelidir. Atık yağların doğal olarak oluşan bakteriler tarafından parçalanması sonucu oluşan metan ve karbon dioksit gibi sera gazları insan sağlığını olumsuz etkileyebilir.'),
          buildSection('ATIK YAĞLARIN GERİ DÖNÜŞÜMÜ NASIL YAPILIR?',
              'Atık yağların geri dönüştürülmesi için birçok farklı yöntem mevcuttur. Doğal olarak oluşan bakteriler tarafından parçalanarak, biodiesel gibi biyo-yakıtlar elde edilebilir. Bu yakıtlar, düşük emisyonlu ve çevre dostudur.'),
          buildSection("ATIK YAĞLAR NEREDE KULLANILIR",
              "Atık yağların biyodizel üretiminde kullanılan sürece transesterifikasyon adı verilir. Bu süreçte biyodizel yakıtı, gıda üreticilerinin ve restoranların atık yağları ile üretilmektedir."),
        ],
      ),
      WasteSelectionPage(
        selectedWastes: _selectedWastes,
        onWastesUpdated: (List<Map<String, dynamic>> newWastes) {
          setState(() {
            _selectedWastes = newWastes;
          });
        },
        pass: widget.pass,
        ad: widget.ad,
        mail: widget.mail,
        no: widget.no,
        sehir: widget.sehir,
        ilce: widget.ilce,
        mahalle: widget.mahalle,
        sokak: widget.sokak,
      ),
      WasteTrackingResultsPage(selectedWastes: _selectedWastes, userId: '${widget.ad}_${widget.mail}_${widget.no}'),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildSection(String heading, String content) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffEEEEEE),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(content),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff286650),
        title: Text(''),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff286650),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/logo2.png'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menü',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text('PROFİL'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      pass: widget.pass,
                      ad: widget.ad,
                      mail: widget.mail,
                      no: widget.no,
                      sehir: widget.sehir,
                      ilce: widget.ilce,
                      mahalle: widget.mahalle,
                      sokak: widget.sokak,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('ROZETLER'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BadgesPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('AYARLAR'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('ÇIKIŞ YAP'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GirisEkrani()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('YARDIM'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCenterPage()),
                );
              },
            ),
            ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Atık Ekle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Atık Takip',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff50816b),
        onTap: _onItemTapped,
      ),
    );
  }
}
