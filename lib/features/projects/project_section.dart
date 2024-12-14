import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 800;

    return isMobile
        ? _buildMobileView(context)
        : _buildDesktopView(context);
  }

  Widget _buildMobileView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MobileOneScreen(),
              ),
            );
          },
          child: const Text('View Projects on iPhone 13'),
        ),
      ),
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 16, // Horizontal spacing between frames
        runSpacing: 16, // Vertical spacing between frames
        alignment: WrapAlignment.start,
        children: [
          _buildDeviceFrame(
            context,
            device: Devices.ios.iPhone13,
            title: 'Projects (iPhone 13)',
            content:
                'Here are some amazing projects I have worked on:\n- Portfolio Web App\n- Flutter E-Commerce App\n- Chat Application',
            color: Colors.orange[50]!,
          ),
          _buildDeviceFrame(
            context,
            device: Devices.ios.iPhone12,
            title: 'Projects (iPhone 12)',
            content:
                'Here are some amazing projects I have worked on:\n- Portfolio Web App\n- Flutter E-Commerce App\n- Chat Application',
            color: Colors.orange[100]!,
          ),
          _buildDeviceFrame(
            context,
            device: Devices.ios.iPhone13,
            title: 'Projects (Pixel 4)',
            content:
                'Here are some amazing projects I have worked on:\n- Portfolio Web App\n- Flutter E-Commerce App\n- Chat Application',
            color: Colors.orange[200]!,
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceFrame(
    BuildContext context, {
    required String title,
    required String content,
    required Color color,
    required DeviceInfo device,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 8),
          AspectRatio(
            aspectRatio: 9 / 16,
            child: DeviceFrame(
              device: device,
              screen: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    content,
                    textAlign: TextAlign.center,
                    
                  ),
                ),
              ),
              orientation: Orientation.portrait,
            ),
          ),
        ],
      ),
    );
  }
}

class MobileOneScreen extends StatelessWidget {
  const MobileOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iPhone 13 Projects'),
      ),
      body: Center(
        child: DeviceFrame(
          device: Devices.ios.iPhone13,
          screen: const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Here are some amazing projects I have worked on:\n- Portfolio Web App\n- Flutter E-Commerce App\n- Chat Application',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          orientation: Orientation.portrait,
        ),
      ),
    );
  }
}

class MobileTwoScreen extends StatelessWidget {
  const MobileTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iPhone 12 Projects'),
      ),
      body: Center(
        child: DeviceFrame(
          device: Devices.ios.iPhone12,
          screen: const Center(
            child: Padding(
              padding:  EdgeInsets.all(16.0),
              child: Text(
                'Here are some amazing projects I have worked on:\n- Portfolio Web App\n- Flutter E-Commerce App\n- Chat Application',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          orientation: Orientation.portrait,
        ),
      ),
    );
  }
}

class MobileThreeScreen extends StatelessWidget {
  const MobileThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Pixel 4 Projects'),
      ),
      body: Center(
        child: DeviceFrame(
          device: Devices.ios.iPhone13,
          screen: const Center(
            child: Padding(
              padding:  EdgeInsets.all(16.0),
              child: Text(
                'Here are some amazing projects I have worked on:\n- Portfolio Web App\n- Flutter E-Commerce App\n- Chat Application',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          orientation: Orientation.portrait,
        ),
      ),
    );
  }
}

class DeviceScreen extends StatelessWidget {
  final DeviceInfo device;
  final String title;

  const DeviceScreen({
    super.key,
    required this.device,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: DeviceFrame(
          device: device,
          screen: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Here are some amazing projects I have worked on:\n- Portfolio Web App\n- Flutter E-Commerce App\n- Chat Application',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          orientation: Orientation.portrait,
        ),
      ),
    );
  }
}
