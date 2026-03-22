import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خلفية الخريطة (محاكاة مؤقتة حتى يتم ربط Google Maps)
          Container(
            color: const Color(0xFFE0E0E0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map_outlined, size: 120, color: Colors.grey[500]),
                  const SizedBox(height: 15),
                  Text(
                    'خريطة تفاعلية\n(سيتم ربطها لاحقاً بخرائط جوجل)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // زر القائمة الجانبية
          Positioned(
            top: 50,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.black, size: 28),
                onPressed: () {
                  // سيتم إضافة القائمة الجانبية لاحقاً
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('القائمة الجانبية')),
                  );
                },
              ),
            ),
          ),

          // النافذة السفلية للبحث عن وجهة
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'مرحباً بك،',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // زر البحث "إلى أين؟"
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/search');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.black87, size: 28),
                          const SizedBox(width: 15),
                          const Text(
                            'إلى أين؟',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.schedule, size: 16),
                                SizedBox(width: 4),
                                Text('الآن', style: TextStyle(fontWeight: FontWeight.bold)),
                                Icon(Icons.keyboard_arrow_down, size: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  
                  // الأماكن المحفوظة
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: const Icon(Icons.home, color: Colors.black87),
                    ),
                    title: const Text('المنزل', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('حي الياسمين، الرياض'),
                    contentPadding: EdgeInsets.zero,
                    onTap: () => Navigator.pushNamed(context, '/ride_selection'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: const Icon(Icons.work, color: Colors.black87),
                    ),
                    title: const Text('العمل', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('طريق الملك فهد، الرياض'),
                    contentPadding: EdgeInsets.zero,
                    onTap: () => Navigator.pushNamed(context, '/ride_selection'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
