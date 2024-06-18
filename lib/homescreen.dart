import 'package:dont_book_my_show/All_Movies.dart';
import 'package:dont_book_my_show/movie_info_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
//new comment
class _HomePageState extends State<HomePage> {
  List listOfMovies = [
    {
      "title": "Bad Boys",
      "rating": "IMDb:3.5",
      "imageUrl": 'assets/Bad Boys for Life.jpeg',
      "specs":'',
      "description":'Two cops from Miami on a journey to fame find themselves entangled with a cross border crime syndicate',
    },
    {
      "title": "Avengers",
      "rating": 'IMDb:7',
      "imageUrl":
          "assets/avengers.jpeg",
      "specs":'',
      "description":'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the '
          'powerful Thanos before his blitz of devastation and ruin puts an end to the universe',
    },
    {
      "imageUrl":
          'assets/Batman.jpeg',
      "title": 'Batman',
      "rating": 'IMDb:9.3',
      "specs":'',
      "description":'Batman ventures into Gotham City\'s underworld when a sadistic killer leaves behind a trail of '
          'cryptic clues. As the evidence begins to lead closer to home and the scale of the perpetrator\'s plans become clear,'
          ' he must forge new relationships, '
          'unmask the culprit and bring justice to the abuse of power and corruption that has long plagued the metropolis.',
    },
    {
      "imageUrl":
          'assets/joker.jpeg',
      "title": 'Joker',
      "rating": 'IMDb:8.4',
      "specs":'',
      "description":'During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham'
          ' City while becoming an infamous psychopathic crime figure.',
    }
  ];
  List listOfPopularMovies = [
    {
      "title": "K.G.F:Chapter 1",
      "rating": "IMDb:8.2",
      "imageUrl": 'assets/KGF.jpeg',
      "specs":'Action : 2hr 30 min',
      "description":'In the 1970s, a gangster named Rocky goes undercover as a slave to '
          'assassinate the owner of a notorious gold mine known as the Kolar Gold Fields',
    },
    {
      "title": "Pathaan",
      "rating": "IMDb:5.8",
      "imageUrl": 'assets/Pathan.jpeg',
      "specs":'Action,Thriller : 2 hr 01 min',
      "description":'An Indian agent races against a doomsday clock as a ruthless mercenary,'
          ' with a bitter vendetta, mounts an apocalyptic attack against the country',
    },
    {
      "title": "Fury",
      "rating": "IMDb:7.6",
      "imageUrl": 'assets/FURY.jpeg',
      "specs":'',
      "description":'A grizzled tank commander makes tough decisions as he and '
          'his crew fight their way across Germany in April, 1945.',
    },
    {
      "title": "John Wick 3",
      "rating": "IMDb:7.4",
      "imageUrl": 'assets/JOHNWICK3.jpeg',
      "specs":'',
      "description":'John Wick is on the run after killing a member of the international assassins guild, '
          'and with a '
          '14 million price tag on his head, he is the target of hit men and women everywhere',
    },
    {
      "title": "The Fast and the Furious",
      "rating": "IMDb:6",
      "imageUrl": 'assets/FandF.jpeg',
      "specs":'',
      "description":'Los Angeles police officer Brian O Conner must decide where his loyalty really lies '
          'when he becomes enamored with the street racing world he has been sent undercover to end it.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text('data'),backgroundColor: Colors.blueGrey,),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Anurag!',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 50, 50),
                            fontSize: 22),
                      ),
                      Text(
                        'Watch your favorite movies here.',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 30,
                    child: Image.network(
                        'https://static.dc.com/dc/files/default_images/Char_Profile_Batman_20190116_5c3fc4b40faec2.47318964.jpg'),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Most Watched Movies',
                style: TextStyle(color: Colors.white),
              ),
              Card(
                elevation: 3,
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 206,
                      width: 380,
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          'https://cdn.mos.cms.futurecdn.net/5vPndSdDicde7EwTyAtqjk.jpg',
                        ),
                      ),
                    ),
                    Container(
                        height: 160,
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Column(
                                  children: [
                                    Text('Batman'),
                                    Text('The Dark Knight')
                                  ],
                                ),
                                TextButton.icon(
                                  icon: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                  label: const Text(
                                    'Watch Now',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Popular Movies',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => allMovies()),);
                      },
                      child: const Text(
                        'See More >',
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 50, 50)),
                      ))
                ],
              ),
              SizedBox(
                  height: 250,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: popularMoviesWidget(context),
                    ),
                  )),
              SizedBox(
                  height: 250,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: MovieDataWidget(context),
                    ),
                  )),

              // SizedBox(
              //   height: 250,
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       children: [
              //         movieCard(
              //           imageUrl:
              //           'https://static.wikia.nocookie.net/marvel_dc/images/0/08/Batman_Vol_3_131_Textless_Fabok_Variant.jpg/revision/latest?cb=20230106222502',
              //           title: 'Batman',
              //           rating: '9.3',
              //         ),
              //         movieCard(
              //           imageUrl:
              //           'https://m.media-amazon.com/images/I/71niXI3lxlL._AC_SY679_.jpg',
              //           title: 'Joker',
              //           rating: '8.4',
              //         ),
              //         movieCard(
              //             imageUrl:
              //             'https://www.google.com/imgres?q=rab%20ne%20bana%20di%20jodi&imgurl=https%3A%2F%2Fm.media-amazon.com%2Fimages%2FM%2FMV5BMTQ0NzIzMTM3MF5BMl5BanBnXkFtZTcwNzY4NTk5Mw%40%40._V1_.jpg&imgrefurl=https%3A%2F%2Fwww.imdb.com%2Ftitle%2Ftt1182937%2F&docid=1zndnS80bthKSM&tbnid=DpjQBsJbQPddMM&vet=12ahUKEwi0s7LCxOKGAxXu4DgGHaRzCoAQM3oECFIQAA..i&w=352&h=500&hcb=2&ved=2ahUKEwi0s7LCxOKGAxXu4DgGHaRzCoAQM3oECFIQAA',
              //             title: 'Rab ne bana di jodi',
              //             rating: '7'),
              //         movieCard(
              //           imageUrl:
              //           'https://m.media-amazon.com/images/I/71niXI3lxlL._AC_SY679_.jpg',
              //           title: 'Joker',
              //           rating: '8.4',
              //         ),
              //         movieCard(
              //           imageUrl:
              //           'https://m.media-amazon.com/images/I/71niXI3lxlL._AC_SY679_.jpg',
              //           title: 'Joker',
              //           rating: '8.4',
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Center(
                child: Icon(
                  Icons.more_horiz,
                  color: Color.fromARGB(255, 255, 50, 50),
                  size: 50,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 29, 29, 29),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage())
                  );
                    },
                  icon: const Icon(Icons.home, size: 20, color: Colors.white)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite,
                      size: 20, color: Colors.white)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmarks,
                      size: 18, color: Colors.white)),
              IconButton(
                  onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()));},
                  icon: const Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget movieCard(
      {
      required var data,
      required String title,
      required String rating,
      required String imageUrl,
      required String specs,
      required String description}) {
      return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: SizedBox(
                  height: 197,
                  child: Image.asset(
                    imageUrl,
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 60,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 12,
                ),
                Text(
                  rating,
                  style: const TextStyle(color: Colors.amber),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  List<Widget> MovieDataWidget(BuildContext context) {
    List<Widget> movies = [];
    for (int i = 0; i < listOfMovies.length; i++) {
      var v = listOfMovies[i];
      movies.add(InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieInfoDescription(movieData: v)));
        },
        child: movieCard(
          data: v,

          title: v['title'].toString(),
          rating: v['rating'].toString(),
          imageUrl: v['imageUrl'].toString(),
          specs: v['specs'].toString(),
          description: v['description'].toString(),
        ),
      ));
    }
    return movies;
  }
  List<Widget> popularMoviesWidget(BuildContext context) {
    List<Widget> movies = [];
    for (int i = 0; i < listOfPopularMovies.length; i++) {
      var v = listOfPopularMovies[i];
      movies.add(InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieInfoDescription(movieData: v)));
        },
        child: movieCard(
          data: v,
          title: v['title'].toString(),
          rating: v['rating'].toString(),
          imageUrl: v['imageUrl'].toString(),
          specs: v['specs'].toString(),
          description: v['description'].toString(),
        ),
      ));
    }
    return movies;
  }
}
