import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: ListView(
        children: [
          NewsCard(
            imageUrl:
                'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_1024/v1634025439/01hz9d0fcew6yzjq12srxgc2jy.jpg',
            title:
                'Sido Muncul Gelar "Ayo Minum Jamu" Bersama 100 Pedagang Jamu',
            source: 'kumparanNEWS',
            timeAgo: '28 minutes ago',
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Trending',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          TrendingNewsCard(
            imageUrl:
                'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_1024/v1634025439/01hz813cm4kdppwhp4jdjp9vnv.jpg',
            title:
                'Bus Persib Dilempari Batu saat Tinggalkan Stadion Gelora Bangkalan',
            source: 'kumparanNEWS',
            timeAgo: '13 hours ago',
          ),
          TrendingNewsCard(
            imageUrl:
                'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_1024/v1634025439/01hz94bd1e8jg040haswp8yxfn.jpg',
            title:
                'Pasteur Bandung \'Lautan Biru\', Dipadati Bobotoh Jelang Kedatangan Persib',
            source: 'kumparanNEWS',
            timeAgo: '2 hours ago',
          ),
          TrendingNewsCard(
            imageUrl:
                'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_1024/v1634025439/01hz6p3q5h895y418j72at5w75.jpg',
            title:
                'Profil Duo Djiwandono, Keponakan Prabowo yang Masuk Gugus Tugas Sinkronisasi',
            source: 'kumparanNEWS',
            timeAgo: '8 hours ago',
          ),
          TrendingNewsCard(
            imageUrl:
                'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_1024/v1634025439/01ht087rb04a11w5gawg20wk9r.jpg',
            title:
                'MAKI Ancam Gugat Kejagung soal Kasus Korupsi Timah, Dorong Polri-KPK Terlibat',
            source: 'kumparanNEWS',
            timeAgo: '4 hours ago',
          ),
          TrendingNewsCard(
            imageUrl:
                'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_1024/v1634025439/01hgyrj22nc33wcrebnf9rnfw5.jpg',
            title:
                'Dulu Tim Transisi Disebut Tak Perlu, Kini Muncul Gugus Tugas Prabowo-Gibran',
            source: 'kumparanNEWS',
            timeAgo: '5 hours ago',
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String source;
  final String timeAgo;

  NewsCard({
    required this.imageUrl,
    required this.title,
    required this.source,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imageUrl),
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('$source • $timeAgo'),
          ),
        ],
      ),
    );
  }
}

class TrendingNewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String source;
  final String timeAgo;

  TrendingNewsCard({
    required this.imageUrl,
    required this.title,
    required this.source,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        leading: Image.network(
          imageUrl,
          width: 80,
          fit: BoxFit.cover,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('$source • $timeAgo'),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
