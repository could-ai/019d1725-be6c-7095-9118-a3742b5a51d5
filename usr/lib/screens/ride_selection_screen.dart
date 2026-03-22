import 'package:flutter/material.dart';

class RideSelectionScreen extends StatefulWidget {
  const RideSelectionScreen({super.key});

  @override
  State<RideSelectionScreen> createState() => _RideSelectionScreenState();
}

class _RideSelectionScreenState extends State<RideSelectionScreen> {
  int _selectedRideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خلفية الخريطة مع مسار الرحلة
          Container(
            color: const Color(0xFFE0E0E0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.route, size: 100, color: Colors.blue[400]),
                  const SizedBox(height: 15),
                  Text(
                    'مسار الرحلة المقترح',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // زر العودة
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 22,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),

          // نافذة اختيار السيارة السفلية
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  // مؤشر السحب
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'اختر نوع السيارة',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // قائمة السيارات
                  _buildRideOption(0, 'UberX', 'اقتصادية • 4 أشخاص • 5 دقائق', 'SAR 25', Icons.directions_car),
                  _buildRideOption(1, 'UberXL', 'عائلية • 6 أشخاص • 8 دقائق', 'SAR 45', Icons.airport_shuttle),
                  _buildRideOption(2, 'Black', 'فاخرة • 4 أشخاص • 10 دقائق', 'SAR 75', Icons.car_rental),
                  
                  // طرق الدفع وزر التأكيد
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(top: BorderSide(color: Colors.grey[200]!)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.credit_card, color: Colors.black87),
                            const SizedBox(width: 10),
                            const Text('البطاقة الائتمانية **** 1234', style: TextStyle(fontWeight: FontWeight.bold)),
                            const Spacer(),
                            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[600]),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              // محاكاة طلب السيارة
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircularProgressIndicator(color: Colors.black),
                                      SizedBox(height: 20),
                                      Text('جاري البحث عن سائق قريب...', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              );
                              
                              // إغلاق النافذة بعد 3 ثواني لمحاكاة العثور على سائق
                              Future.delayed(const Duration(seconds: 3), () {
                                Navigator.pop(context); // إغلاق الـ Dialog
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('تم العثور على سائق! الكابتن في طريقه إليك.'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              });
                            },
                            child: const Text(
                              'تأكيد الحجز',
                              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRideOption(int index, String title, String subtitle, String price, IconData icon) {
    bool isSelected = _selectedRideIndex == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRideIndex = index;
        });
      },
      child: Container(
        color: isSelected ? Colors.blue.withOpacity(0.05) : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Image.asset(
                'assets/car_placeholder.png', // صورة وهمية
                width: 60,
                height: 40,
                errorBuilder: (context, error, stackTrace) => Icon(icon, size: 45, color: Colors.black87),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                  ],
                ),
              ),
              Text(price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
