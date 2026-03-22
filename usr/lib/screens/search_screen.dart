import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // قسم البحث العلوي
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        // حقل موقع الانطلاق
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'موقع الالتقاء الحالي',
                            filled: true,
                            fillColor: Colors.grey[100],
                            prefixIcon: const Icon(Icons.my_location, color: Colors.blue),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // حقل الوجهة
                        TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'إلى أين؟',
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefixIcon: const Icon(Icons.location_on, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  // أيقونة التبديل بين المواقع
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.swap_vert, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
            
            // قائمة النتائج والأماكن المقترحة
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 10),
                children: [
                  _buildLocationItem(
                    context,
                    'مطار الملك خالد الدولي',
                    'الرياض، المملكة العربية السعودية',
                    Icons.flight,
                  ),
                  _buildLocationItem(
                    context,
                    'واجهة الرياض (Riyadh Front)',
                    'طريق المطار، الرياض',
                    Icons.location_on,
                  ),
                  _buildLocationItem(
                    context,
                    'بوليفارد رياض سيتي',
                    'حطين، الرياض',
                    Icons.location_on,
                  ),
                  _buildLocationItem(
                    context,
                    'جامعة الملك سعود',
                    'الدرعية، الرياض',
                    Icons.school,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationItem(BuildContext context, String title, String subtitle, IconData icon) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[100],
        child: Icon(icon, color: Colors.black87),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
      onTap: () {
        // عند اختيار الوجهة، ننتقل لشاشة اختيار السيارة
        Navigator.pushNamed(context, '/ride_selection');
      },
    );
  }
}
