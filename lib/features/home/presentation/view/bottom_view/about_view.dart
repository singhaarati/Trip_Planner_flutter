import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutView extends ConsumerStatefulWidget {
  const AboutView({super.key});

  @override
  ConsumerState<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends ConsumerState<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'App Overview',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Welcome to our Trip Planner App! Our app is designed to simplify travel planning and enhance your overall experience. With a user-friendly interface and comprehensive features, it\'s the perfect tool for organizing your trips.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Mission Statement',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'At Trip Planner, our mission is to provide a comprehensive and user-friendly travel planning platform that enables travelers to effortlessly plan, organize, and enjoy their trips. We aim to simplify the travel planning process and help users create unforgettable travel experiences.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Development Team',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Our app is developed by a team of experienced developers and travel enthusiasts who are passionate about creating innovative solutions for travelers. With a deep understanding of user needs, we strive to deliver a top-notch app that meets and exceeds expectations.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Unique Selling Points',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '1. Intuitive itinerary creation for seamless trip planning.\n'
              '2. Personalized recommendations based on user preferences.\n'
              '3. Real-time updates on flights, weather, and other travel information.\n'
              '4. Collaborative planning and sharing with travel companions.\n'
              '5. Comprehensive travel guides and insider tips for popular destinations.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'User Testimonials',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            // Add user testimonials here
            SizedBox(height: 20.0),
            Text(
              'App Version and Updates',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Current Version: 1.0.0\n'
              'We are committed to improving our app and regularly releasing updates to enhance its features and performance. Stay tuned for exciting new features and improvements in future updates!',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'For any inquiries or assistance, please reach out to us at support@tripplanner.com.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Privacy and Security',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We value your privacy and take the security of your personal information seriously. Our app employs strict security measures to ensure your data remains protected at all times.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Future Plans',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We are constantly working to enhance your travel planning experience. Our future plans include integrating additional travel services, expanding our destination database, and incorporating advanced trip management features.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Social Media Links',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            // Add social media links here
          ],
        ),
      ),
    );
  }
}



// const Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'Welcome to our Trip Planner App!',
      //         style: TextStyle(
      //           fontSize: 24.0,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       SizedBox(height: 20.0),
      //       Text(
      //         'At Trip Planner, we believe that travel should be an enjoyable and stress-free experience. Our mission is to provide you with a comprehensive and user-friendly platform to plan, organize, and enhance your travel adventures. Whether you\'re a frequent globetrotter or a first-time explorer, our app is designed to cater to all your travel needs.',
      //         style: TextStyle(fontSize: 16.0),
      //       ),
      //       SizedBox(height: 20.0),
      //       Text(
      //         'With our Trip Planner app built using Flutter, we\'ve combined the power of modern technology with a seamless user experience to simplify the entire travel planning process. Our team of passionate developers and travel enthusiasts have crafted an app that is both intuitive and feature-rich, ensuring that you have everything you need at your fingertips.',
      //         style: TextStyle(fontSize: 16.0),
      //       ),
      //       SizedBox(height: 20.0),
      //       Text(
      //         'Happy traveling!',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // const SafeArea(
      //   child: Center(
      //     child: Text("About Us"),
      //   ),
      // ),