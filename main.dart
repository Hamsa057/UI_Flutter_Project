import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MovieProvider(),
      child: const MovieApp(),
    ),
  );
}

// ============================================================
// MODEL
// ============================================================

class Movie {
  final String title;
  final String type;
  final String genre;
  final String language;
  final String year;
  final double rating;
  final String platform;
  final String availability;
  final String category;
  final String image;
  final String? backupImage;
  final int? seasons;

  const Movie({
    required this.title,
    required this.type,
    required this.genre,
    required this.language,
    required this.year,
    required this.rating,
    required this.platform,
    required this.availability,
    required this.category,
    required this.image,
    this.backupImage,
    this.seasons,
  });

  String get description =>
      'Explore $title in Movie Explorer and discover its story, genre, language and where to watch.';
}

class AppNotification {
  final String title;
  final String message;
  final String time;
  final IconData icon;

  const AppNotification(
    this.title,
    this.message,
    this.time,
    this.icon,
  );
}

// ============================================================
// PROVIDER
// ============================================================

class MovieProvider extends ChangeNotifier {
  final List<Movie> movies = demoMovies;
  final Set<String> favoritesSet = {};

  String userName = '';
  String userEmail = '';

  bool isFavorite(Movie movie) {
    return favoritesSet.contains(movie.title);
  }

  List<Movie> get favorites {
    return movies
        .where((movie) => favoritesSet.contains(movie.title))
        .toList();
  }

  void login(String name, String email) {
    userName = name.trim();
    userEmail = email.trim();
    notifyListeners();
  }

  void toggleFavorite(Movie movie) {
    if (isFavorite(movie)) {
      favoritesSet.remove(movie.title);
    } else {
      favoritesSet.add(movie.title);
    }

    notifyListeners();
  }

  List<Movie> search(String query) {
    final q = query.trim().toLowerCase();

    if (q.isEmpty) return movies;

    return movies.where((movie) {
      return [
        movie.title,
        movie.genre,
        movie.language,
        movie.type,
        movie.platform,
      ].any(
        (value) => value.toLowerCase().contains(q),
      );
    }).toList();
  }

  List<Movie> section(String name) {
    return movies
        .where((movie) => movie.category == name)
        .toList();
  }

  List<Movie> language(String name) {
    return movies
        .where((movie) => movie.language == name)
        .toList();
  }

  List<Movie> genre(String name) {
    return movies
        .where((movie) => movie.genre == name)
        .toList();
  }

  List<Movie> theaters() {
    return movies
        .where((movie) => movie.availability == 'In Theaters')
        .toList();
  }
}

// ============================================================
// POSTER URLS
// ============================================================

const darkKnight =
    'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg';

const interstellar =
    'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg';

const inception =
    'https://image.tmdb.org/t/p/w500/oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg';

const dune =
    'https://image.tmdb.org/t/p/w500/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg';

const batman =
    'https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg';

const avengers =
    'https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg';

const stranger =
    'https://image.tmdb.org/t/p/w500/x2LSRK2Cm7MZhjluni1msVJ3wDF.jpg';

const wednesday =
    'https://image.tmdb.org/t/p/w500/9PFonBhy4cQy7Jz20NpMygczOkv.jpg';

const insideOut =
    'https://image.tmdb.org/t/p/w500/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg';

const quietPlace =
    'https://image.tmdb.org/t/p/w500/hU42CRk14JuPEdqZG3AWmagiPAP.jpg';

const kingdom =
    'https://image.tmdb.org/t/p/w500/gKkl37BQuKTanygYQG1pyYgLVgf.jpg';


const spiderman =
    'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg';

const lalaland =
    'https://image.tmdb.org/t/p/w500/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg';

// Indian movies

const rrr =
    'https://upload.wikimedia.org/wikipedia/en/d/d7/RRR_Poster.jpg';

const bahubali =
    'https://upload.wikimedia.org/wikipedia/en/5/5f/Baahubali_The_Beginning_poster.jpg';

const kgf =
    'images/kgf.jpg';

const yjhd =
    'https://upload.wikimedia.org/wikipedia/en/1/15/Yeh_jawani_hai_deewani.jpg';

// New movies

const dhurandhar = 'images/dhurandhar.jpg';

const pushpa =
    'images/pushpa.jpeg';

const hiNanna =
    'https://image.tmdb.org/t/p/w500/hhMLtq9m1aK0dpY9Wcq26XeDH2z.jpg';

const mahanati = 'images/mahanati.jpg';

const sitaRamam =
    'images/sita_ramam.jpg';

const kantara =
    'images/kantara.jpg';

const jersey =
    'images/jersey.jpeg';

const stree2 =
    'https://image.tmdb.org/t/p/w500/nfnhwfUEFuSOxxf4jDdBlY6Lccw.jpg';

const threeIdiots =
    'https://image.tmdb.org/t/p/w500/66A9MqXOyVFCssoloscw79z8Tew.jpg';

const martian =
    'images/martian.jpg';

const lastOfUs =
    'images/last_of_us.jpg';

const paradise =
    'images/paradise.jpg';

const kalki =
    'https://image.tmdb.org/t/p/w500/rstcAnBeCkxNQjNp3YXrF6IP1tW.jpg';

// ============================================================
// MOVIE HELPER
// ============================================================

Movie makeMovie(
  String title,
  String type,
  String genre,
  String language,
  String year,
  double rating,
  String platform,
  String availability,
  String category,
  String image, {
  String? backupImage,
  int? seasons,
}) {
  return Movie(
    title: title,
    type: type,
    genre: genre,
    language: language,
    year: year,
    rating: rating,
    platform: platform,
    availability: availability,
    category: category,
    image: image,
    backupImage: backupImage,
    seasons: seasons,
  );
}

// ============================================================
// MOVIE DATA
// ============================================================

final List<Movie> demoMovies = [

  // ---------------- TRENDING ----------------

  makeMovie(
    'The Dark Knight',
    'Movie',
    'Action',
    'English',
    '2008',
    9.0,
    'Netflix',
    'Streaming',
    'Trending Now',
    darkKnight,
  ),

  makeMovie(
    'Interstellar',
    'Movie',
    'Sci-Fi',
    'English',
    '2014',
    8.7,
    'Prime Video',
    'Streaming',
    'Trending Now',
    interstellar,
  ),

  makeMovie(
    'Inception',
    'Movie',
    'Thriller',
    'English',
    '2010',
    8.8,
    'JioHotstar',
    'Streaming',
    'Trending Now',
    inception,
  ),

  makeMovie(
    'Dune: Part Two',
    'Movie',
    'Adventure',
    'English',
    '2024',
    8.6,
    'Prime Video',
    'Streaming',
    'Trending Now',
    dune,
  ),

  makeMovie(
    'RRR',
    'Movie',
    'Action',
    'Telugu',
    '2022',
    8.0,
    'Netflix',
    'Streaming',
    'Trending Now',
    rrr,
  ),

  makeMovie(
    'Pushpa: The Rise',
    'Movie',
    'Action',
    'Telugu',
    '2021',
    7.6,
    'Prime Video',
    'Streaming',
    'Trending Now',
    pushpa,
  ),

  makeMovie(
    'Dhurandhar',
    'Movie',
    'Action',
    'Hindi',
    '2025',
    8.0,
    'Netflix',
    'Streaming',
    'Trending Now',
    dhurandhar,
  ),

  makeMovie(
    'Yeh Jawaani Hai Deewani',
    'Movie',
    'Romance',
    'Hindi',
    '2013',
    7.2,
    'Netflix',
    'Streaming',
    'Trending Now',
    yjhd,
  ),

  // ---------------- POPULAR MOVIES ----------------

  makeMovie(
    'The Batman',
    'Movie',
    'Action',
    'English',
    '2022',
    7.8,
    'JioHotstar',
    'Streaming',
    'Popular Movies',
    batman,
  ),

  makeMovie(
    'Avengers: Infinity War',
    'Movie',
    'Action',
    'English',
    '2018',
    8.4,
    'Disney+',
    'Streaming',
    'Popular Movies',
    avengers,
  ),

  makeMovie(
    'Spider-Man: No Way Home',
    'Movie',
    'Action',
    'English',
    '2021',
    8.2,
    'Netflix',
    'Streaming',
    'Popular Movies',
    spiderman,
  ),

  makeMovie(
    'Inside Out 2',
    'Movie',
    'Comedy',
    'English',
    '2024',
    7.6,
    'Disney+',
    'Streaming',
    'Popular Movies',
    insideOut,
  ),

  makeMovie(
    'La La Land',
    'Movie',
    'Romance',
    'English',
    '2016',
    8.0,
    'Prime Video',
    'Streaming',
    'Popular Movies',
    lalaland,
  ),

  makeMovie(
    'The Martian',
    'Movie',
    'Sci-Fi',
    'English',
    '2015',
    8.0,
    'Disney+',
    'Streaming',
    'Popular Movies',
    martian,
  ),

  // ---------------- POPULAR SERIES ----------------

  makeMovie(
    'Stranger Things',
    'Series',
    'Thriller',
    'English',
    '2016',
    8.6,
    'Netflix',
    'Streaming',
    'Popular Series',
    stranger,
    seasons: 5,
  ),

  makeMovie(
    'Wednesday',
    'Series',
    'Comedy',
    'English',
    '2022',
    8.0,
    'Netflix',
    'Streaming',
    'Popular Series',
    wednesday,
    seasons: 2,
  ),

  makeMovie(
    'The Last of Us',
    'Series',
    'Drama',
    'English',
    '2023',
    8.7,
    'JioHotstar',
    'Streaming',
    'Popular Series',
    lastOfUs,
    seasons: 2,
  ),

  makeMovie(
    'The Batman: The Animated Series',
    'Series',
    'Action',
    'English',
    '2019',
    8.6,
    'Prime Video',
    'Streaming',
    'Popular Series',
    batman,
    seasons: 4,
  ),

  makeMovie(
    'Inception: The Series',
    'Series',
    'Thriller',
    'English',
    '2017',
    8.2,
    'Netflix',
    'Streaming',
    'Popular Series',
    inception,
    seasons: 5,
  ),

  makeMovie(
    'Dark',
    'Series',
    'Sci-Fi',
    'English',
    '2017',
    8.7,
    'Netflix',
    'Streaming',
    'Popular Series',
    darkKnight,
    seasons: 3,
  ),

  // ---------------- CURRENTLY IN THEATERS ----------------

  makeMovie(
    'The Paradise',
    'Movie',
    'Action',
    'Telugu',
    '2026',
    7.5,
    'Cinema',
    'In Theaters',
    'Currently in Theaters',
    paradise,
    //backupImage: dhurandhar,
  ),

  makeMovie(
    'A Quiet Place: Day One',
    'Movie',
    'Thriller',
    'English',
    '2024',
    6.7,
    'Prime Video',
    'In Theaters',
    'Currently in Theaters',
    quietPlace,
    //backupImage: insideOut,
  ),

  makeMovie(
    'Kingdom of the Planet',
    'Movie',
    'Adventure',
    'English',
    '2024',
    7.0,
    'Prime Video',
    'In Theaters',
    'Currently in Theaters',
    kingdom,
  ),

  makeMovie(
    'Dhurandhar',
    'Movie',
    'Action',
    'Telugu',
    '2026',
    8.0,
    'Netflix',
    'In Theaters',
    'Currently in Theaters',
    dhurandhar,
  ),


  makeMovie(
    'RRR',
    'Movie',
    'Action',
    'Telugu',
    '2022',
    8.0,
    'Netflix',
    'In Theaters',
    'Currently in Theaters',
    rrr,
  ),

  // ---------------- TELUGU ----------------

  makeMovie(
    'Hi Nanna',
    'Movie',
    'Drama',
    'Telugu',
    '2023',
    8.0,
    'Netflix',
    'Streaming',
    'Telugu Hits',
    hiNanna,
  ),

  makeMovie(
    'Baahubali: The Beginning',
    'Movie',
    'Adventure',
    'Telugu',
    '2015',
    8.0,
    'JioHotstar',
    'Streaming',
    'Telugu Hits',
    bahubali,
  ),

  makeMovie(
    'Mahanati',
    'Movie',
    'Drama',
    'Telugu',
    '2018',
    8.4,
    'Prime Video',
    'Streaming',
    'Telugu Hits',
    mahanati,
  ),

  makeMovie(
    'Pushpa: The Rise',
    'Movie',
    'Action',
    'Telugu',
    '2021',
    7.6,
    'Prime Video',
    'Streaming',
    'Telugu Hits',
    pushpa,
  ),

  makeMovie(
    'RRR',
    'Movie',
    'Action',
    'Telugu',
    '2022',
    8.0,
    'Netflix',
    'Streaming',
    'Telugu Hits',
    rrr,
  ),

  makeMovie(
    'Sita Ramam',
    'Movie',
    'Romance',
    'Telugu',
    '2022',
    8.6,
    'Prime Video',
    'Streaming',
    'Telugu Hits',
    sitaRamam,
  ),

  // ---------------- HINDI ----------------

  makeMovie(
    'Yeh Jawaani Hai Deewani',
    'Movie',
    'Romance',
    'Hindi',
    '2013',
    7.2,
    'Netflix',
    'Streaming',
    'Hindi Hits',
    yjhd,
  ),

  makeMovie(
    'KGF: Chapter 1',
    'Movie',
    'Action',
    'Hindi',
    '2018',
    8.2,
    'Prime Video',
    'Streaming',
    'Hindi Hits',
    kgf,
  ),

  makeMovie(
    'Kantara',
    'Movie',
    'Thriller',
    'Hindi',
    '2022',
    8.2,
    'Netflix',
    'Streaming',
    'Hindi Hits',
    kantara,
  ),

  makeMovie(
    'Jersey',
    'Movie',
    'Drama',
    'Hindi',
    '2022',
    7.3,
    'Netflix',
    'Streaming',
    'Hindi Hits',
    jersey,
  ),

  makeMovie(
    'Stree 2',
    'Movie',
    'Comedy',
    'Hindi',
    '2024',
    7.0,
    'Prime Video',
    'Streaming',
    'Hindi Hits',
    stree2,
  ),

  makeMovie(
    '3 Idiots',
    'Movie',
    'Comedy',
    'Hindi',
    '2009',
    8.4,
    'Netflix',
    'Streaming',
    'Hindi Hits',
    threeIdiots,
  ),
];

// ============================================================
// APP
// ============================================================

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Explorer',

      theme: ThemeData(
        useMaterial3: true,
        brightness:
            darkMode ? Brightness.dark : Brightness.light,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE7B94D),
          brightness:
              darkMode ? Brightness.dark : Brightness.light,
        ),

        scaffoldBackgroundColor:
            darkMode
                ? const Color(0xFF09090B)
                : const Color(0xFFF5F3EE),

        cardTheme: CardThemeData(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),

        inputDecorationTheme:
            InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),

      initialRoute: '/login',

      routes: {
        '/login': (_) => const LoginPage(),

        '/': (_) => Shell(
              dark: darkMode,
              onTheme: (value) {
                setState(
                  () => darkMode = value,
                );
              },
            ),

        '/search': (_) => const SearchPage(),

        '/categories':
            (_) => const CategoriesPage(),

        '/theaters':
            (_) => const TheatersPage(),

        '/favorites':
            (_) => const FavoritesPage(),

        '/profile':
            (_) => ProfilePage(
                  dark: darkMode,
                  onTheme: (value) {
                    setState(
                      () => darkMode = value,
                    );
                  },
                ),
      },
    );
  }
}

// ============================================================
// LOGIN
// ============================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState
    extends State<LoginPage> {

  final formKey =
      GlobalKey<FormState>();

  final nameController =
      TextEditingController();

  final emailController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.all(24),

          child: ConstrainedBox(
            constraints:
                const BoxConstraints(
              maxWidth: 470,
            ),

            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.all(28),

                child: Form(
                  key: formKey,

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch,

                    children: [

                      Container(
                        width: 78,
                        height: 78,

                        decoration:
                            BoxDecoration(
                          color:
                              const Color(
                            0xFFE7B94D,
                          ),
                          borderRadius:
                              BorderRadius.circular(
                            24,
                          ),
                        ),

                        child:
                            const Icon(
                          Icons
                              .movie_filter_rounded,
                          color:
                              Colors.black,
                          size: 45,
                        ),
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        'Movie Explorer',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight:
                              FontWeight.w900,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Discover movies, series and stories you’ll love.',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 28),

                      TextFormField(
                        controller:
                            nameController,

                        decoration:
                            const InputDecoration(
                          labelText:
                              'Your Name',
                          prefixIcon:
                              Icon(
                            Icons.person_outline,
                          ),
                        ),

                        validator: (value) {
                          if (value == null ||
                              value
                                  .trim()
                                  .isEmpty) {
                            return 'Enter your name';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 15),

                      TextFormField(
                        controller:
                            emailController,

                        keyboardType:
                            TextInputType
                                .emailAddress,

                        decoration:
                            const InputDecoration(
                          labelText:
                              'Email Address',
                          prefixIcon:
                              Icon(
                            Icons.email_outlined,
                          ),
                        ),

                        validator: (value) {
                          if (value == null ||
                              !value.contains(
                                '@',
                              )) {
                            return 'Enter a valid email';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 22),

                      ElevatedButton.icon(
                        onPressed: () {
                          if (!formKey
                              .currentState!
                              .validate()) {
                            return;
                          }

                          context
                              .read<
                                  MovieProvider>()
                              .login(
                                nameController
                                    .text,
                                emailController
                                    .text,
                              );

                          Navigator
                              .pushReplacementNamed(
                            context,
                            '/',
                          );
                        },

                        icon:
                            const Icon(
                          Icons.login,
                        ),

                        label:
                            const Text(
                          'Enter Movie Explorer',
                        ),
                      ),

                      const SizedBox(height: 12),

                      // const Text(
                      //   'Demo login only • no account or password is stored.',
                      //   textAlign:
                      //       TextAlign.center,
                      //   style: TextStyle(
                      //     fontSize: 12,
                      //     color: Colors.grey,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// SHELL
// ============================================================

class Shell extends StatefulWidget {
  final bool dark;
  final ValueChanged<bool> onTheme;

  const Shell({
    super.key,
    required this.dark,
    required this.onTheme,
  });

  @override
  State<Shell> createState() =>
      _ShellState();
}

class _ShellState
    extends State<Shell> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final pages = [
      const HomePage(),
      const FavoritesPage(),
      const SearchPage(),

      ProfilePage(
        dark: widget.dark,
        onTheme: widget.onTheme,
      ),
    ];

    return Scaffold(
      body:
          SafeArea(
        child:
            pages[selectedIndex],
      ),

      bottomNavigationBar:
          NavigationBar(
        selectedIndex:
            selectedIndex,

        onDestinationSelected:
            (value) {
          setState(
            () => selectedIndex = value,
          );
        },

        destinations: const [

          NavigationDestination(
            icon:
                Icon(
              Icons.home_outlined,
            ),
            selectedIcon:
                Icon(
              Icons.home,
            ),
            label:
                'Home',
          ),

          NavigationDestination(
            icon:
                Icon(
              Icons.favorite_border,
            ),
            selectedIcon:
                Icon(
              Icons.favorite,
            ),
            label:
                'Favorites',
          ),

          NavigationDestination(
            icon:
                Icon(
              Icons.search,
            ),
            label:
                'Search',
          ),

          NavigationDestination(
            icon:
                Icon(
              Icons.person_outline,
            ),
            selectedIcon:
                Icon(
              Icons.person,
            ),
            label:
                'Profile',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HOME
// ============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<Movie> getSix(
    MovieProvider provider,
    String category,
  ) {
    final result =
        <Movie>[];

    final titles =
        <String>{};

    for (final movie
        in provider.section(
      category,
    )) {
      if (titles.add(
        movie.title,
      )) {
        result.add(movie);
      }

      if (result.length == 6) {
        break;
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<
            MovieProvider>();

    final trending =
        getSix(
      provider,
      'Trending Now',
    );

    return CustomScrollView(
      slivers: [

        // HEADER
        SliverAppBar(
          floating: true,

          title: Row(
            children: [

              Container(
                padding:
                    const EdgeInsets.all(
                  7,
                ),

                decoration:
                    BoxDecoration(
                  color:
                      const Color(
                    0xFFE7B94D,
                  ),

                  borderRadius:
                      BorderRadius.circular(
                    11,
                  ),
                ),

                child:
                    const Icon(
                  Icons
                      .movie_filter_rounded,
                  color:
                      Colors.black,
                  size: 24,
                ),
              ),

              const SizedBox(
                width: 10,
              ),

              const Text(
                'Movie Explorer',
                style:
                    TextStyle(
                  fontWeight:
                      FontWeight.w800,
                ),
              ),
            ],
          ),

          actions: [

            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(
                context,
                '/search',
              ),
              icon:
                  const Icon(
                Icons.search_rounded,
              ),
            ),

            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(
                context,
                '/profile',
              ),
              icon:
                  const Icon(
                Icons.person_outline_rounded,
              ),
            ),

            const SizedBox(
              width: 8,
            ),
          ],
        ),

        // FEATURED
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.fromLTRB(
              16,
              14,
              16,
              20,
            ),

            child: Featured(
  movie: provider.movies.firstWhere(
    (movie) => movie.title == 'Mahanati',
  ),
),
          ),
        ),

        // QUICK FILTERS
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 16,
            ),

            child: Wrap(
              spacing: 10,
              runSpacing: 10,

              children: [

                ActionChip(
                  avatar:
                      const Icon(
                    Icons.translate,
                    size: 18,
                  ),

                  label:
                      const Text(
                    'Languages',
                  ),

                  onPressed: () =>
                      Navigator.pushNamed(
                    context,
                    '/categories',
                  ),
                ),

                ActionChip(
                  avatar:
                      const Icon(
                    Icons.category_outlined,
                    size: 18,
                  ),

                  label:
                      const Text(
                    'Genres',
                  ),

                  onPressed: () =>
                      Navigator.pushNamed(
                    context,
                    '/categories',
                  ),
                ),

                ActionChip(
                  avatar:
                      const Icon(
                    Icons.theaters_outlined,
                    size: 18,
                  ),

                  label:
                      const Text(
                    'Theaters',
                  ),

                  onPressed: () =>
                      Navigator.pushNamed(
                    context,
                    '/theaters',
                  ),
                ),
              ],
            ),
          ),
        ),

        const SliverToBoxAdapter(
          child:
              SizedBox(
            height: 20,
          ),
        ),

        // TRENDING
        SliverToBoxAdapter(
          child:
              Section(
            title:
                '🔥 Trending Now',
            movies:
                trending,
          ),
        ),

        // TELUGU
        SliverToBoxAdapter(
          child:
              Section(
            title:
                '🇮🇳 Indian Spotlight • Telugu',
            movies:
                getSix(
              provider,
              'Telugu Hits',
            ),
          ),
        ),

        // HINDI
        SliverToBoxAdapter(
          child:
              Section(
            title:
                '🇮🇳 Indian Spotlight • Hindi',
            movies:
                getSix(
              provider,
              'Hindi Hits',
            ),
          ),
        ),

        // POPULAR MOVIES
        SliverToBoxAdapter(
          child:
              Section(
            title:
                '⭐ Popular Movies',
            movies:
                getSix(
              provider,
              'Popular Movies',
            ),
          ),
        ),

        // SERIES
        SliverToBoxAdapter(
          child:
              Section(
            title:
                '🎬 Popular Series',
            movies:
                getSix(
              provider,
              'Popular Series',
            ),
          ),
        ),

        // THEATERS
        SliverToBoxAdapter(
          child:
              Section(
            title:
                '🎟 Currently in Theaters',
            movies:
                getSix(
              provider,
              'Currently in Theaters',
            ),
          ),
        ),

        const SliverToBoxAdapter(
          child:
              SizedBox(
            height: 30,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// FEATURED
// ============================================================

class Featured extends StatelessWidget {
  final Movie movie;

  const Featured({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<
            MovieProvider>();

    return SizedBox(
      height: 400,

      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(
          26,
        ),

        child: Stack(
          fit:
              StackFit.expand,

          children: [

            MoviePoster(movie),

            Container(
              decoration:
                  const BoxDecoration(
                gradient:
                    LinearGradient(
                  begin:
                      Alignment.topCenter,
                  end:
                      Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xE8000000),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 16,
              left: 16,

              child: Chip(
                label:
                    Text(
                  'FEATURED • ${movie.language}',
                ),
              ),
            ),

            Positioned(
              top: 12,
              right: 12,

              child:
                  IconButton.filled(
                onPressed: () =>
                    provider.toggleFavorite(
                  movie,
                ),

                icon:
                    Icon(
                  provider.isFavorite(
                    movie,
                  )
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
              ),
            ),

            Positioned(
              left: 22,
              right: 22,
              bottom: 22,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    movie.title,

                    style:
                        const TextStyle(
                      fontSize: 32,
                      fontWeight:
                          FontWeight.w900,
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  Row(
                    children: [
                      Rating(
                        movie.rating,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        movie.language,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        movie.year,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  ElevatedButton.icon(
                    onPressed: () =>
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            DetailsPage(
                          movie: movie,
                        ),
                      ),
                    ),

                    icon:
                        const Icon(
                      Icons.play_arrow,
                    ),

                    label:
                        const Text(
                      'Explore Details',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SECTION - 6 CARDS + SPACING
// ============================================================

class Section extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  const Section({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {

    if (movies.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding:
          const EdgeInsets.only(
        top: 25,
        bottom: 8,
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 20,
            ),

            child: Row(
              children: [

                Expanded(
                  child: Text(
                    title,

                    style:
                        const TextStyle(
                      fontSize: 21,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  child:
                      const Text(
                    'Explore',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 12,
          ),

          LayoutBuilder(
            builder:
                (
              context,
              constraints,
            ) {

              // ==========================================
              // DESKTOP = EXACTLY 6 MOVIES IN ONE ROW
              // ==========================================

              if (constraints.maxWidth >= 1200) {

                final visible =
                    movies
                        .take(6)
                        .toList();

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),

                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      for (
                        int i = 0;
                        i < visible.length;
                        i++
                      ) ...[

                        Expanded(
                          child:
                              SizedBox(
                            height: 320,
                            child:
                                MovieCard(
                              movie:
                                  visible[i],
                            ),
                          ),
                        ),

                        // IMPORTANT:
                        // SPACE BETWEEN CARDS
                        if (
                            i !=
                                visible.length - 1)
                          const SizedBox(
                            width: 22,
                          ),
                      ],
                    ],
                  ),
                );
              }

              // ==========================================
              // TABLET / MOBILE = HORIZONTAL SCROLL
              // ==========================================

              return SizedBox(
                height: 320,

                child:
                    ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),

                  scrollDirection:
                      Axis.horizontal,

                  itemCount:
                      movies.length,

                  separatorBuilder:
                      (_, __) =>
                          const SizedBox(
                    width: 18,
                  ),

                  itemBuilder:
                      (_, index) {

                    return SizedBox(
                      width:
                          constraints.maxWidth >=
                                  700
                              ? 205
                              : 185,

                      child:
                          MovieCard(
                        movie:
                            movies[index],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ============================================================
// MOVIE CARD
// ============================================================

class MovieCard
    extends StatefulWidget {

  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  State<MovieCard> createState() =>
      _MovieCardState();
}

class _MovieCardState
    extends State<MovieCard> {

  bool hover = false;

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<
            MovieProvider>();

    final movie =
        widget.movie;

    return MouseRegion(
      onEnter: (_) =>
          setState(
        () => hover = true,
      ),

      onExit: (_) =>
          setState(
        () => hover = false,
      ),

      child:
          AnimatedScale(
        scale:
            hover ? 1.025 : 1,

        duration:
            const Duration(
          milliseconds: 150,
        ),

        child: Card(
          elevation:
              hover ? 8 : 2,

          clipBehavior:
              Clip.antiAlias,

          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(
              18,
            ),

            side:
                BorderSide(
              color: hover
                  ? const Color(
                      0x66E7B94D,
                    )
                  : Colors.white
                      .withOpacity(
                    .05,
                  ),
            ),
          ),

          child:
              InkWell(
            onTap: () =>
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    DetailsPage(
                  movie: movie,
                ),
              ),
            ),

            child:
                Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Expanded(
                  child:
                      Stack(
                    fit:
                        StackFit.expand,

                    children: [

                      MoviePoster(
                        movie,
                      ),

                      Positioned(
                        top: 5,
                        right: 5,

                        child:
                            IconButton.filled(
                          style:
                              IconButton.styleFrom(
                            backgroundColor:
                                Colors.black54,
                            foregroundColor:
                                Colors.white,
                          ),

                          iconSize:
                              18,

                          onPressed: () =>
                              provider
                                  .toggleFavorite(
                            movie,
                          ),

                          icon:
                              Icon(
                            provider
                                    .isFavorite(
                                  movie,
                                )
                                ? Icons.favorite
                                : Icons.favorite_border,

                            color: provider
                                    .isFavorite(
                                  movie,
                                )
                                ? Colors.redAccent
                                : null,
                          ),
                        ),
                      ),

                      Positioned(
                        left: 8,
                        bottom: 8,

                        child:
                            Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),

                          decoration:
                              BoxDecoration(
                            color:
                                Colors.black87,

                            borderRadius:
                                BorderRadius.circular(
                              20,
                            ),
                          ),

                          child:
                              Text(
                            movie.language,

                            style:
                                const TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.fromLTRB(
                    10,
                    8,
                    10,
                    10,
                  ),

                  child:
                      Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Text(
                        movie.title,

                        maxLines:
                            1,

                        overflow:
                            TextOverflow.ellipsis,

                        style:
                            const TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      Row(
                        children: [

                          Rating(
                            movie.rating,
                          ),

                          const SizedBox(
                            width: 7,
                          ),

                          Expanded(
                            child:
                                Text(
                              movie.genre,

                              maxLines:
                                  1,

                              overflow:
                                  TextOverflow.ellipsis,

                              style:
                                  const TextStyle(
                                color:
                                    Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// POSTER WITH BACKUP
// ============================================================

class MoviePoster
    extends StatefulWidget {

  final Movie movie;

  const MoviePoster(
    this.movie, {
    super.key,
  });

  @override
  State<MoviePoster> createState() =>
      _MoviePosterState();
}

class _MoviePosterState
    extends State<MoviePoster> {

  late String currentUrl;

  bool backupUsed = false;
  bool failed = false;

  @override
  void initState() {
    super.initState();

    currentUrl =
        widget.movie.image;
  }

  void tryBackup() {

    if (!backupUsed &&
        widget.movie.backupImage !=
            null) {

      setState(() {
        backupUsed = true;

        currentUrl =
            widget.movie.backupImage!;
      });

    } else {

      if (mounted) {
        setState(
          () => failed = true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    if (failed) {
      return Container(
        decoration:
            const BoxDecoration(
          gradient:
              LinearGradient(
            colors: [
              Color(0xFF282828),
              Color(0xFF101010),
            ],
          ),
        ),

        child:
            const Center(
          child:
              Icon(
            Icons.movie_filter_rounded,
            size: 52,
            color:
                Color(0xFFE7B94D),
          ),
        ),
      );
    }

    return Image.network(
      currentUrl,

      fit:
          BoxFit.cover,

      filterQuality:
          FilterQuality.high,

      loadingBuilder:
          (
        context,
        child,
        progress,
      ) {

        if (progress == null) {
          return child;
        }

        return const ColoredBox(
          color:
              Color(0xFF181818),

          child:
              Center(
            child:
                CircularProgressIndicator(
              strokeWidth: 2,
              color:
                  Color(0xFFE7B94D),
            ),
          ),
        );
      },

      errorBuilder:
          (
        context,
        error,
        stackTrace,
      ) {

        WidgetsBinding
            .instance
            .addPostFrameCallback(
          (_) {
            if (mounted) {
              tryBackup();
            }
          },
        );

        return const ColoredBox(
          color:
              Color(0xFF181818),
        );
      },
    );
  }
}

// ============================================================
// RATING
// ============================================================

class Rating
    extends StatelessWidget {

  final double value;

  const Rating(
    this.value, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize:
          MainAxisSize.min,

      children: [

        const Icon(
          Icons.star_rounded,
          color:
              Color(0xFFE7B94D),
          size: 17,
        ),

        const SizedBox(
          width: 3,
        ),

        Text(
          value.toStringAsFixed(
            1,
          ),

          style:
              const TextStyle(
            fontWeight:
                FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// DETAILS
// ============================================================

class DetailsPage
    extends StatelessWidget {

  final Movie movie;

  const DetailsPage({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<
            MovieProvider>();

    return Scaffold(
      appBar:
          AppBar(
        title:
            const Text(
          'Movie Details',
        ),

        actions: [

          IconButton(
            onPressed: () =>
                provider
                    .toggleFavorite(
              movie,
            ),

            icon:
                Icon(
              provider.isFavorite(
                movie,
              )
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
          ),
        ],
      ),

      body:
          SingleChildScrollView(
        padding:
            const EdgeInsets.all(
          20,
        ),

        child:
            LayoutBuilder(
          builder:
              (
            context,
            constraints,
          ) {

            final wide =
                constraints.maxWidth >=
                    800;

            final poster =
                ClipRRect(
              borderRadius:
                  BorderRadius.circular(
                22,
              ),

              child:
                  SizedBox(
                width:
                    wide
                        ? 340
                        : double.infinity,

                height:
                    wide
                        ? 500
                        : 420,

                child:
                    MoviePoster(
                  movie,
                ),
              ),
            );

            final info =
                Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Wrap(
                  spacing: 8,

                  children: [

                    Chip(
                      label:
                          Text(
                        movie.type,
                      ),
                    ),

                    Chip(
                      label:
                          Text(
                        movie.language,
                      ),
                    ),

                    Chip(
                      label:
                          Text(
                        movie.availability,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                Text(
                  movie.title,

                  style:
                      const TextStyle(
                    fontSize: 34,
                    fontWeight:
                        FontWeight.w900,
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),

                Text(
                  '${movie.genre} • ${movie.year}',
                ),

                const SizedBox(
                  height: 8,
                ),

                Rating(
                  movie.rating,
                ),

                const SizedBox(
                  height: 22,
                ),

                const Text(
                  'Description',

                  style:
                      TextStyle(
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 7,
                ),

                Text(
                  movie.description,

                  style:
                      const TextStyle(
                    height: 1.6,
                    color:
                        Colors.grey,
                  ),
                ),

                const SizedBox(
                  height: 18,
                ),

                const Text(
                  'Where to Watch',

                  style:
                      TextStyle(
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 7,
                ),

                Text(
                  movie.platform,

                  style:
                      const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    fontSize: 17,
                  ),
                ),

                if (movie.seasons !=
                    null)
                  Padding(
                    padding:
                        const EdgeInsets.only(
                      top: 10,
                    ),

                    child:
                        Text(
                      'Seasons: ${movie.seasons}',
                    ),
                  ),

                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width:
                      wide
                          ? 360
                          : double.infinity,

                  child:
                      ElevatedButton.icon(
                    onPressed: () =>
                        provider
                            .toggleFavorite(
                      movie,
                    ),

                    icon:
                        Icon(
                      provider
                              .isFavorite(
                            movie,
                          )
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),

                    label:
                        Text(
                      provider
                              .isFavorite(
                            movie,
                          )
                          ? 'Remove from Favorites'
                          : 'Add to Favorites',
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                const Text(
                  'Theater/OTT availability is demo data, not live.',

                  style:
                      TextStyle(
                    fontSize: 12,
                    color:
                        Colors.grey,
                  ),
                ),
              ],
            );

            if (wide) {
              return Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  poster,

                  const SizedBox(
                    width: 28,
                  ),

                  Expanded(
                    child:
                        info,
                  ),
                ],
              );
            }

            return Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                poster,

                const SizedBox(
                  height: 24,
                ),

                info,
              ],
            );
          },
        ),
      ),
    );
  }
}

// ============================================================
// SEARCH
// ============================================================

class SearchPage
    extends StatefulWidget {

  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() =>
      _SearchPageState();
}

class _SearchPageState
    extends State<SearchPage> {

  final controller =
      TextEditingController();

  String filter = 'All';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<
            MovieProvider>();

    var results =
        provider.search(
      controller.text,
    );

    if (filter != 'All') {

      results =
          results.where(
        (movie) {

          return movie.language ==
                  filter ||
              movie.genre ==
                  filter ||
              movie.type ==
                  filter;
        },
      ).toList();
    }

    const filters = [
      'All',
      'Hindi',
      'Telugu',
      'English',
      'Action',
      'Drama',
      'Thriller',
      'Comedy',
      'Movie',
      'Series',
    ];

    return Scaffold(
      appBar:
          AppBar(
        title:
            const Text(
          'Search Movies & Series',
        ),
      ),

      body:
          Padding(
        padding:
            const EdgeInsets.all(
          16,
        ),

        child:
            Column(
          children: [

            TextField(
              controller:
                  controller,

              onChanged: (_) =>
                  setState(
                () {},
              ),

              decoration:
                  const InputDecoration(
                prefixIcon:
                    Icon(
                  Icons.search,
                ),

                hintText:
                    'Search title, language, genre, OTT...',
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            SingleChildScrollView(
              scrollDirection:
                  Axis.horizontal,

              child:
                  Row(
                children: [

                  for (final item
                      in filters)

                    Padding(
                      padding:
                          const EdgeInsets.only(
                        right: 7,
                      ),

                      child:
                          ChoiceChip(
                        label:
                            Text(
                          item,
                        ),

                        selected:
                            filter ==
                                item,

                        onSelected:
                            (_) {

                          setState(
                            () =>
                                filter =
                                    item,
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(
              height: 14,
            ),

            Expanded(
              child:
                  GridView.builder(
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount:
                      MediaQuery
                                  .sizeOf(
                                context,
                              )
                              .width >=
                          1500
                      ? 6
                      : MediaQuery
                                  .sizeOf(
                                context,
                              )
                              .width >=
                          900
                          ? 4
                          : 2,

                  childAspectRatio:
                      .62,

                  crossAxisSpacing:
                      18,

                  mainAxisSpacing:
                      18,
                ),

                itemCount:
                    results.length,

                itemBuilder:
                    (_, index) {

                  return MovieCard(
                    movie:
                        results[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// CATEGORIES
// ============================================================

class CategoriesPage
    extends StatefulWidget {

  const CategoriesPage({
    super.key,
  });

  @override
  State<CategoriesPage> createState() =>
      _CategoriesPageState();
}

class _CategoriesPageState
    extends State<CategoriesPage> {

  String mode =
      'Languages';

  String type =
      'All';

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<
            MovieProvider>();

    final items =
        mode == 'Languages'
            ? [
                'Hindi',
                'Telugu',
                'English',
              ]
            : [
                'Action',
                'Adventure',
                'Comedy',
                'Drama',
                'Romance',
                'Sci-Fi',
                'Thriller',
              ];

    return Scaffold(
      appBar:
          AppBar(
        title:
            const Text(
          'Categories',
        ),
      ),

      body:
          SingleChildScrollView(
        padding:
            const EdgeInsets.all(
          16,
        ),

        child:
            Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            SegmentedButton<String>(
              segments: const [

                ButtonSegment(
                  value:
                      'Languages',
                  label:
                      Text(
                    'Languages',
                  ),
                  icon:
                      Icon(
                    Icons.translate,
                  ),
                ),

                ButtonSegment(
                  value:
                      'Genres',
                  label:
                      Text(
                    'Genres',
                  ),
                  icon:
                      Icon(
                    Icons.category_outlined,
                  ),
                ),
              ],

              selected:
                  {mode},

              onSelectionChanged:
                  (selection) {

                setState(
                  () =>
                      mode =
                          selection.first,
                );
              },
            ),

            if (mode == 'Genres')

              Padding(
                padding:
                    const EdgeInsets.only(
                  top: 14,
                ),

                child:
                    SegmentedButton<String>(
                  segments: const [

                    ButtonSegment(
                      value:
                          'All',
                      label:
                          Text(
                        'All',
                      ),
                    ),

                    ButtonSegment(
                      value:
                          'Movie',
                      label:
                          Text(
                        'Movies',
                      ),
                    ),

                    ButtonSegment(
                      value:
                          'Series',
                      label:
                          Text(
                        'Series',
                      ),
                    ),
                  ],

                  selected:
                      {type},

                  onSelectionChanged:
                      (selection) {

                    setState(
                      () =>
                          type =
                              selection.first,
                    );
                  },
                ),
              ),

            const SizedBox(
              height: 18,
            ),

            Wrap(
              spacing: 10,
              runSpacing: 10,

              children: [

                for (final item
                    in items)

                  ActionChip(
                    label:
                        Text(
                      item,
                    ),

                    onPressed: () {

                      final list =
                          mode ==
                                  'Languages'
                              ? provider
                                  .language(
                                    item,
                                  )
                              : provider
                                  .genre(
                                    item,
                                  )
                                  .where(
                                    (movie) =>
                                        type ==
                                            'All' ||
                                        movie.type ==
                                            type,
                                  )
                                  .toList();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              FilteredPage(
                            title:
                                item,
                            movies:
                                list,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// FILTERED PAGE
// ============================================================

class FilteredPage
    extends StatelessWidget {

  final String title;
  final List<Movie> movies;

  const FilteredPage({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
          AppBar(
        title:
            Text(title),
      ),

      body:
          Padding(
        padding:
            const EdgeInsets.all(
          18,
        ),

        child:
            GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount:
                MediaQuery
                            .sizeOf(
                          context,
                        )
                        .width >=
                    1500
                    ? 6
                    : MediaQuery
                                .sizeOf(
                              context,
                            )
                            .width >=
                        900
                        ? 4
                        : 2,

            childAspectRatio:
                .62,

            crossAxisSpacing:
                18,

            mainAxisSpacing:
                18,
          ),

          itemCount:
              movies.length,

          itemBuilder:
              (_, index) {

            return MovieCard(
              movie:
                  movies[index],
            );
          },
        ),
      ),
    );
  }
}

// ============================================================
// THEATERS
// ============================================================

class TheatersPage
    extends StatelessWidget {

  const TheatersPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final movies =
        context
            .watch<
                MovieProvider>()
            .theaters();

    return Scaffold(
      appBar:
          AppBar(
        title:
            const Text(
          'Currently in Theaters',
        ),
      ),

      body:
          Padding(
        padding:
            const EdgeInsets.all(
          18,
        ),

        child:
            GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount:
                MediaQuery
                            .sizeOf(
                          context,
                        )
                        .width >=
                    1500
                    ? 6
                    : MediaQuery
                                .sizeOf(
                              context,
                            )
                            .width >=
                        900
                        ? 4
                        : 2,

            childAspectRatio:
                .62,

            crossAxisSpacing:
                18,

            mainAxisSpacing:
                18,
          ),

          itemCount:
              movies.length,

          itemBuilder:
              (_, index) {

            return MovieCard(
              movie:
                  movies[index],
            );
          },
        ),
      ),
    );
  }
}

// ============================================================
// FAVORITES
// ============================================================

class FavoritesPage
    extends StatelessWidget {

  const FavoritesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final favorites =
        context
            .watch<
                MovieProvider>()
            .favorites;

    return Scaffold(
      appBar:
          AppBar(
        title:
            const Text(
          'Favorites',
        ),
      ),

      body:
          favorites.isEmpty

              ? const Center(
                  child:
                      Column(
                    mainAxisSize:
                        MainAxisSize.min,

                    children: [

                      Icon(
                        Icons.favorite_border,
                        size: 60,
                        color:
                            Colors.grey,
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        'No favorites yet',
                      ),

                      Text(
                        'Tap ♥ on a movie to save it.',
                      ),
                    ],
                  ),
                )

              : Padding(
                  padding:
                      const EdgeInsets.all(
                    18,
                  ),

                  child:
                      GridView.builder(
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(

                      crossAxisCount:
                          MediaQuery
                                      .sizeOf(
                                    context,
                                  )
                                  .width >=
                              1500
                          ? 6
                          : MediaQuery
                                      .sizeOf(
                                    context,
                                  )
                                  .width >=
                              900
                              ? 4
                              : 2,

                      childAspectRatio:
                          .62,

                      crossAxisSpacing:
                          18,

                      mainAxisSpacing:
                          18,
                    ),

                    itemCount:
                        favorites.length,

                    itemBuilder:
                        (_, index) {

                      return MovieCard(
                        movie:
                            favorites[index],
                      );
                    },
                  ),
                ),
    );
  }
}

// ============================================================
// PROFILE
// ============================================================

class ProfilePage
    extends StatefulWidget {

  final bool dark;
  final ValueChanged<bool>
      onTheme;

  const ProfilePage({
    super.key,
    required this.dark,
    required this.onTheme,
  });

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState();
}

class _ProfilePageState
    extends State<ProfilePage> {

  bool notifications =
      true;

  final notes =
      const [

    AppNotification(
      'Now in Theaters',
      'The Paradise is first in our current-theaters list, followed by more cinema picks.',
      'Today',
      Icons.theaters_outlined,
    ),

    AppNotification(
      'Indian Spotlight',
      'Hi Nanna, Yeh Jawaani Hai Deewani and Dhurandhar are now highlighted.',
      'Today',
      Icons.language,
    ),

    AppNotification(
      'Netflix Picks',
      'RRR, Stranger Things and Hindi favorites are highlighted in the demo catalog.',
      'Yesterday',
      Icons.play_circle_outline,
    ),

    AppNotification(
      'Prime Video',
      'Dune: Part Two and The Martian are featured in the demo OTT section.',
      '2 days ago',
      Icons.live_tv_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<
            MovieProvider>();

    return Scaffold(
      appBar:
          AppBar(
        title:
            const Text(
          'Profile',
        ),
      ),

      body:
          ListView(
        padding:
            const EdgeInsets.all(
          20,
        ),

        children: [

          // USER
          Card(
            child:
                Padding(
              padding:
                  const EdgeInsets.all(
                22,
              ),

              child:
                  Row(
                children: [

                  const CircleAvatar(
                    radius: 42,

                    backgroundColor:
                        Color(
                      0xFFE7B94D,
                    ),

                    child:
                        Icon(
                      Icons.person,
                      size: 46,
                      color:
                          Colors.black,
                    ),
                  ),

                  const SizedBox(
                    width: 16,
                  ),

                  Expanded(
                    child:
                        Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          provider.userName
                                  .isEmpty
                              ? 'Movie Explorer User'
                              : provider
                                  .userName,

                          style:
                              const TextStyle(
                            fontSize: 24,
                            fontWeight:
                                FontWeight.w800,
                          ),
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        Text(
                          provider.userEmail
                                  .isEmpty
                              ? 'user@example.com'
                              : provider
                                  .userEmail,

                          style:
                              const TextStyle(
                            color:
                                Colors.grey,
                          ),
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        const Chip(
                          label:
                              Text(
                            'Demo Profile',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          // STATS
          Card(
            child:
                Padding(
              padding:
                  const EdgeInsets.all(
                18,
              ),

              child:
                  Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceAround,

                children: [

                  stat(
                    'Favorites',
                    '${provider.favorites.length}',
                    Icons.favorite,
                  ),

                  stat(
                    'Languages',
                    '3',
                    Icons.translate,
                  ),

                  stat(
                    'Catalog',
                    '${provider.movies.length}',
                    Icons.movie_outlined,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          // SETTINGS
          Card(
            child:
                Column(
              children: [

                SwitchListTile(
                  title:
                      const Text(
                    'Dark Mode',
                  ),

                  secondary:
                      const Icon(
                    Icons.dark_mode_outlined,
                  ),

                  value:
                      widget.dark,

                  onChanged:
                      widget.onTheme,
                ),

                const Divider(
                  height: 1,
                ),

                SwitchListTile(
                  title:
                      const Text(
                    'Notifications',
                  ),

                  subtitle:
                      const Text(
                    'Movie and OTT updates',
                  ),

                  secondary:
                      const Icon(
                    Icons.notifications_outlined,
                  ),

                  value:
                      notifications,

                  onChanged:
                      (value) {

                    setState(
                      () =>
                          notifications =
                              value,
                    );
                  },
                ),

                const Divider(
                  height: 1,
                ),

                ListTile(
                  leading:
                      const Icon(
                    Icons.notifications_active_outlined,
                  ),

                  title:
                      const Text(
                    'View Notifications',
                  ),

                  subtitle:
                      const Text(
                    'Theater and OTT updates',
                  ),

                  trailing:
                      const Icon(
                    Icons.chevron_right,
                  ),

                  onTap:
                      notifications
                          ? () =>
                              showNotifications(
                                context,
                              )
                          : null,
                ),

                const Divider(
                  height: 1,
                ),

                ListTile(
                  leading:
                      const Icon(
                    Icons.info_outline,
                  ),

                  title:
                      const Text(
                    'About Movie Explorer',
                  ),

                  onTap: () =>
                      showAboutDialog(
                    context:
                        context,

                    applicationName:
                        'Movie Explorer',

                    applicationVersion:
                        '2.0.0',

                    children:
                        const [
                      Text(
                        'Flutter movie and series discovery demo.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget stat(
    String title,
    String value,
    IconData icon,
  ) {
    return Column(
      children: [

        Icon(
          icon,
          color:
              const Color(
            0xFFE7B94D,
          ),
        ),

        const SizedBox(
          height: 4,
        ),

        Text(
          value,

          style:
              const TextStyle(
            fontSize: 22,
            fontWeight:
                FontWeight.bold,
          ),
        ),

        Text(
          title,

          style:
              const TextStyle(
            color:
                Colors.grey,
          ),
        ),
      ],
    );
  }

  void showNotifications(
    BuildContext context,
  ) {

    showModalBottomSheet(
      context:
          context,

      isScrollControlled:
          true,

      showDragHandle:
          true,

      builder:
          (_) {

        return SafeArea(
          child:
              SizedBox(
            height:
                MediaQuery
                        .sizeOf(
                      context,
                    )
                    .height *
                    .72,

            child:
                ListView(
              padding:
                  const EdgeInsets.all(
                18,
              ),

              children: [

                const Text(
                  'Notifications',

                  style:
                      TextStyle(
                    fontSize: 25,
                    fontWeight:
                        FontWeight.w800,
                  ),
                ),

                const SizedBox(
                  height: 12,
                ),

                for (final notification
                    in notes)

                  Card(
                    margin:
                        const EdgeInsets.only(
                      bottom: 12,
                    ),

                    child:
                        ListTile(
                      leading:
                          CircleAvatar(
                        backgroundColor:
                            const Color(
                          0xFFE7B94D,
                        ),

                        foregroundColor:
                            Colors.black,

                        child:
                            Icon(
                          notification.icon,
                        ),
                      ),

                      title:
                          Text(
                        notification.title,

                        style:
                            const TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      subtitle:
                          Padding(
                        padding:
                            const EdgeInsets.only(
                          top: 5,
                        ),

                        child:
                            Text(
                          notification.message,
                        ),
                      ),

                      trailing:
                          Text(
                        notification.time,

                        style:
                            const TextStyle(
                          fontSize: 11,
                          color:
                              Colors.grey,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}