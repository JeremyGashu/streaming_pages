import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Playlist extends StatelessWidget {
  List<Music> _musics = [
    Music(
      imageName: 'artist_image.jpg',
      duration: '4:12',
      artistName: 'Dawit Getachew',
      name: 'Amelkalew',
    ),
    Music(
      imageName: 'artist_image2.jpg',
      duration: '4:12',
      artistName: 'Hana Tekle',
      name: 'Anileyayem',
    ),
    Music(
      imageName: 'artist_image.jpg',
      duration: '4:12',
      artistName: 'Bereket Tesfaye',
      name: 'Yibezal',
    ),
    Music(
      imageName: 'artist_image.jpg',
      duration: '4:12',
      artistName: 'Dawit Getachew',
      name: 'Etebkihalehi',
    ),
    Music(
      imageName: 'image3.jpg',
      duration: '4:12',
      artistName: 'Aster Abebe',
      name: 'Eski Yengeregn',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //upper section containing the image, svg, shuffle button and healing track
          _upperSection(),
          SizedBox(
            height: 20,
          ),
          _playListStat(),
          SizedBox(
            height: 15,
          ),
          //ad section
          _adContainer('ad.png'),
          SizedBox(
            height: 15,
          ),
          _searchBar(),

          SizedBox(
            height: 15,
          ),

          ListView.builder(
              shrinkWrap: true,
              itemCount: _musics.length,
              itemBuilder: (context, index) {
                return _musicTile(
                  _musics[index],
                );
              }),
        ],
      ),
    );
  }
}

Widget _upperSection() {
  return Column(
    children: [
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                right: -10,
                child: Container(
                  width: 100,
                  height: 100,
                  child: SvgPicture.asset(
                    'images/order.svg',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 150,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/artist_image.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 70,
                height: 70,
                child: SvgPicture.asset(
                  'images/search.svg',
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
            //image
            //svg
            //playlist icon
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              //healing
              //38 tracks
              //shuffle
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Healing',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '38 Tracks',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.purple.withOpacity(0.7),
                        width: 3,
                      )),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'images/Shuffle.svg',
                        color: Colors.purple.withOpacity(0.7),
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Shuffle Play',
                        style: TextStyle(
                          color: Colors.purple.withOpacity(0.7),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _playListStat() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          '38 songs, 1hr 28 min',
          style: TextStyle(
            fontSize: 19,
            color: Colors.black.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Icon(
              Icons.favorite,
              color: Colors.grey,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '31k',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 30,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _adContainer(String path) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 10,
    ),
    width: double.infinity,
    height: 150,
    child: Image.asset(
      'images/$path',
      fit: BoxFit.cover,
    ),
  );
}

Widget _searchBar() {
  return Container(
    color: Colors.purple.withOpacity(0.15),
    padding: EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20,
    ),
    child: Row(
      children: [
        SvgPicture.asset(
          'images/search.svg',
          width: 22,
        ),
        Expanded(
            child: TextField(
          autofocus: false,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        )),
        SvgPicture.asset(
          'images/order.svg',
          width: 22,
        ),
      ],
    ),
  );
}

Widget _musicTile(Music music) {
  return ListTile(
    leading: Container(
      width: 50,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'images/${music.imageName}',
          fit: BoxFit.cover,
        ),
      ),
    ),
    title: Text(
      music.name,
      style: TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontSize: 20,
        letterSpacing: 1.01,
      ),
    ),
    subtitle: Text(
      music.artistName,
      style: TextStyle(
        color: Colors.black.withOpacity(0.5),
        fontSize: 15,
        letterSpacing: 1.01,
      ),
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          music.duration,
          style: TextStyle(color: Colors.grey),
        ),
        Icon(
          Icons.more_vert,
          color: Colors.grey,
          size: 25,
        )
      ],
    ),
  );
}

class Music {
  String name;
  String artistName;
  String duration;
  String imageName;
  Music({this.artistName, this.name, this.imageName, this.duration});
}
