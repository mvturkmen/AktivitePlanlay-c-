import 'package:flutter/material.dart';
import 'package:word_events/models/user.dart';

User userP = User(
    firstName: "Emir",
    lastName: "Saglam",
    birthOfDate: DateTime.now(),
    mailProperties: "emirsaglam.841@gmail.com",
    passwordString: "emirbaba",
    bio: "Merhaba Ben Emir . Gezmeyi cok severim"
);

class UserPage extends StatelessWidget {

  final User? user;

  const UserPage({super.key, this.user});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //appBar: _appBar(),
      body: _buildBody(),
    );
  }


  // Profile AppBar
  AppBar _appBar(){
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: const Text("Profile"),
      actions: [
        IconButton(
          onPressed: () {
            // Hesap Silme Fonksiyonu Buraya Eklenecek
          },
          icon: const Icon(Icons.delete_forever, color: Colors.red),
        )
      ],
    );
  }

  // Profile body
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30,),
          // Profil Fotoğrafı
          const Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "https://via.placeholder.com/150", // Default Resim
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Kullanıcı İsmi
          Text(
            "${userP.firstName} ${userP.lastName}",
            style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          // Kullanıcı Bio
          Text(
            userP.bio ?? "No bio available",
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // Personal Information
          _buildPersonalInformationSection(userP),
          const SizedBox(height: 20),
          // Kullanıcı Aktiviteleri
          FutureBuilder<List<ActivityCard>>(
            future: _fetchUserActivities(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text(
                  "Aktiviteler yüklenirken hata oluştu",
                  style: TextStyle(color: Colors.white),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text(
                  "Henüz aktiviteniz yok.",
                  style: TextStyle(color: Colors.white),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return snapshot.data![index];
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }

  // Personal Information Section
  Widget _buildPersonalInformationSection(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              const Text(
                "Personal Information",
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 99,),
              IconButton(
                onPressed: () {
                  // Hesap Edit Fonksiyonu Buraya Eklenecek
                },
                icon: const Icon(Icons.edit, color: Colors.blueAccent),
              ),
              IconButton(
                onPressed: () {
                  // Hesap Edit Fonksiyonu Buraya Eklenecek
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.all(15.0),
          color: Colors.black87,
          child: Column(
            children: [
              _buildInfoRow(Icons.email, "Email", user.mailProperties),
              _buildInfoRow(Icons.password, "Password", user.passwordString),
              _buildInfoRow(Icons.cake, "Birthdate",
                  user.birthOfDate?.toString().split(' ')[0] ?? "N/A"),
              _buildInfoRow(Icons.location_on, "Location", "Kocaeli"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String? value) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white70),
      ),
      trailing: Text(
        value ?? "Not set",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  // Future Method to Fetch User Activities
  Future<List<ActivityCard>> _fetchUserActivities() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate Delay
    return [
      const ActivityCard(title: "Activity 1", description: "Details about activity 1"),
      const ActivityCard(title: "Activity 2", description: "Details about activity 2"),
    ];
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final String description;

  const ActivityCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
