// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppRequest {
  static const String call = '''{
  "title": "Тема контента",
  "subtitle": "Подтема контента",
  "fontPairs": [
    {
      "name": "Nunito",
      "link": "https://fonts.google.com/specimen/Nunito"
    },
    {
      "name": "Raleway",
      "link": "https://fonts.google.com/specimen/Raleway"
    }
  ],
  "colorCodes": {
    "primary": "#0D47A1",
    "secondary": "#1976D2",
    "accent": "#C2185B",
    "background": "#E3F2FD",
    "text": "#0D0D0D"
  },
  "content": "<p>Добро пожаловать в наш инновационный медицинский стартап.</p><section><h2>О компании</h2><p>Мы предлагаем передовые медицинские решения, направленные на улучшение здоровья и благополучия.</p></section><section><h2>Наши услуги</h2><p>Мы предоставляем широкий спектр медицинских услуг, включая диагностику, лечение и профилактику заболеваний.</p></section><section><h2>Контактная информация</h2><p>Свяжитесь с нами для получения дополнительной информации о наших услугах и продуктах.</p></section>"
}

following this structure generate design task in json. Generate whole design task in content. All values should be corresponding to each other. Dont write another words outside of json model. Write in russian. title and subtitle should be based on content
''';
}

class AppExamples {
  static List<String> contentList = [
    '<p>Вот примерная структура главной страницы. Это лишь скелет, созданный нейросетью. Добавь какой-то интересный контент от себя.</p> <div class=""> <ol> <li> <p><strong>Шапка сайта (Header)</strong></p> <ul> <li>Логотип: "Dream in a Bottle"</li> <li>Навигационное меню: Главная, Каталог, Секреты сна, О нас, Контакты.</li> <li>Поиск по сайту.</li> </ul> </li> <li> <p><strong>Главный баннер (Hero Section)</strong></p> <ul> <li>Заголовок: "Найдите свой путь к спокойному сну."</li> <li>Описание: "Натуральные средства для релаксации и глубокого сна."</li> <li>Кнопка: "Исследовать ассортимент"</li> </ul> </li> <li> <p><strong>Преимущества наших продуктов (Benefits Section)</strong></p> <ul> <li>Заголовок: "Почему наши средства уникальны?"</li> <li>Картинки и краткие описания: <ol> <li>100% натуральные ингредиенты.</li> <li>Ручная работа с любовью.</li> <li>Научно подтвержденный эффект.</li> <li>Эко-упаковка.</li> </ol> </li> </ul> </li> <li> <p><strong>Популярные товары (Featured Products Section)</strong></p> <ul> <li>Заголовок: "Лучшие средства для гармонии и отдыха"</li> <li>Карточки товаров: фото, название средства, краткое описание, кнопка "Узнать больше".</li> </ul> </li> <li> <p><strong>Секреты качественного сна (Sleep Tips Section)</strong></p> <ul> <li>Заголовок: "Как улучшить свой сон?"</li> <li>Краткие статьи или видеоинструкции с советами и рекомендациями.</li> </ul> </li> <li> <p><strong>Отзывы клиентов (Customer Reviews Section)</strong></p> <ul> <li>Заголовок: "Отзывы тех, кто уже нашел свой идеальный сон"</li> <li>Фото, имя клиента, и краткий отзыв.</li> </ul> </li> <li> <p><strong>Подписка на рассылку (Subscription Section)</strong></p> <ul> <li>Заголовок: "Оставайтесь в курсе наших новинок и секретов!"</li> <li>Описание: "Подпишитесь и получите эксклюзивные советы для лучшего сна."</li> <li>Форма подписки: Введите ваш email.</li> <li>Кнопка: "Подписаться"</li> </ul> </li> <li> <p><strong>Футер (Footer)</strong></p> <ul> <li>Навигационное меню (повтор)</li> <li>Контактная информация: адрес, телефон, email</li> <li>Социальные сети: иконки с ссылками на профили бренда</li> <li>Форма обратной связи: "Есть вопросы или пожелания? Мы рады помочь!"</li> </ul> </li> </ol> </div>',
    '<p>Вот примерная структура главной страницы. Это лишь скелет, созданный нейросетью. Добавь какой-то интересный контент от себя.</p> <div class=""> <ol> <li> <p><strong>Шапка сайта (Header)</strong></p> <ul> <li>Логотип: "Острые дела"</li> <li>Навигационное меню: Главная, Каталог, Челленджи, Рецепты, О нас, Контакты.</li> <li>Кнопка поиска и корзины с покупками.</li> </ul> </li> <li> <p><strong>Главный баннер (Hero Section)</strong></p> <ul> <li>Заголовок: "Самые жгучие товары в одном месте!"</li> <li>Описание: "Готовы принять вызов и попробовать что-то по-настоящему острое?"</li> <li>Кнопка: "Посмотреть каталог"</li> </ul> </li> <li> <p><strong>Популярные товары (Popular Products Section)</strong></p> <ul> <li>Заголовок: "Лидеры продаж"</li> <li>Карточки товаров с изображением, коротким описанием, ценой и кнопкой "Добавить в корзину".</li> </ul> </li> <li> <p><strong>Челленджи (Challenge Section)</strong></p> <ul> <li>Заголовок: "Готовы к испытанию?" <ul> <li>Блок 1: <ul> <li>Заголовок: "Перцевый челлендж"</li> <li>Описание: "Самый острый перец в мире ждёт своего героя!"</li> </ul> </li> <li>Блок 2: <ul> <li>Заголовок: "Орешковый ад"</li> <li>Описание: "Орешки с настоящим огоньком!"</li> </ul> </li> <li>Блок 3: <ul> <li>Заголовок: "Соус-извержение"</li> <li>Описание: "Сможете выдержать этот вкус?"</li> </ul> </li> </ul> </li> </ul> </li> <li> <p><strong>Рецепты (Recipe Section)</strong></p> <ul> <li>Заголовок: "Приготовьте огненное блюдо"</li> <li>Карточки с рецептами, в которых используются продукты магазина: изображение блюда, название, короткое описание.</li> </ul> </li> <li> <p><strong>Отзывы и видео-реакции (Testimonials Section)</strong></p> <ul> <li>Заголовок: "Реакции наших клиентов"</li> <li>Слайдер с видео-реакциями: Фото клиента или обложка видео, название видео, короткий текст отзыва.</li> </ul> </li> <li> <p><strong>Подписка на рассылку (Subscription Section)</strong></p> <ul> <li>Заголовок: "Хотите первыми узнавать о новинках и акциях?"</li> <li>Форма подписки: Введите ваш email</li> <li>Кнопка: "Подписаться"</li> </ul> </li> <li> <p><strong>Футер (Footer)</strong></p> <ul> <li>Навигационное меню (повтор)</li> <li>Контактная информация: адрес, телефон, email</li> <li>Социальные сети: иконки с ссылками на профили магазина</li> <li>Форма обратной связи: "Есть вопросы или предложения? Напишите нам!"</li> </ul> </li> </ol> </div>',
    '<p>Вот примерная структура главной страницы. Это лишь скелет, созданный нейросетью. Добавь какой-то интересный контент от себя.</p> <div class=""> <ol> <li> <p><strong>Шапка (Header):</strong></p> <ul> <li>Логотип "ZeroWaste Bistro".</li> <li>Главное меню: "Главная", "Меню", "О нас", "Наша философия", "Контакты".</li> <li>Иконка онлайн-бронирования столика.</li> <li>Кнопка входа/регистрации для постоянных клиентов.</li> </ul> </li> <li> <p><strong>Стартовый блок:</strong></p> <ul> <li>Заголовок: "Бережное отношение к природе начинается за столом".</li> <li>Подзаголовок: "Окунитесь в вкус устойчивости".</li> <li>Изображение: Интерьер кафе или блюдо в экологичной упаковке.</li> <li>Кнопка: "Бронировать столик".</li> </ul> </li> <li> <p><strong>О нашей философии:</strong></p> <ul> <li>Заголовок: "Что такое ZeroWaste Bistro?".</li> <li>Текст: Краткое описание концепции "без отходов", миссия и преимущества кафе.</li> <li>Изображение: Фото процесса приготовления еды или переработки органики.</li> </ul> </li> <li> <p><strong>Меню:</strong></p> <ul> <li>Заголовок: "Вкус без компромиссов".</li> <li>Карточки популярных блюд (фото, название, состав, цена).</li> <li>Кнопка: "Смотреть полное меню".</li> </ul> </li> <li> <p><strong>Как мы работаем:</strong></p> <ul> <li>Заголовок: "От кухни до стола без отходов".</li> <li>Инфографика или иллюстрации, показывающие цикл жизни продуктов в кафе.</li> </ul> </li> <li> <p><strong>Отзывы и истории:</strong></p> <ul> <li>Заголовок: "Наша история через глаза клиентов".</li> <li>Слайдер с отзывами: фото клиента, текст отзыва, фото блюда или момента в кафе.</li> </ul> </li> <li> <p><strong>События и новости:</strong></p> <ul> <li>Заголовок: "Будьте в курсе устойчивых новостей".</li> <li>Анонсы предстоящих мероприятий, акций или новинок меню.</li> <li>Кнопка: "Все события".</li> </ul> </li> <li> <p><strong>Контакты и бронирование:</strong></p> <ul> <li>Заголовок: "Заходите к нам".</li> <li>Текст: Адрес кафе, рабочие часы, номер телефона.</li> <li>Карта с местоположением кафе.</li> <li>Форма онлайн-бронирования.</li> </ul> </li> <li> <p><strong>Подписка на новости:</strong></p> <ul> <li>Заголовок: "Подписаться на экологичные новости".</li> <li>Текст: "Узнавайте первыми о новых блюдах, акциях и мероприятиях".</li> <li>Поле для ввода email.</li> <li>Кнопка: "Подписаться".</li> </ul> </li> <li> <p><strong>Подвал (Footer):</strong></p> <ul> <li>Логотип "ZeroWaste Bistro".</li> <li>Навигационное меню.</li> <li>Контактная информация.</li> <li>Ссылки на социальные сети.</li> <li>Copyright: "&copy; 2023, ZeroWaste Bistro".</li> </ul> </li> </ol> </div>',
    '<p>Вот примерная структура главной страницы. Это лишь скелет, созданный нейросетью. Добавь какой-то интересный контент от себя.</p> <div class=""> <ol> <li> <p><strong>Шапка сайта (Header)</strong></p> <ul> <li>Логотип: Название сервиса (например, "AquaHome")</li> <li>Навигационное меню: Главная, Каталог, Новичкам, Советы эксперта, Отзывы, Контакты.</li> <li>Кнопка поиска и корзины с покупками.</li> </ul> </li> <li> <p><strong>Главный баннер (Hero Section)</strong></p> <ul> <li>Заголовок: "Окунитесь в мир аквариумистики!"</li> <li>Описание: "Создайте свою подводную вселенную прямо дома с нашей помощью."</li> <li>Кнопка: "Начать путешествие"</li> </ul> </li> <li> <p><strong>Для начинающих (Beginners Section)</strong></p> <ul> <li>Заголовок: "Первые шаги в аквариумистике" <ul> <li>Блок 1: <ul> <li>Заголовок: "Выбор аквариума"</li> <li>Описание: "Советы по размерам, формам и материалам."</li> </ul> </li> <li>Блок 2: <ul> <li>Заголовок: "Подбор рыбок"</li> <li>Описание: "Какие рыбки лучше всего подойдут для новичков."</li> </ul> </li> <li>Блок 3: <ul> <li>Заголовок: "Оборудование и уход"</li> <li>Описание: "Всё, что нужно знать о фильтрах, освещении и питании."</li> </ul> </li> </ul> </li> </ul> </li> <li> <p><strong>Каталог товаров (Products Section)</strong></p> <ul> <li>Заголовок: "Всё для вашего аквариума"</li> <li>Подкатегории: Аквариумы, Рыбки, Растения, Оборудование, Корма.</li> <li>Изображения товаров с ценами и коротким описанием.</li> </ul> </li> <li> <p><strong>Советы эксперта (Expert Tips Section)</strong></p> <ul> <li>Заголовок: "Полезные статьи для аквариумистов"</li> <li>Список статей с фотографиями и короткими аннотациями.</li> </ul> </li> <li> <p><strong>Отзывы клиентов (Testimonials Section)</strong></p> <ul> <li>Заголовок: "Что говорят наши довольные аквариумисты"</li> <li>Слайдер с отзывами: Фото клиента, его имя, текст отзыва.</li> </ul> </li> <li> <p><strong>Подписка на рассылку (Subscription Section)</strong></p> <ul> <li>Заголовок: "Хотите получать свежие новости и советы?"</li> <li>Форма подписки: Введите ваш email</li> <li>Кнопка: "Подписаться"</li> </ul> </li> <li> <p><strong>Футер (Footer)</strong></p> <ul> <li>Навигационное меню (повтор)</li> <li>Контактная информация: адрес, телефон, email</li> <li>Социальные сети: иконки с ссылками на профили сервиса</li> <li>Форма обратной связи: "Есть вопросы? Напишите нам!"</li> </ul> </li> </ol> </div>',
    '<p>Вот примерная структура главной страницы. Это лишь скелет, созданный нейросетью. Добавь какой-то интересный контент от себя.</p> <div class=""> <ol> <li> <p><strong>Шапка сайта (Header)</strong></p> <ul> <li>Логотип: Название магазина (например, "EcoPlay")</li> <li>Навигационное меню: Главная, Каталог, О нас, Отзывы, Контакты.</li> <li>Корзина покупок и кнопка входа/регистрации</li> </ul> </li> <li> <p><strong>Главный баннер (Hero Section)</strong></p> <ul> <li>Заголовок: "Играем с уважением к природе!"</li> <li>Описание: "Выберите экологичные и безопасные игрушки для ваших детей из нашего ассортимента."</li> <li>Кнопка: "Посмотреть коллекцию"</li> </ul> </li> <li> <p><strong>Почему выбирают нас? (Benefits Section)</strong></p> <ul> <li>Заголовок: "Почему наши игрушки &mdash; лучший выбор?" <ul> <li>Блок 1: <ul> <li>Заголовок: "100% Натуральные материалы"</li> <li>Описание: "Только дерево, хлопок и другие экологичные материалы."</li> </ul> </li> <li>Блок 2: <ul> <li>Заголовок: "Безопасно для детей"</li> <li>Описание: "Игрушки проходят строгий контроль качества."</li> </ul> </li> <li>Блок 3: <ul> <li>Заголовок: "Уникальный дизайн"</li> <li>Описание: "Оригинальные и интересные игрушки, созданные с любовью."</li> </ul> </li> </ul> </li> </ul> </li> <li> <p><strong>Популярные товары (Featured Products Section)</strong></p> <ul> <li>Заголовок: "Популярные этим месяцем"</li> <li>Карточки товаров (изображение, название, цена)</li> <li>Кнопка: "Посмотреть весь каталог"</li> </ul> </li> <li> <p><strong>Отзывы клиентов (Testimonials Section)</strong></p> <ul> <li>Заголовок: "Что говорят наши довольные клиенты"</li> <li>Слайдер с отзывами: Фото клиента, его имя, текст отзыва.</li> </ul> </li> <li> <p><strong>О нас (About Us Section)</strong></p> <ul> <li>Заголовок: "Наша миссия &mdash; экологичное детство"</li> <li>Описание: "Мы верим, что дети заслуживают лучшего &mdash; игрушек, которые безопасны для них и нашей планеты. Познакомьтесь с нашей историей и ценностями."</li> <li>Фотография команды или процесса изготовления игрушек</li> <li>Кнопка: "Узнать больше о нас"</li> </ul> </li> <li> <p><strong>Футер (Footer)</strong></p> <ul> <li>Навигационное меню (повтор)</li> <li>Контактная информация: адрес, телефон, email</li> <li>Социальные сети: иконки с ссылками на профили магазина</li> <li>Форма подписки на новости и акции: "Подпишитесь на наши новости и получите скидку 10% на первую покупку!"</li> </ul> </li> </ol> <p>Эта структура поможет создать привлекательную и информативную главную страницу для вашего сайта с экологичными игрушками.</p> </div>',
  ];

  //TEMATIKA PROEKTA
  static List<String> topicTitle = [
    'Сон в бутылке: домашние средства для сна',
    'Интернет-магазин острых товаров',
    'Кафе без отходов',
    'Подводный мир в домашних условиях',
    'Экологичные игрушки для детей',
  ];
  static List<String> topicSubtitle = [
    'Мы создаём натуральные, ручной работы средства, помогающие расслабиться и уснуть. Хотим представить свою продукцию в интернете и рассказать о том, как правильно отдыхать. Можете создать дизайн, который унесёт посетителей в мир снов?',
    'Мы специализируемся на очень острых товарах (перцы, соусы, орешки). В основном их покупают для веселья или челленджей на YouTube. Хотим «жгучий» сайт-презентацию с заказами онлайн.',
    'Мы представляем заведение, где отсутствуют отходы. Данная концепция подразумевает бережное отношение к ресурсам и природе. Нам нужен сайт, который отражает нашу философию устойчивости и помогает клиентам делать осознанный выбор.',
    'У нас большой опыт в аквариумистике, и мы хотим делиться своими знаниями. Мечтаем о сайте, где каждый сможет подобрать идеальное оборудование и рыбок для своего первого аквариума. Готовы сотрудничать?',
    'Мы производим игрушки из натуральных материалов. В эпоху пластика хотим показать, что безопасные и экологичные вещи могут быть не менее интересными. Нам нужен сайт, который подчеркнет нашу миссию и поможет родителям сделать правильный выбор.',
  ];

  static List<List<FontModel>> fontList = [
    [
      FontModel(
          title: 'Cormorant Garamond',
          font: GoogleFonts.cormorantGaramond(),
          link: 'https://fonts.google.com/specimen/Cormorant+Garamond'),
      FontModel(
          title: 'Roboto',
          font: GoogleFonts.roboto(),
          link: 'https://fonts.google.com/specimen/Roboto'),
    ],
    [
      FontModel(
          title: 'Gabriela',
          font: GoogleFonts.gabriela(),
          link: 'https://fonts.google.com/specimen/Gabriela'),
      FontModel(
          title: 'Inter',
          font: GoogleFonts.inter(),
          link: 'https://fonts.google.com/specimen/Inter'),
    ],
    [
      FontModel(
          title: 'Yeseva One',
          font: GoogleFonts.yesevaOne(),
          link: 'https://fonts.google.com/specimen/Yeseva+One'),
      FontModel(
          title: 'Inter',
          font: GoogleFonts.inter(),
          link: 'https://fonts.google.com/specimen/Inter'),
    ],
    [
      FontModel(
          title: 'Yeseva One',
          font: GoogleFonts.yesevaOne(),
          link: 'https://fonts.google.com/specimen/Yeseva+One'),
      FontModel(
          title: 'Roboto',
          font: GoogleFonts.roboto(),
          link: 'https://fonts.google.com/specimen/Roboto'),
    ],
    [
      FontModel(
          title: 'Merriweather',
          font: GoogleFonts.merriweather(),
          link: 'https://fonts.google.com/specimen/Merriweather'),
      FontModel(
          title: 'Roboto',
          font: GoogleFonts.roboto(),
          link: 'https://fonts.google.com/specimen/Roboto'),
    ]
  ];

  static List<List<Color>> colors = [
    [
      const Color(0xFF9D7E79),
      const Color(0xFFCCAC95),
      const Color(0xFF9A947C),
      const Color(0xFF748B83),
      const Color(0xFF5B756C)
    ],
    [
      const Color(0xFFE7EDEA),
      const Color(0xFFFFC52C),
      const Color(0xFFFB0C06),
      const Color(0xFF030D4F),
      const Color(0xFFCEECEF),
    ],
    [
      const Color(0xFFEFF3CD),
      const Color(0xFFB2D5BA),
      const Color(0xFF61ADA0),
      const Color(0xFF248F8D),
      const Color(0xFF605063),
    ],
    [
      const Color(0xFFE3E8CD),
      const Color(0xFFBCD8BF),
      const Color(0xFFD3B9A3),
      const Color(0xFFEE9C92),
      const Color(0xFFFE857E),
    ],
    [
      const Color(0xFFC2412D),
      const Color(0xFFD1AA34),
      const Color(0xFFA7A844),
      const Color(0xFFA46583),
      const Color(0xFF5A1E4A),
    ],
  ];

  static List<List<String>> colorsCode = [
    [
      '9D7E79',
      'CCAC95',
      '9A947C',
      '748B83',
      '5B756C',
    ],
    [
      'E7EDEA',
      'FFC52C',
      'FB0C06',
      '030D4F',
      'CEECEF',
    ],
    [
      '#EFF3CD',
      '#B2D5BA',
      '#61ADA0',
      '#248F8D',
      '#605063',
    ],
    [
      '#E3E8CD',
      '#BCD8BF',
      '#D3B9A3',
      '#EE9C92',
      '#FE857E',
    ],
    [
      '#C2412D',
      '#D1AA34',
      '#A7A844',
      '#A46583',
      '#5A1E4A',
    ],
  ];
}

class FontModel {
  final String? title;
  final TextStyle? font;
  final String? link;

  FontModel({this.title, this.font, this.link});
}

TextStyle getGoogleFont(String fontName,
    {double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black}) {
  switch (fontName.toLowerCase()) {
    case 'roboto':
      return GoogleFonts.roboto(
          fontSize: fontSize, fontWeight: fontWeight, color: color);
    case 'open sans':
      return GoogleFonts.openSans(
          fontSize: fontSize, fontWeight: fontWeight, color: color);
    case 'lato':
      return GoogleFonts.lato(
          fontSize: fontSize, fontWeight: fontWeight, color: color);
    case 'montserrat':
      return GoogleFonts.montserrat(
          fontSize: fontSize, fontWeight: fontWeight, color: color);
    // Add more cases for other Google Fonts you need
    default:
      return GoogleFonts.getFont(fontName,
          fontSize: fontSize, fontWeight: fontWeight, color: color);
  }
}
