// tasbeeh_counter_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

class TasbeehCounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      backgroundColor: Colors.brown.shade800,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Digital-style display for count
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              margin: EdgeInsets.only(bottom: 60),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Text(
                '${counterProvider.count}',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent.shade400,
                  fontFamily: 'Digital', // Use a digital font if available
                ),
              ),
            ),

            // Large bead-like button for increment
            GestureDetector(
              onTap: counterProvider.increment,
              child: Container(
                padding: EdgeInsets.all(35),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber.shade700,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Icon(
                  Icons
                      .fingerprint, // Thumb icon to simulate pressing the counter
                  color: Colors.brown.shade900,
                  size: 100,
                ),
              ),
            ),

            SizedBox(height: 30),

            // Reset button
            ElevatedButton(
              onPressed: counterProvider.reset,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Reset',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
