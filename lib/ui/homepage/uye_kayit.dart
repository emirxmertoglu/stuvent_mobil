import 'package:flutter/material.dart';

class UyeKayit extends StatefulWidget {
  @override
  _UyeKayitState createState() => _UyeKayitState();
}

class _UyeKayitState extends State<UyeKayit> {
  String _ad,_soyad, _sifre, _emailAdres;
  bool otomatikKontrol = false;

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            accentColor: Colors.green,
            hintColor: Colors.indigo,
            errorColor: Colors.red,
            primaryColor: Color(0xFFFF4700)),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Üye Kayıt"),
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              autovalidate: otomatikKontrol,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: "Adınız",
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Ad",
                      border: OutlineInputBorder(),
                    ),
                    validator: _isimKontrol,
                    onSaved: (deger) => _ad = deger,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: "Soyadınız",
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Soyad",
                      border: OutlineInputBorder(),
                    ),
                    validator: _soyisimKontrol,
                    onSaved: (deger) => _soyad = deger,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email adresiniz",
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.green, width: 2)),
                      //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.purple, width: 2)),
                    ),
                    validator: _emailKontrol,
                    onSaved: (deger) => _emailAdres = deger,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Şifreniz",
                      labelText: "Şifre",
                      border: OutlineInputBorder(),
                      //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.green, width: 2)),
                      //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.purple, width: 2)),
                    ),
                    validator: (String girilenVeri) {
                      if(girilenVeri.length<6){
                        return "En az 6 karakter gerekli";
                      }
                      else return null;
                    },
                    onSaved: (deger) => _sifre = deger,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton.icon(
                    icon: Icon(Icons.save),
                    label: Text("KAYDET"),
                    color: Colors.red,
                    disabledColor: Colors.amber,
                    onPressed: _girisBilgileriniOnayla,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _girisBilgileriniOnayla() {

    if(formKey.currentState.validate()){
      formKey.currentState.save();
      debugPrint("Girilen mail: $_emailAdres şifre:$_sifre ad:$_ad soyad:$_soyad");
    }else{
      setState(() {
        otomatikKontrol=true;
      });
    }


  }



  String _emailKontrol(String mail){

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return 'Geçersiz mail';
    else
      return null;
  }

  String _isimKontrol(String isim){
    RegExp regex=RegExp("^[abcçdefgğhıijklmnoöprsştuüvyzqwxABCÇDEFGHIİJKLMNOÖPRSŞTUÜVYZQWX]+\$");
     if (!regex.hasMatch(isim))
      return 'Isim numara içermemeli';
    else
      return null;
  }


  String _soyisimKontrol(String soyisim) {
    RegExp regex=RegExp("^[abcçdefgğhıijklmnoöprsştuüvyzqwxABCÇDEFGHIİJKLMNOÖPRSŞTUÜVYZQWX]+\$");
    if (!regex.hasMatch(soyisim))
      return 'Soyisim numara içermemeli';
    else
      return null;
  }
}
