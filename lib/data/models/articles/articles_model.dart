class Articles {
  final String title;
  final String description;
  final DateTime date;
  final String imgUrl;

  const Articles({
    required this.title,
    required this.description,
    required this.date,
    required this.imgUrl,
  });

  static List<Articles> articlesMap = [
    Articles(
      title: 'Rally Signals Its No Bear Run; Musk Not Liable For Tweets',
      description:
          'The stock market rally had another big week, with the Nasdaq running higher amid major news from the latest Fed outlook to the jobs report to massive earnings from Apple (AAPL), Meta Platforms (META) and more. Dow Jones futures will open on Sunday evening, al…',
      date: DateTime.parse('2023-02-04T09:02:11Z'),
      imgUrl: 'https://c.biztoc.com/p/d0ff00bec5a1ff6f/og.webp',
    ),
    Articles(
      title:
          'Disagreements And First Principles: The Pushback On My Tesla Valuation',
      description: '',
      date: DateTime.parse('2023-02-04T09:02:00Z'),
      imgUrl: '',
    ),
    Articles(
      title:
          'Rally Signals Its No Bear Run; Musk Not Liable For TweeTesla Elon Musk found not liable in trial over 2018 \'funding secured\' tweets - Reutersts',
      description:
          'A U.S. jury on Friday found Tesla Inc <a href=\"https://www.reuters.com/companies/TSLA.O\" target=\"_blank\">(TSLA.O)</a> CEO Elon Musk and his company were not liable for misleading investors when Musk tweeted in 2018 that he had \"funding secured\" to take the el…',
      date: DateTime.parse('2023-02-04T09:02:11Z'),
      imgUrl:
          'https://www.reuters.com/resizer/b6r_IxHMYKe62QKFxcY2cVLF0ug=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/L5UZZVN62JPT7NX73MDTGCWBVU.jpg',
    ),
  ];
}
