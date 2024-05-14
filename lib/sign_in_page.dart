import 'package:flutter/material.dart';
import 'package:sprinkler_controller/webview_page.dart';
import 'package:sprinkler_controller/sign_up_page.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.0),
            Text(
              'Back',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 24.0),
            Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 24.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.visibility),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement sign in functionality
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => WebViewPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}