import 'package:flutter/material.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
        ),
        title: const Text('تطبيق السائق', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  isOnline ? 'متاح' : 'غير متاح',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isOnline ? Colors.green : Colors.grey,
                  ),
                ),
                const SizedBox(width: 8),
                Switch(
                  value: isOnline,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      isOnline = value;
                    });
                    if (value) {
                      _simulateIncomingRequest();
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          // خريطة السائق
          Container(
            color: const Color(0xFFE8EAF6),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.navigation, size: 100, color: isOnline ? Colors.blue : Colors.grey),
                  const SizedBox(height: 15),
                  Text(
                    isOnline ? 'جاري البحث عن طلبات...' : 'أنت غير متاح حالياً\nقم بتفعيل الاتصال لاستقبال الطلبات',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // لوحة معلومات السائق السفلية
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem('الرحلات اليوم', '12', Icons.local_taxi),
                      _buildStatItem('التقييم', '4.9', Icons.star, color: Colors.amber),
                      _buildStatItem('الأرباح', 'SAR 340', Icons.account_balance_wallet, color: Colors.green),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String title, String value, IconData icon, {Color color = Colors.blue}) {
    return Column(
      children: [
        Icon(icon, color: color, size: 30),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
      ],
    );
  }

  void _simulateIncomingRequest() {
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted || !isOnline) return;
      
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('طلب جديد!', textAlign: TextAlign.center, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
              const SizedBox(height: 15),
              const Text('أحمد محمد', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.red),
                  const SizedBox(width: 10),
                  Expanded(child: Text('من: واجهة الرياض', style: TextStyle(color: Colors.grey[800]))),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.flag, color: Colors.blue),
                  const SizedBox(width: 10),
                  Expanded(child: Text('إلى: مطار الملك خالد', style: TextStyle(color: Colors.grey[800]))),
                ],
              ),
              const SizedBox(height: 20),
              const Text('المسافة: 4.2 كم • الوقت المقدر: 12 دقيقة', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('رفض'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم قبول الطلب! توجه إلى العميل.'), backgroundColor: Colors.green),
                      );
                    },
                    child: const Text('قبول', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
