import 'package:flutter/material.dart';
import '../widgets/appBar.dart';
import '../widgets/footer.dart';

class TeamMember {
  final String name;
  final String role;
  final String imagePath;

  TeamMember({required this.name, required this.role, required this.imagePath});
}

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> with TickerProviderStateMixin {
  final List<TeamMember> teamMembers = [
    TeamMember(name: 'Nicolas', role: 'Co-founder, CEO', imagePath: 'assets/images/nicolas.jpg'),
    TeamMember(name: 'Max', role: 'Co-CMO', imagePath: 'assets/images/max.jpg'),
    TeamMember(name: 'Chia', role: 'Designer/ Editor', imagePath: 'assets/images/chia.jpg'),
    TeamMember(name: 'Sam', role: 'Co-founder, CPO', imagePath: 'assets/images/sam.jpg'),
    TeamMember(name: 'Natalia', role: 'COO', imagePath: 'assets/images/natalia.jpg'),
    TeamMember(name: 'Lauren', role: 'Event Manager/ PR', imagePath: 'assets/images/lauren.jpg'),
    TeamMember(name: 'Mike', role: 'Co-founder, CMO', imagePath: 'assets/images/mike.jpg'),
    TeamMember(name: 'Curls', role: 'Sales', imagePath: 'assets/images/curls.jpg'),
    TeamMember(name: 'Mili', role: 'Event Manager/ PR', imagePath: 'assets/images/mili.jpg'),
    TeamMember(name: 'Roger', role: 'Software Lead', imagePath: 'assets/images/roger.jpg'),
    TeamMember(name: 'Fabian', role: 'Actual Architect', imagePath: 'assets/images/fabian.jpg'),
  ];

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildSlideTransition(Widget child) {
    return SlideTransition(position: _animation, child: child);
  }

  Widget buildTeamCard(TeamMember member) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Card(
        elevation: 9.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 35, backgroundImage: AssetImage(member.imagePath)),
              SizedBox(height: 10.0),
              Text(member.name, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 4.0),
              Text(member.role, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoSection(String title, String content, {TextAlign textAlign = TextAlign.start}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          buildSlideTransition(Text(title, style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold))),
          SizedBox(height: 20.0),
          buildSlideTransition(Container(
            width: 350.0,
            child: Text(content, style: TextStyle(fontSize: 18.0), textAlign: textAlign, maxLines: 3, overflow: TextOverflow.ellipsis),
          )),
        ],
      ),
    );
  }

  // New section with background image
  Widget buildBackgroundImageSection() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/st.jpg'), // Background image
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Center(
        child: Text(
          'Scroll with the page!',
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Use your custom app bar
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                // Intro section with team heading
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                    color: Colors.white,
                    child: Text('Meet Our Amazing Team', style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                  ),
                ),
                // Team members grid
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return buildSlideTransition(buildTeamCard(teamMembers[index]));
                    },
                    childCount: teamMembers.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 2,
                  ),
                ),
                // Info sections
                SliverToBoxAdapter(
                  child: buildInfoSection('Why do we need to democratize garment manufacturing', 'The fashion industry has a 50 billion dead stock issue because an estimated 30% of fashion products are never sold as trend cycles have shortened to just a few weeks.'),
                ),
                SliverToBoxAdapter(
                  child: buildInfoSection('', 'Something seems massively broken in this system! Trend cycles are outpacing conventional supply chains with lead times from design to production delivery of 9-12 months...', textAlign: TextAlign.end),
                ),
                SliverToBoxAdapter(
                  child: buildInfoSection('After working in fashion for a few years, we found 3 striking supply chain issues:', '', textAlign: TextAlign.center),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildInfoSection('01', 'Traditional paper-based systems hinder the flow of information...', textAlign: TextAlign.start),
                      buildInfoSection('02', 'Linear supply chains with production steps spread across the globe...', textAlign: TextAlign.start),
                      buildInfoSection('03', 'Mass production (high MOQs) leads to a mismatch between supply and demand...', textAlign: TextAlign.start),
                    ],
                  ),
                ),
                // Background image section
                SliverToBoxAdapter(
                  child: buildBackgroundImageSection(),
                ),
                SliverToBoxAdapter(
                  child: buildInfoSection('So how will a bunch of 20 something year olds fix this mess?', 'At Labwear Studios, we’re committed to democratizing garment manufacturing by offering services that empower brands worldwide to create garments, order samples, and produce in bulk responsibly and with ease.'),
                ),
                SliverToBoxAdapter(
                  child: buildInfoSection('', 'So, what exactly are we? Simply calling us a manufacturer or a factory doesn’t quite capture the essence of our work.', textAlign: TextAlign.end),
                ),
              ],
            ),
          ),
          Footer(context, footerText: ''), // Use your custom footer
        ],
      ),
    );
  }
}
