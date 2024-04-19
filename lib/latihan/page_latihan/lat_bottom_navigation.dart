import 'package:flutter/material.dart';
import 'package:mi2c_mobile/latihan/page_latihan/lat_list_berita.dart';
import 'package:mi2c_mobile/latihan/page_latihan/lat_list_pegawai.dart';
import '../../utils/session_manager.dart';
import 'lat_login_api.dart';
import 'lat_profile.dart';

class PageBottomNavigationBar extends StatefulWidget {
  const PageBottomNavigationBar({Key? key});

  @override
  State<PageBottomNavigationBar> createState() =>
      _PageBottomNavigationBarState();
}

class _PageBottomNavigationBarState extends State<PageBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late SessionManager sessionManager;

  @override
  void initState() {
    super.initState();
    sessionManager = SessionManager();
    sessionManager.getSession();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Berita'),
        backgroundColor: Colors.grey,
        actions: [
          TextButton(
              onPressed: () {}, child: Text('Welcome ${session.userName}')),
          //logout
          IconButton(
            onPressed: () {
              //clear session
              setState(() {
                session.clearSession();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LatihanLoginApi()),
                        (route) => false);
              });
            },
            icon: Icon(Icons.exit_to_app),
            tooltip: 'Logout',
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          // handle tap
        },
        child: TabBarView(
          controller: tabController,
          children: [
            // content
            LatihanListBerita(),
            LatihanListPegawai(),
            PageProfileUser()
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TabBar(
            controller: tabController,
            labelColor: Colors.grey,
            tabs: const [
              Tab(
                text: "Berita",
                icon: Icon(Icons.search),
              ),
              Tab(
                text: "Karyawan",
                icon: Icon(Icons.person_add),
              ),
              Tab(
                text: "Profil",
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
