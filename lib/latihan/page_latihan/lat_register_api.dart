import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mi2c_mobile/latihan/page_latihan/lat_login_api.dart';

import '../model_latihan/model_register_latihan.dart';

class LatihanRegisterApi extends StatefulWidget {
  const LatihanRegisterApi({super.key});

  @override
  State<LatihanRegisterApi> createState() => _LatihanRegisterApiState();
}

class _LatihanRegisterApiState extends State<LatihanRegisterApi> {

  TextEditingController txtNama = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtNohp = TextEditingController();

  //validasi form
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  //proses untuk hit api
  bool isLoading = false;
  Future<ModelRegisterLatihan?> registerAccount() async {
    //handle error
    try {
      setState(() {
        isLoading = true;
      });

      http.Response response = await http.post(
          Uri.parse('http://192.168.208.154/edukasi_server/register.php'),
          body: {
            "nama": txtNama.text,
            "username": txtUsername.text,
            "password": txtPassword.text,
            "email": txtEmail.text,
            "nohp": txtNohp.text,
          });
      ModelRegisterLatihan data = modelRegisterLatihanFromJson(response.body);
      //cek kondisi
      if (data.value == 1) {
        //kondisi ketika berhasil register
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));

          //pindah ke page login
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LatihanLoginApi()),
                  (route) => false);
        });
      } else if (data.value == 2) {
        //kondisi akun sudah ada
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });
      } else {
        //gagal
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Form Register'),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
        'REGISTER',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //validasi kosong
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtNama,
                  decoration: InputDecoration(
                      hintText: 'Nama',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  //validasi kosong
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtUsername,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtPassword,
                  obscureText: true, //biar password nya gak keliatan
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  //validasi kosong
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtEmail,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  //validasi kosong
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtNohp,
                  decoration: InputDecoration(
                      hintText: 'No Hp',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),

                SizedBox(
                  height: 15,
                ),
                Center(
                    child: isLoading
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        : MaterialButton(
                      onPressed: () {
                        //cara get data dari text form field

                        //cek validasi form ada kosong  atau tidk
                        if (keyForm.currentState?.validate() == true) {
                          setState(() {
                            registerAccount();
                          });
                        }

                        setState(() {
                          // String username = txtUsername.text;
                          // String pwd = txtPassword.text;
                          //
                          // print('Hasil login: ${username} dan pwd = ${pwd}');
                        });
                      },
                      child: Text('Register'),
                      color: Colors.green,
                      textColor: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
        ],
      ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(width: 1, color: Colors.green)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LatihanLoginApi()));
          },
          child: Text('Sudah punya akun? Silahkan Login'),
        ),
      ),
    );
  }
}
