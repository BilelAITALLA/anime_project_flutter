class Movie {
  String poster;
  String title;
  String categories;
  int year;
  int episodes;
  String description;
  String trailer;
  List<String> screenshots;

  Movie({
    this.poster,
    this.title,
    this.categories,
    this.year,
    this.episodes,
    this.description,
    this.screenshots,
    this.trailer,
  });
}

final List<Movie> movies = [
  Movie(
    poster: 'images/ylia.jpg',
    title: 'Your Lie In April',
    categories: 'Anime, Comedy',
    year: 2014,
    episodes: 22,
    description:
        'Quand Arima Kosei était petit, il était considéré comme un enfant prodige du piano. Mais après la mort de sa mère, il ne put plus entendre le son du piano. Quelque années plus tard, il rencontre une violoniste nommée Kawori Miyazono. Elle va le forcer à participer à plusieurs compétitions de piano, ce qui va lui faire redécouvrir le monde musical. Mais la violoniste cache un grand secret à ses amis...',
    screenshots: [
      'images/ylia_0.png',
      'images/ylia_1.png',
      'images/ylia_2.jpg',
    ],
    trailer:
        'https://cvn32.sibnet.ru/30/75/46/3075461.mp4?st=B53-DULO8rYPBp6m77EB4g&e=1604800000&stor=34&noip=1&cache=8',
  ),
  Movie(
    poster: 'images/tog.jpg',
    title: 'Tower of God',
    categories: 'Mystère, Action, Adventure, Science-Fiction',
    year: 2020,
    episodes: 13,
    description:
        'Atteignez le sommet et tout vous appartiendra ! Celui qui parvient en haut de la tour verra ses souhaits les plus fous être exaucés. Il deviendra alors un dieu ! C\'est l\'histoire du début et de la fin de Rachel, une fille partie dans la tour pour toucher les étoiles, et de Bam, un garçon qui ne vit que pour elle…',
    screenshots: [
      'images/tog_0.jpg',
      'images/tog_1.jpg',
      'images/tog_2.jpg',
    ],
    trailer:
        'https://fs137.myvi.tv:8092/oa/Pv/Q2/6T/Sk/26/VV/ir/Bi/3h/Wg/2/2.mp4?&s=Tz38wU9XcrdUfpkQhDclGuwCtEtY82it8l_cx36bASD_3n1GDpvwAEgyjTIJqy6vd0shCGB9CS_ojp8Wux38qw2&r=btkrzRp-IBiutHyPksjT9e0HZsz4uLIBtIcdzlh2Bas1&do=1362&d=1226&ri=lv4QGRiOaUCNNzIBGi3hWw2',
  ),
  Movie(
    poster: 'images/hxh.jpg',
    title: 'Hunter x Hunter',
    categories: 'Action, Adventure, Animation, Drame',
    year: 2011,
    episodes: 148,
    description:
        'Le jeune Gon vit sur une petite île avec sa tante. Abandonné par son père qui est un Hunter, à la fois un aventurier et un chasseur de primes, Gon décide à l\'âge de 12 ans de partir pour devenir un Hunter. Cela ne sera pas chose aisée, il devra passer une suite de tests et examens en compagnie de milliers d\'autres prétendants au titre de Hunter. Il sera aidé par de nouvelles connaissances qui aspirent au même but que lui tel que Kurapika, Leorio et Killua.',
    screenshots: [
      'images/hxh_0.jpg',
      'images/hxh_1.jpg',
      'images/hxh_2.jpg',
    ],
    trailer:
        'https://fs137.myvi.tv:8092/oa/Pv/Q2/6T/Sk/26/VV/ir/Bi/3h/Wg/2/2.mp4?&s=Tz38wU9XcrdUfpkQhDclGuwCtEtY82it8l_cx36bASD_3n1GDpvwAEgyjTIJqy6vd0shCGB9CS_ojp8Wux38qw2&r=btkrzRp-IBiutHyPksjT9e0HZsz4uLIBtIcdzlh2Bas1&do=1362&d=1226&ri=lv4QGRiOaUCNNzIBGi3hWw2',
  ),
  Movie(
    poster: 'images/op.jpg',
    title: 'One Piece',
    categories: 'Action, Adventure, Comédie, Animation',
    year: 1999,
    episodes: 946,
    description:
        'Il fut un temps où Gold Roger était le plus grand de tous les pirates, le "Roi des Pirates" était son surnom. A sa mort, son trésor d\'une valeur inestimable connu sous le nom de One Piece fut caché quelque part sur Grand Line. De nombreux pirates sont partis à la recherche de ce trésor mais tous sont morts avant même de l\'atteindre. Monkey D. Luffy rêve de retrouver ce trésor légendaire et de devenir le nouveau "Roi des Pirates". Après avoir mangé un fruit du démon, il possède un pouvoir lui permettant de réaliser son rêve. Il lui faut maintenant trouver un équipage pour partir à l\'aventure !',
    screenshots: [
      'images/op_0.jpg',
      'images/op_1.jpg',
      'images/op_2.jpg',
    ],
    trailer:
        'https://fs137.myvi.tv:8092/oa/Pv/Q2/6T/Sk/26/VV/ir/Bi/3h/Wg/2/2.mp4?&s=Tz38wU9XcrdUfpkQhDclGuwCtEtY82it8l_cx36bASD_3n1GDpvwAEgyjTIJqy6vd0shCGB9CS_ojp8Wux38qw2&r=btkrzRp-IBiutHyPksjT9e0HZsz4uLIBtIcdzlh2Bas1&do=1362&d=1226&ri=lv4QGRiOaUCNNzIBGi3hWw2',
  ),
  Movie(
    poster: 'images/parasite.jpg',
    title: 'Parasite',
    categories: 'Animation, Drame, Science-Fiction, Fantastique, Crime',
    year: 2014,
    episodes: 24,
    description:
        'De mystérieuses créatures ont colonisé la Terre en prenant possession de certains habitants. Un lycéen, Shin’ichi, a été contaminé, mais son cerveau est épargné. Seul son bras droit est possédé par un parasite, Migi, qu\'il apprend peu à peu à connaître. Tous deux doivent désormais cohabiter, mais dans le même temps, Shin’ichi comprend que la prolifération des parasites menace, à terme, l’espèce humaine.',
    screenshots: [
      'images/parasite_0.jpg',
      'images/parasite_1.jpg',
      'images/parasite_2.jpg',
    ],
    trailer:
        'https://fs137.myvi.tv:8092/oa/Pv/Q2/6T/Sk/26/VV/ir/Bi/3h/Wg/2/2.mp4?&s=Tz38wU9XcrdUfpkQhDclGuwCtEtY82it8l_cx36bASD_3n1GDpvwAEgyjTIJqy6vd0shCGB9CS_ojp8Wux38qw2&r=btkrzRp-IBiutHyPksjT9e0HZsz4uLIBtIcdzlh2Bas1&do=1362&d=1226&ri=lv4QGRiOaUCNNzIBGi3hWw2',
  ),
  /*Movie(
    poster: ,
    title: ,
    categories: ,
    year: ,
    episodes: ,
    description: ,
    screenshots: [

    ],
  ),
  Movie(
    poster: ,
    title: ,
    categories: ,
    year: ,
    episodes: ,
    description: ,
    screenshots: [

    ],
  ),
  Movie(
    poster: ,
    title: ,
    categories: ,
    year: ,
    episodes: ,
    description: ,
    screenshots: [

    ],
  ),
  Movie(
    poster: ,
    title: ,
    categories: ,
    year: ,
    episodes: ,
    description: ,
    screenshots: [

    ],
  ),
  Movie(
    poster: ,
    title: ,
    categories: ,
    year: ,
    episodes: ,
    description: ,
    screenshots: [

    ],
  ),
  Movie(
    poster: ,
    title: ,
    categories: ,
    year: ,
    episodes: ,
    description: ,
    screenshots: [

    ],
  ),*/
];

final List<Movie> carousel = [
  Movie(
    poster: 'images/hxh.jpg',
    title: 'Hunter x Hunter',
    categories: 'Action, Adventure, Animation, Drame',
    year: 2011,
    episodes: 148,
    description:
        'Le jeune Gon vit sur une petite île avec sa tante. Abandonné par son père qui est un Hunter, à la fois un aventurier et un chasseur de primes, Gon décide à l\'âge de 12 ans de partir pour devenir un Hunter. Cela ne sera pas chose aisée, il devra passer une suite de tests et examens en compagnie de milliers d\'autres prétendants au titre de Hunter. Il sera aidé par de nouvelles connaissances qui aspirent au même but que lui tel que Kurapika, Leorio et Killua.',
    screenshots: [
      'images/hxh_0.jpg',
      'images/hxh_1.jpg',
      'images/hxh_2.jpg',
    ],
    trailer:
        'https://fs137.myvi.tv:8092/oa/Pv/Q2/6T/Sk/26/VV/ir/Bi/3h/Wg/2/2.mp4?&s=Tz38wU9XcrdUfpkQhDclGuwCtEtY82it8l_cx36bASD_3n1GDpvwAEgyjTIJqy6vd0shCGB9CS_ojp8Wux38qw2&r=btkrzRp-IBiutHyPksjT9e0HZsz4uLIBtIcdzlh2Bas1&do=1362&d=1226&ri=lv4QGRiOaUCNNzIBGi3hWw2',
  ),
  Movie(
    poster: 'images/op.jpg',
    title: 'One Piece',
    categories: 'Action, Adventure, Comédie, Animation',
    year: 1999,
    episodes: 946,
    description:
        'Il fut un temps où Gold Roger était le plus grand de tous les pirates, le "Roi des Pirates" était son surnom. A sa mort, son trésor d\'une valeur inestimable connu sous le nom de One Piece fut caché quelque part sur Grand Line. De nombreux pirates sont partis à la recherche de ce trésor mais tous sont morts avant même de l\'atteindre. Monkey D. Luffy rêve de retrouver ce trésor légendaire et de devenir le nouveau "Roi des Pirates". Après avoir mangé un fruit du démon, il possède un pouvoir lui permettant de réaliser son rêve. Il lui faut maintenant trouver un équipage pour partir à l\'aventure !',
    screenshots: [
      'images/op_0.jpg',
      'images/op_1.jpg',
      'images/op_2.jpg',
    ],
    trailer:
        'https://fs137.myvi.tv:8092/oa/Pv/Q2/6T/Sk/26/VV/ir/Bi/3h/Wg/2/2.mp4?&s=Tz38wU9XcrdUfpkQhDclGuwCtEtY82it8l_cx36bASD_3n1GDpvwAEgyjTIJqy6vd0shCGB9CS_ojp8Wux38qw2&r=btkrzRp-IBiutHyPksjT9e0HZsz4uLIBtIcdzlh2Bas1&do=1362&d=1226&ri=lv4QGRiOaUCNNzIBGi3hWw2',
  ),
  Movie(
    poster: 'images/parasite.jpg',
    title: 'Parasite',
    categories: 'Animation, Drame, Science-Fiction, Fantastique, Crime',
    year: 2014,
    episodes: 24,
    description:
        'De mystérieuses créatures ont colonisé la Terre en prenant possession de certains habitants. Un lycéen, Shin’ichi, a été contaminé, mais son cerveau est épargné. Seul son bras droit est possédé par un parasite, Migi, qu\'il apprend peu à peu à connaître. Tous deux doivent désormais cohabiter, mais dans le même temps, Shin’ichi comprend que la prolifération des parasites menace, à terme, l’espèce humaine.',
    screenshots: [
      'images/parasite_0.jpg',
      'images/parasite_1.jpg',
      'images/parasite_2.jpg',
    ],
    trailer:
        'https://fs137.myvi.tv:8092/oa/Pv/Q2/6T/Sk/26/VV/ir/Bi/3h/Wg/2/2.mp4?&s=Tz38wU9XcrdUfpkQhDclGuwCtEtY82it8l_cx36bASD_3n1GDpvwAEgyjTIJqy6vd0shCGB9CS_ojp8Wux38qw2&r=btkrzRp-IBiutHyPksjT9e0HZsz4uLIBtIcdzlh2Bas1&do=1362&d=1226&ri=lv4QGRiOaUCNNzIBGi3hWw2',
  ),
];

final List<String> labels = [
  'Discover',
  'Categories',
  'Specials',
  'New',
];

List<Movie> myList = [];

final List<Movie> popular = [
  Movie(
    poster: 'images/tog.jpg',
    title: 'Tower of God',
    categories: 'Mystère, Action, Adventure, Science-Fiction',
    year: 2020,
    episodes: 13,
    description:
        'Atteignez le sommet et tout vous appartiendra ! Celui qui parvient en haut de la tour verra ses souhaits les plus fous être exaucés. Il deviendra alors un dieu ! C\'est l\'histoire du début et de la fin de Rachel, une fille partie dans la tour pour toucher les étoiles, et de Bam, un garçon qui ne vit que pour elle…',
    screenshots: [
      'images/tog_0.jpg',
      'images/tog_1.jpg',
      'images/tog_2.jpg',
    ],
    trailer:
        'https://fs137.myvi.tv:8092/oa/Pv/Q2/6T/Sk/26/VV/ir/Bi/3h/Wg/2/2.mp4?&s=Tz38wU9XcrdUfpkQhDclGuwCtEtY82it8l_cx36bASD_3n1GDpvwAEgyjTIJqy6vd0shCGB9CS_ojp8Wux38qw2&r=btkrzRp-IBiutHyPksjT9e0HZsz4uLIBtIcdzlh2Bas1&do=1362&d=1226&ri=lv4QGRiOaUCNNzIBGi3hWw2',
  ),
  Movie(
    poster: 'images/tog.jpg',
    title: 'Tower of God',
    categories: 'Mystère, Action, Adventure, Science-Fiction',
    year: 2020,
    episodes: 13,
    description:
        'Atteignez le sommet et tout vous appartiendra ! Celui qui parvient en haut de la tour verra ses souhaits les plus fous être exaucés. Il deviendra alors un dieu ! C\'est l\'histoire du début et de la fin de Rachel, une fille partie dans la tour pour toucher les étoiles, et de Bam, un garçon qui ne vit que pour elle…',
    screenshots: [
      'images/tog_0.jpg',
      'images/tog_1.jpg',
      'images/tog_2.jpg',
    ],
    trailer:
        'https://fs137.myvi.tv:8092/oa/Pv/Q2/6T/Sk/26/VV/ir/Bi/3h/Wg/2/2.mp4?&s=Tz38wU9XcrdUfpkQhDclGuwCtEtY82it8l_cx36bASD_3n1GDpvwAEgyjTIJqy6vd0shCGB9CS_ojp8Wux38qw2&r=btkrzRp-IBiutHyPksjT9e0HZsz4uLIBtIcdzlh2Bas1&do=1362&d=1226&ri=lv4QGRiOaUCNNzIBGi3hWw2',
  ),
  Movie(
    poster: 'images/tog.jpg',
    title: 'Tower of God',
    categories: 'Mystère, Action, Adventure, Science-Fiction',
    year: 2020,
    episodes: 13,
    description:
        'Atteignez le sommet et tout vous appartiendra ! Celui qui parvient en haut de la tour verra ses souhaits les plus fous être exaucés. Il deviendra alors un dieu ! C\'est l\'histoire du début et de la fin de Rachel, une fille partie dans la tour pour toucher les étoiles, et de Bam, un garçon qui ne vit que pour elle…',
    screenshots: [
      'images/tog_0.jpg',
      'images/tog_1.jpg',
      'images/tog_2.jpg',
    ],
    trailer:
        'https://fs137.myvi.tv:8092/oa/Pv/Q2/6T/Sk/26/VV/ir/Bi/3h/Wg/2/2.mp4?&s=Tz38wU9XcrdUfpkQhDclGuwCtEtY82it8l_cx36bASD_3n1GDpvwAEgyjTIJqy6vd0shCGB9CS_ojp8Wux38qw2&r=btkrzRp-IBiutHyPksjT9e0HZsz4uLIBtIcdzlh2Bas1&do=1362&d=1226&ri=lv4QGRiOaUCNNzIBGi3hWw2',
  ),
];
