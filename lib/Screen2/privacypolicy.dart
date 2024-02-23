import 'package:flutter/material.dart';
import 'package:project/Foods/style.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white, // Change the color of the back button here
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      styledText('Privacy Policy of Nutri Fuel',
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                      const SizedBox(height: 20.0),
                      styledText(
                          'This Privacy Policy describes how Nutrie Fuel our collects, uses, and shares information when you use our diet app ("Nutri fuel").',
                          fontSize: 16.0),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText('Information We Collect',
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText('1. Personal Information:',
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText(
                          '- When you register an account with us, we may collect personal information such as your name ]and age.',
                          fontSize: 16.0),
                      styledText(
                          '- If you choose to provide additional information such as height, weight, and dietary preferences, we will also collect this information to provide personalized services.',
                          fontSize: 16.0),
                      styledText('2. Usage Information:',
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText(
                          '- We collect information about how you use the App, including your interactions with features and content within the App.',
                          fontSize: 16.0),
                      styledText('3. Device Information:',
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText(
                          '- We may collect information about your device, including device type, operating system, and unique device identifiers.',
                          fontSize: 16.0),
                      styledText('How We Use Information',
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText('1. Personalization:',
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText(
                          '- We use the information we collect to personalize your experience with the App, including providing tailored diet plans and recommendations.',
                          fontSize: 16.0),
                      styledText('2. Improvement of Services:',
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText(
                          '- We may use collected information to analyze trends and usage patterns to improve the features and functionality of the App.',
                          fontSize: 16.0),
                      styledText('3. Communication:',
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText(
                          '- We may use your email address to send you important updates, newsletters, or promotional materials related to the App. You can opt-out of receiving such communications at any time.',
                          fontSize: 16.0),
                      styledText('Information Sharing',
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText('1. Third-Party Service Providers:',
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText(
                          '- We may share information with third-party service providers who assist us in operating the App, such as hosting services, analytics providers, and customer support services.',
                          fontSize: 16.0),
                      styledText('2. Legal Compliance:',
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText(
                          '- We may disclose information when required to do so by law or in response to legal requests or proceedings.',
                          fontSize: 16.0),
                      styledText('Data Security',
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText(
                          'We take reasonable measures to protect the information we collect from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee absolute security.',
                          fontSize: 16.0),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText('Children\'s Privacy',
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText(
                          'The App is not intended for children under the age of 13. We do not knowingly collect personal information from children under 13. If you believe that a child under 13 has provided us with personal information, please contact us immediately.',
                          fontSize: 16.0),
                      styledText('Changes to This Privacy Policy',
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText(
                          'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.',
                          color: Colors.white,
                          fontSize: 16.0),
                      styledText('Contact Us',
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 10,
                      ),
                      styledText(
                          'If you have any questions about this Privacy Policy, please contact us at [9947191878,dhanushpb49@gmail.com].',
                          fontSize: 16.0,
                          textAlign: TextAlign.center),
                    ]))));
  }
}
