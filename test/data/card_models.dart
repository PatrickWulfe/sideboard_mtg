import 'package:scryfall_api/scryfall_api.dart' as sfa;
import 'package:sideboard/modules/mtg_submodule/data/data_index.dart';

final mtgCard1 = sfa.MtgCard.fromJson(card1Json);
final mtgCardModel1 = MtgCardModel.fromSFCard(mtgCard1);
final mtgCard2 = sfa.MtgCard.fromJson(card2Json);
final mtgCardModel2 = MtgCardModel.fromSFCard(mtgCard2);
final mtgCard3 = sfa.MtgCard.fromJson(card3Json);
final mtgCardModel3 = MtgCardModel.fromSFCard(mtgCard3);

final card1Json = {
  'object': 'card',
  'id': '5cc932f3-de94-42f6-842c-0d7c94544a9f',
  'oracle_id': '8ac43884-9f03-4945-98ea-c744d0403f32',
  'multiverse_ids': [],
  'tcgplayer_id': 270596,
  'cardmarket_id': 659241,
  'name': 'Contractual Safeguard',
  'lang': 'en',
  'released_at': '2022-04-09',
  'uri': 'https://api.scryfall.com/cards/5cc932f3-de94-42f6-842c-0d7c94544a9f',
  'scryfall_uri':
      'https://scryfall.com/card/pncc/14p/contractual-safeguard?utm_source=api',
  'layout': 'normal',
  'highres_image': true,
  'image_status': 'highres_scan',
  'image_uris': {
    'small':
        'https://cards.scryfall.io/small/front/5/c/5cc932f3-de94-42f6-842c-0d7c94544a9f.jpg?1675617740',
    'normal':
        'https://cards.scryfall.io/normal/front/5/c/5cc932f3-de94-42f6-842c-0d7c94544a9f.jpg?1675617740',
    'large':
        'https://cards.scryfall.io/large/front/5/c/5cc932f3-de94-42f6-842c-0d7c94544a9f.jpg?1675617740',
    'png':
        'https://cards.scryfall.io/png/front/5/c/5cc932f3-de94-42f6-842c-0d7c94544a9f.png?1675617740',
    'art_crop':
        'https://cards.scryfall.io/art_crop/front/5/c/5cc932f3-de94-42f6-842c-0d7c94544a9f.jpg?1675617740',
    'border_crop':
        'https://cards.scryfall.io/border_crop/front/5/c/5cc932f3-de94-42f6-842c-0d7c94544a9f.jpg?1675617740'
  },
  'mana_cost': '{2}{W}',
  'cmc': 3.0,
  'type_line': 'Instant',
  'oracle_text':
      'Addendum — If you cast this spell during your main phase, put a shield counter on a creature you control. (If it would be dealt damage or destroyed, remove a shield counter from it instead.)\nChoose a kind of counter on a creature you control. Put a counter of that kind on each other creature you control.',
  'colors': ['W'],
  'color_identity': ['W'],
  'keywords': ['Addendum'],
  'legalities': {
    'standard': 'not_legal',
    'future': 'not_legal',
    'historic': 'not_legal',
    'gladiator': 'not_legal',
    'pioneer': 'not_legal',
    'explorer': 'not_legal',
    'modern': 'not_legal',
    'legacy': 'legal',
    'pauper': 'not_legal',
    'vintage': 'legal',
    'penny': 'not_legal',
    'commander': 'legal',
    'oathbreaker': 'legal',
    'brawl': 'not_legal',
    'historicbrawl': 'not_legal',
    'alchemy': 'not_legal',
    'paupercommander': 'not_legal',
    'duel': 'legal',
    'oldschool': 'not_legal',
    'premodern': 'not_legal',
    'predh': 'not_legal'
  },
  'games': ['paper'],
  'reserved': false,
  'foil': true,
  'nonfoil': false,
  'finishes': ['foil'],
  'oversized': false,
  'promo': true,
  'reprint': true,
  'variation': false,
  'set_id': '8f92ac22-a208-41a8-b77c-ceffbeb6a255',
  'set': 'pncc',
  'set_name': 'New Capenna Commander Promos',
  'set_type': 'promo',
  'set_uri':
      'https://api.scryfall.com/sets/8f92ac22-a208-41a8-b77c-ceffbeb6a255',
  'set_search_uri':
      'https://api.scryfall.com/cards/search?order=set&q=e%3Apncc&unique=prints',
  'scryfall_set_uri': 'https://scryfall.com/sets/pncc?utm_source=api',
  'rulings_uri':
      'https://api.scryfall.com/cards/5cc932f3-de94-42f6-842c-0d7c94544a9f/rulings',
  'prints_search_uri':
      'https://api.scryfall.com/cards/search?order=released&q=oracleid%3A8ac43884-9f03-4945-98ea-c744d0403f32&unique=prints',
  'collector_number': '14p',
  'digital': false,
  'rarity': 'rare',
  'watermark': 'brokers',
  'card_back_id': '0aeebaf5-8c7d-4636-9e82-8c27447861f7',
  'artist': 'Gaboleps',
  'artist_ids': ['0c37cdfe-5651-4ae6-a3c8-e7153509f970'],
  'illustration_id': '34f34726-3f92-4946-84ff-60a4f073a502',
  'border_color': 'black',
  'frame': '2015',
  'security_stamp': 'oval',
  'full_art': false,
  'textless': false,
  'booster': false,
  'story_spotlight': false,
  'promo_types': ['promopack', 'stamped'],
  'edhrec_rank': 6590,
  'prices': {
    'usd': null,
    'usd_foil': '5.98',
    'usd_etched': null,
    'eur': null,
    'eur_foil': '10.00',
    'tix': null
  },
  'related_uris': {
    'tcgplayer_infinite_articles':
        'https://infinite.tcgplayer.com/search?contentMode=article&game=magic&partner=scryfall&q=Contractual+Safeguard&utm_campaign=affiliate&utm_medium=api&utm_source=scryfall',
    'tcgplayer_infinite_decks':
        'https://infinite.tcgplayer.com/search?contentMode=deck&game=magic&partner=scryfall&q=Contractual+Safeguard&utm_campaign=affiliate&utm_medium=api&utm_source=scryfall',
    'edhrec': 'https://edhrec.com/route/?cc=Contractual+Safeguard'
  },
  'purchase_uris': {
    'tcgplayer':
        'https://www.tcgplayer.com/product/270596?page=1&utm_campaign=affiliate&utm_medium=api&utm_source=scryfall',
    'cardmarket':
        'https://www.cardmarket.com/en/Magic/Products/Search?referrer=scryfall&searchString=Contractual+Safeguard&utm_campaign=card_prices&utm_medium=text&utm_source=scryfall',
    'cardhoarder':
        'https://www.cardhoarder.com/cards?affiliate_id=scryfall&data%5Bsearch%5D=Contractual+Safeguard&ref=card-profile&utm_campaign=affiliate&utm_medium=card&utm_source=scryfall'
  }
};

final card2Json = {
  'object': 'card',
  'id': 'fd1a1f48-d46b-4b8e-a642-fc70fd9ef7df',
  'oracle_id': '5d66c2b9-6011-4168-b468-0bde50bac37e',
  'multiverse_ids': [247130],
  'mtgo_id': 43279,
  'mtgo_foil_id': 43280,
  'tcgplayer_id': 57674,
  'cardmarket_id': 252535,
  'name': 'Warden of the Wall',
  'lang': 'en',
  'released_at': '2012-02-03',
  'uri': 'https://api.scryfall.com/cards/fd1a1f48-d46b-4b8e-a642-fc70fd9ef7df',
  'scryfall_uri':
      'https://scryfall.com/card/dka/153/warden-of-the-wall?utm_source=api',
  'layout': 'normal',
  'highres_image': true,
  'image_status': 'highres_scan',
  'image_uris': {
    'small':
        'https://cards.scryfall.io/small/front/f/d/fd1a1f48-d46b-4b8e-a642-fc70fd9ef7df.jpg?1562954951',
    'normal':
        'https://cards.scryfall.io/normal/front/f/d/fd1a1f48-d46b-4b8e-a642-fc70fd9ef7df.jpg?1562954951',
    'large':
        'https://cards.scryfall.io/large/front/f/d/fd1a1f48-d46b-4b8e-a642-fc70fd9ef7df.jpg?1562954951',
    'png':
        'https://cards.scryfall.io/png/front/f/d/fd1a1f48-d46b-4b8e-a642-fc70fd9ef7df.png?1562954951',
    'art_crop':
        'https://cards.scryfall.io/art_crop/front/f/d/fd1a1f48-d46b-4b8e-a642-fc70fd9ef7df.jpg?1562954951',
    'border_crop':
        'https://cards.scryfall.io/border_crop/front/f/d/fd1a1f48-d46b-4b8e-a642-fc70fd9ef7df.jpg?1562954951'
  },
  'mana_cost': '{3}',
  'cmc': 3.0,
  'type_line': 'Artifact',
  'oracle_text':
      "Warden of the Wall enters the battlefield tapped.\n{T}: Add {C}.\nAs long as it's not your turn, Warden of the Wall is a 2/3 Gargoyle artifact creature with flying.",
  'colors': [],
  'color_identity': [],
  'keywords': [],
  'produced_mana': ['C'],
  'legalities': {
    'standard': 'not_legal',
    'future': 'not_legal',
    'historic': 'not_legal',
    'gladiator': 'not_legal',
    'pioneer': 'not_legal',
    'explorer': 'not_legal',
    'modern': 'legal',
    'legacy': 'legal',
    'pauper': 'not_legal',
    'vintage': 'legal',
    'penny': 'legal',
    'commander': 'legal',
    'oathbreaker': 'legal',
    'brawl': 'not_legal',
    'historicbrawl': 'not_legal',
    'alchemy': 'not_legal',
    'paupercommander': 'not_legal',
    'duel': 'legal',
    'oldschool': 'not_legal',
    'premodern': 'not_legal',
    'predh': 'not_legal'
  },
  'games': ['paper', 'mtgo'],
  'reserved': false,
  'foil': true,
  'nonfoil': true,
  'finishes': ['nonfoil', 'foil'],
  'oversized': false,
  'promo': false,
  'reprint': false,
  'variation': false,
  'set_id': '8052750a-aaf2-46fc-b46d-633f14124017',
  'set': 'dka',
  'set_name': 'Dark Ascension',
  'set_type': 'expansion',
  'set_uri':
      'https://api.scryfall.com/sets/8052750a-aaf2-46fc-b46d-633f14124017',
  'set_search_uri':
      'https://api.scryfall.com/cards/search?order=set&q=e%3Adka&unique=prints',
  'scryfall_set_uri': 'https://scryfall.com/sets/dka?utm_source=api',
  'rulings_uri':
      'https://api.scryfall.com/cards/fd1a1f48-d46b-4b8e-a642-fc70fd9ef7df/rulings',
  'prints_search_uri':
      'https://api.scryfall.com/cards/search?order=released&q=oracleid%3A5d66c2b9-6011-4168-b468-0bde50bac37e&unique=prints',
  'collector_number': '153',
  'digital': false,
  'rarity': 'uncommon',
  'card_back_id': '0aeebaf5-8c7d-4636-9e82-8c27447861f7',
  'artist': 'Daniel Ljunggren',
  'artist_ids': ['0fbd4798-76eb-46d5-a5d4-1e3a25870e34'],
  'illustration_id': 'a1ff5002-e323-4a13-832f-0428a7f75aa9',
  'border_color': 'black',
  'frame': '2003',
  'full_art': false,
  'textless': false,
  'booster': true,
  'story_spotlight': false,
  'edhrec_rank': 18062,
  'penny_rank': 10465,
  'prices': {
    'usd': '0.10',
    'usd_foil': '0.29',
    'usd_etched': null,
    'eur': '0.10',
    'eur_foil': '0.02',
    'tix': '0.04'
  },
  'related_uris': {
    'gatherer':
        'https://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid=247130',
    'tcgplayer_infinite_articles':
        'https://infinite.tcgplayer.com/search?contentMode=article&game=magic&partner=scryfall&q=Warden+of+the+Wall&utm_campaign=affiliate&utm_medium=api&utm_source=scryfall',
    'tcgplayer_infinite_decks':
        'https://infinite.tcgplayer.com/search?contentMode=deck&game=magic&partner=scryfall&q=Warden+of+the+Wall&utm_campaign=affiliate&utm_medium=api&utm_source=scryfall',
    'edhrec': 'https://edhrec.com/route/?cc=Warden+of+the+Wall'
  },
  'purchase_uris': {
    'tcgplayer':
        'https://www.tcgplayer.com/product/57674?page=1&utm_campaign=affiliate&utm_medium=api&utm_source=scryfall',
    'cardmarket':
        'https://www.cardmarket.com/en/Magic/Products/Search?referrer=scryfall&searchString=Warden+of+the+Wall&utm_campaign=card_prices&utm_medium=text&utm_source=scryfall',
    'cardhoarder':
        'https://www.cardhoarder.com/cards/43279?affiliate_id=scryfall&ref=card-profile&utm_campaign=affiliate&utm_medium=card&utm_source=scryfall'
  }
};

final card3Json = {
  'object': 'card',
  'id': 'a382a9b8-0b19-46c2-a547-a22d6e23d0ac',
  'oracle_id': '257ee9a0-5ee0-49c4-8619-e75e1134d7ac',
  'multiverse_ids': [88784],
  'mtgo_id': 22184,
  'mtgo_foil_id': 22185,
  'tcgplayer_id': 12498,
  'cardmarket_id': 12726,
  'name': 'Oboro Breezecaller',
  'lang': 'en',
  'released_at': '2005-06-03',
  'uri': 'https://api.scryfall.com/cards/a382a9b8-0b19-46c2-a547-a22d6e23d0ac',
  'scryfall_uri':
      'https://scryfall.com/card/sok/48/oboro-breezecaller?utm_source=api',
  'layout': 'normal',
  'highres_image': true,
  'image_status': 'highres_scan',
  'image_uris': {
    'small':
        'https://cards.scryfall.io/small/front/a/3/a382a9b8-0b19-46c2-a547-a22d6e23d0ac.jpg?1562495145',
    'normal':
        'https://cards.scryfall.io/normal/front/a/3/a382a9b8-0b19-46c2-a547-a22d6e23d0ac.jpg?1562495145',
    'large':
        'https://cards.scryfall.io/large/front/a/3/a382a9b8-0b19-46c2-a547-a22d6e23d0ac.jpg?1562495145',
    'png':
        'https://cards.scryfall.io/png/front/a/3/a382a9b8-0b19-46c2-a547-a22d6e23d0ac.png?1562495145',
    'art_crop':
        'https://cards.scryfall.io/art_crop/front/a/3/a382a9b8-0b19-46c2-a547-a22d6e23d0ac.jpg?1562495145',
    'border_crop':
        'https://cards.scryfall.io/border_crop/front/a/3/a382a9b8-0b19-46c2-a547-a22d6e23d0ac.jpg?1562495145'
  },
  'mana_cost': '{1}{U}',
  'cmc': 2.0,
  'type_line': 'Creature — Moonfolk Wizard',
  'oracle_text':
      "Flying\n{2}, Return a land you control to its owner's hand: Untap target land.",
  'power': '1',
  'toughness': '1',
  'colors': ['U'],
  'color_identity': ['U'],
  'keywords': ['Flying'],
  'legalities': {
    'standard': 'not_legal',
    'future': 'not_legal',
    'historic': 'not_legal',
    'gladiator': 'not_legal',
    'pioneer': 'not_legal',
    'explorer': 'not_legal',
    'modern': 'legal',
    'legacy': 'legal',
    'pauper': 'legal',
    'vintage': 'legal',
    'penny': 'legal',
    'commander': 'legal',
    'oathbreaker': 'legal',
    'brawl': 'not_legal',
    'historicbrawl': 'not_legal',
    'alchemy': 'not_legal',
    'paupercommander': 'legal',
    'duel': 'legal',
    'oldschool': 'not_legal',
    'premodern': 'not_legal',
    'predh': 'legal'
  },
  'games': ['paper', 'mtgo'],
  'reserved': false,
  'foil': true,
  'nonfoil': true,
  'finishes': ['nonfoil', 'foil'],
  'oversized': false,
  'promo': false,
  'reprint': false,
  'variation': false,
  'set_id': '4db16ad3-2b95-442f-bb6b-e9aa7fe7f769',
  'set': 'sok',
  'set_name': 'Saviors of Kamigawa',
  'set_type': 'expansion',
  'set_uri':
      'https://api.scryfall.com/sets/4db16ad3-2b95-442f-bb6b-e9aa7fe7f769',
  'set_search_uri':
      'https://api.scryfall.com/cards/search?order=set&q=e%3Asok&unique=prints',
  'scryfall_set_uri': 'https://scryfall.com/sets/sok?utm_source=api',
  'rulings_uri':
      'https://api.scryfall.com/cards/a382a9b8-0b19-46c2-a547-a22d6e23d0ac/rulings',
  'prints_search_uri':
      'https://api.scryfall.com/cards/search?order=released&q=oracleid%3A257ee9a0-5ee0-49c4-8619-e75e1134d7ac&unique=prints',
  'collector_number': '48',
  'digital': false,
  'rarity': 'common',
  'flavor_text':
      '\"I feel their unnatural influence in the weary, weeping land. Do they care nothing for the creatures who walk below their clouds?\"\n—Eight-and-a-Half-Tails',
  'card_back_id': '0aeebaf5-8c7d-4636-9e82-8c27447861f7',
  'artist': 'Rebecca Guay',
  'artist_ids': ['f8f662fa-d597-46a3-afb2-91d6e13243e2'],
  'illustration_id': '2cc0247d-ee57-4268-ac7d-57900981d5c6',
  'border_color': 'black',
  'frame': '2003',
  'full_art': false,
  'textless': false,
  'booster': true,
  'story_spotlight': false,
  'edhrec_rank': 10823,
  'penny_rank': 10626,
  'prices': {
    'usd': '0.24',
    'usd_foil': '9.02',
    'usd_etched': null,
    'eur': '0.02',
    'eur_foil': '0.18',
    'tix': '0.02'
  },
  'related_uris': {
    'gatherer':
        'https://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid=88784',
    'tcgplayer_infinite_articles':
        'https://infinite.tcgplayer.com/search?contentMode=article&game=magic&partner=scryfall&q=Oboro+Breezecaller&utm_campaign=affiliate&utm_medium=api&utm_source=scryfall',
    'tcgplayer_infinite_decks':
        'https://infinite.tcgplayer.com/search?contentMode=deck&game=magic&partner=scryfall&q=Oboro+Breezecaller&utm_campaign=affiliate&utm_medium=api&utm_source=scryfall',
    'edhrec': 'https://edhrec.com/route/?cc=Oboro+Breezecaller'
  },
  'purchase_uris': {
    'tcgplayer':
        'https://www.tcgplayer.com/product/12498?page=1&utm_campaign=affiliate&utm_medium=api&utm_source=scryfall',
    'cardmarket':
        'https://www.cardmarket.com/en/Magic/Products/Search?referrer=scryfall&searchString=Oboro+Breezecaller&utm_campaign=card_prices&utm_medium=text&utm_source=scryfall',
    'cardhoarder':
        'https://www.cardhoarder.com/cards/22184?affiliate_id=scryfall&ref=card-profile&utm_campaign=affiliate&utm_medium=card&utm_source=scryfall'
  }
};
