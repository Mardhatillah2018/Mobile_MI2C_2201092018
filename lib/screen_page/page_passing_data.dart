import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PagePassingData extends StatelessWidget {
  const PagePassingData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Page Passing Data'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Judul Berita ke ${index}'),
              subtitle: Text('Ini sub judul berita ke ${index}'),
              onTap: () {
                //ke page detail
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageGetData(index)));
              },
            );
          }),
    );
  }
}

class PageGetData extends StatelessWidget {
  final int index;
  const PageGetData(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Page Get data'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Ini adalah judul berita ke ${index}'),
            Text('Ini adalah sub judul berita ke ${index}'),
          ],
        ),
      ),
    );
  }
}

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {

  //untuk mendapatkan value dari text field
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Page Login'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextFormField(
              controller: txtUsername,
              decoration: InputDecoration(
                hintText: 'Input Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            SizedBox(height: 8,),
            TextFormField(
              controller: txtPassword,
              obscureText: true, //biar passwordnya ga keliatan
              decoration: InputDecoration(
                  hintText: 'Input Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),

            SizedBox(height: 15,),
            MaterialButton(
              onPressed: () {
                //cara get data dari text form field
                String username = txtUsername.text;
                String pwd = txtPassword.text;
                //print('Hasil Login: $username dan Password: $pwd');

                // Misalkan ada pengecekan login di sini
                if (username == 'admin' && pwd == '123456') {
                  // Jika login berhasil, navigasi ke halaman baru
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageLoginBerhasil()),
                  );
                }else {
                  // Jika password salah, tampilkan snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Maaf, Username atau Password Anda Salah"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text('Login'),
              color: Colors.green,
              textColor: Colors.white,
            )
          ],
        ),
      )
    );
  }
}

class PageLoginBerhasil extends StatelessWidget {
  const PageLoginBerhasil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Selamat Datang'),
      ),
    body: Center(
      child: Text('Hello, Selamat Datang Admin'),
    ),
    );
  }
}


