class ArticleDetails {
  final String title;
  final String content;
  final DateTime date;
  final String imgUrl;
  final String articleUrl;

  const ArticleDetails({
    required this.title,
    required this.content,
    required this.date,
    required this.imgUrl,
    required this.articleUrl,
  });

// DateFormat('yyy-MM-dd HH:mm').format(DateTime.parse('2023-02-04T09:02:11Z'))
  static List<ArticleDetails> articleDetailsMap = [
    ArticleDetails(
      title: 'Rally Signals Its No Bear Run; Musk Not Liable For Tweets',
      content:
          'Elon Musk is off the hook for his 2018 tweets claiming he had funding secured to take Tesla private for \$420 a share. A jury found that Musk was not liable\r\n for Tesla investors losses, following a w… ',
      date: DateTime.parse('2023-02-04T09:02:11Z'),
      imgUrl: 'https://c.biztoc.com/p/d0ff00bec5a1ff6f/og.webp',
      articleUrl:
          'https://www.engadget.com/elon-musk-tesla-shareholder-trial-verdict-232434731.html',
    ),
    ArticleDetails(
      title:
          'Disagreements And First Principles: The Pushback On My Tesla Valuation',
      content:
          'I wrote about my most recent valuation of Tesla just over a week ago, and as has always been the case when I value this company, I have heard from both sides of the Tesla divide. Some of you believe …',
      date: DateTime.parse('2023-02-04T09:02:00Z'),
      imgUrl: '',
      articleUrl:
          'https://www.blogger.com/comment.g?blogID=8152901575140311047&postID=2212150359361542896&bpli=1',
    ),
    ArticleDetails(
      title:
          'Rally Signals Its No Bear Run; Musk Not Liable For TweeTesla Elon Musk found not liable in trial over 2018 \'funding secured\' tweets - Reutersts',
      content:
          'Elon Musk said that just because he tweets something, it \"does not mean people believe it or will act accordingly.\" The Tesla chief took the witness stand in a San Francisco federal court to defend h…',
      date: DateTime.parse('2023-02-04T09:02:11Z'),
      imgUrl:
          'https://www.reuters.com/resizer/b6r_IxHMYKe62QKFxcY2cVLF0ug=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/L5UZZVN62JPT7NX73MDTGCWBVU.jpg',
      articleUrl:
          'https://www.engadget.com/elon-musk-defends-funding-secured-tweets-tesla-shareholder-trial-095159189.html',
    ),
  ];
}
