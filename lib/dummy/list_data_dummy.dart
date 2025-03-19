import '../domain/model/model_data_dummy.dart';

List<ModelDataDummy> listDataDummy = [
  ModelDataDummy(
    title: 'Explore Bali 3D2N',
    location: 'Bali, Indonesia',
    photos: [
      'https://images.unsplash.com/photo-1521791772602-45ed00c1226f',
      'https://images.unsplash.com/photo-1573790387438-4da905039392',
    ],
    price: 'IDR 3.500.000',
    rating: 4.8,
    description:
        'Nikmati perjalanan tak terlupakan ke Bali selama 3 hari 2 malam. Paket ini mencakup kunjungan ke destinasi ikonik seperti Tanah Lot, Ubud, dan Pantai Kuta. Anda akan menginap di hotel berbintang 4 dengan fasilitas terbaik, mencicipi kuliner lokal yang lezat, serta menikmati pengalaman budaya yang kaya seperti tari Kecak di Uluwatu. Pemandu wisata berpengalaman akan menemani perjalanan Anda untuk memastikan pengalaman yang menyenangkan dan informatif.',
    includedFacilities: [
      'Transportasi',
      'Hotel Bintang 4',
      'Sarapan',
      'Pemandu Wisata',
      'Tiket Masuk'
    ],
    excludedFacilities: ['Makan siang', 'Makan malam', 'Asuransi perjalanan'],
    termsAndConditions:
        'Minimal 2 peserta. Pembatalan maksimal 7 hari sebelum keberangkatan.',
    maxParticipants: 10,
    totalRating: 127,
    pricePackage: [
      PricePackage(
        title: 'Paket 1',
        price: 'IDR 3.500.000',
        description: 'Paket 3 hari 2 malam dengan fasilitas terbaik.',
        includedFacilities: [
          'Transportasi',
          'Hotel Bintang 4',
          'Sarapan',
          'Pemandu Wisata',
          'Tiket Masuk'
        ],
        excludedFacilities: [
          'Makan siang',
          'Makan malam',
          'Asuransi perjalanan'
        ],
        termsAndConditions: 'Minimal 2 peserta.',
        maxParticipants: 10,
      ),
      PricePackage(
        title: 'Paket 2',
        price: 'IDR 4.000.000',
        description: 'Paket 3 hari 2 malam dengan fasilitas terbaik.',
        includedFacilities: [
          'Transportasi',
          'Hotel Bintang 5',
          'Sarapan',
          'Makan Siang',
          'Pemandu Wisata',
          'Tiket Masuk'
        ],
        excludedFacilities: ['Makan malam', 'Asuransi perjalanan'],
        termsAndConditions: 'Minimal 2 peserta.',
        maxParticipants: 10,
      ),
      PricePackage(
        title: 'Paket 3',
        price: 'IDR 4.500.000',
        description: 'Paket 3 hari 2 malam dengan fasilitas terbaik.',
        includedFacilities: [
          'Transportasi',
          'Hotel Bintang 5',
          'Sarapan',
          'Makan Siang',
          'Makan Malam',
          'Pemandu Wisata',
          'Tiket Masuk'
        ],
        excludedFacilities: ['Asuransi perjalanan'],
        termsAndConditions: 'Minimal 2 peserta.',
        maxParticipants: 10,
      ),
    ],
  ),
  ModelDataDummy(
    title: 'Overland Flores 5D4N',
    location: 'Flores, Indonesia',
    photos: [
      'https://images.unsplash.com/photo-1677848352309-6d51fece8420',
      'https://images.unsplash.com/photo-1702564502101-ff72bea956e9',
    ],
    price: 'IDR 6.500.000',
    rating: 4.7,
    description:
        'Jelajahi keindahan alam Flores dalam perjalanan selama 5 hari 4 malam. Destinasi ini menawarkan lanskap alam yang luar biasa, mulai dari Danau Kelimutu yang memiliki tiga warna berbeda, hingga Pantai Pink yang eksotis. Anda juga akan mengunjungi desa tradisional Wae Rebo, tempat unik dengan rumah adat berbentuk kerucut. Dengan fasilitas terbaik, perjalanan ini akan memberikan pengalaman yang kaya akan budaya dan keindahan alam yang memukau.',
    includedFacilities: [
      'Tiket Pesawat PP',
      'Resort',
      'Makan 3x sehari',
      'Pemandu Wisata',
      'Transportasi Lokal'
    ],
    excludedFacilities: ['Asuransi perjalanan', 'Tiket masuk wisata premium'],
    termsAndConditions:
        'Minimal 4 peserta. Tidak termasuk tiket masuk ke Taman Nasional Komodo.',
    maxParticipants: 15,
    totalRating: 102,
    pricePackage: [
      PricePackage(
        title: 'Paket 1',
        price: 'IDR 6.500.000',
        description: 'Paket 5 hari 4 malam dengan fasilitas terbaik.',
        includedFacilities: [
          'Tiket Pesawat PP',
          'Resort',
          'Makan 3x sehari',
          'Pemandu Wisata',
          'Transportasi Lokal'
        ],
        excludedFacilities: [
          'Asuransi perjalanan',
          'Tiket masuk wisata premium'
        ],
        termsAndConditions: 'Minimal 4 peserta.',
        maxParticipants: 15,
      ),
      PricePackage(
        title: 'Paket 2',
        price: 'IDR 7.000.000',
        description: 'Paket 5 hari 4 malam dengan fasilitas terbaik.',
        includedFacilities: [
          'Tiket Pesawat PP',
          'Resort',
          'Makan 3x sehari',
          'Pemandu Wisata',
          'Transportasi Lokal',
          'Tiket Masuk Wisata Premium'
        ],
        excludedFacilities: ['Asuransi perjalanan'],
        termsAndConditions: 'Minimal 4 peserta.',
        maxParticipants: 15,
      ),
    ],
  ),
  ModelDataDummy(
    title: 'Raja Ampat Adventure 4D3N',
    location: 'Raja Ampat, Indonesia',
    photos: [
      'https://images.unsplash.com/photo-1516690561799-46d8f74f9abf',
      'https://images.unsplash.com/photo-1601844075967-c1376c021732',
    ],
    price: 'IDR 8.000.000',
    rating: 4.9,
    description:
        'Jelajahi keindahan bawah laut Raja Ampat dalam perjalanan eksklusif selama 4 hari 3 malam. Nikmati panorama alam yang spektakuler, snorkeling di perairan jernih dengan terumbu karang yang masih alami, serta bertemu dengan berbagai biota laut yang menakjubkan. Selain itu, kamu juga akan diajak mengunjungi pulau-pulau eksotis, menikmati suasana tenang di pantai pasir putih, dan merasakan pengalaman tak terlupakan di surga tropis Indonesia.',
    includedFacilities: [
      'Snorkeling Equipment',
      'Resort Terapung',
      'Makan 3x sehari',
      'Transportasi Kapal'
    ],
    excludedFacilities: [
      'Peralatan diving',
      'Asuransi perjalanan',
      'Pajak wisata lokal'
    ],
    termsAndConditions:
        'Minimal 6 peserta. Pembatalan maksimal 10 hari sebelum keberangkatan.',
    maxParticipants: 12,
    totalRating: 45,
    pricePackage: [
      PricePackage(
        title: 'Paket 1',
        price: 'IDR 8.000.000',
        description: 'Paket 4 hari 3 malam dengan fasilitas terbaik.',
        includedFacilities: [
          'Snorkeling Equipment',
          'Resort Terapung',
          'Makan 3x sehari',
          'Transportasi Kapal'
        ],
        excludedFacilities: [
          'Peralatan diving',
          'Asuransi perjalanan',
          'Pajak wisata lokal'
        ],
        termsAndConditions: 'Minimal 6 peserta.',
        maxParticipants: 12,
      ),
      PricePackage(
        title: 'Paket 2',
        price: 'IDR 9.000.000',
        description: 'Paket 4 hari 3 malam dengan fasilitas terbaik.',
        includedFacilities: [
          'Snorkeling Equipment',
          'Resort Terapung',
          'Makan 3x sehari',
          'Transportasi Kapal',
          'Peralatan Diving'
        ],
        excludedFacilities: ['Asuransi perjalanan', 'Pajak wisata lokal'],
        termsAndConditions: 'Minimal 6 peserta.',
        maxParticipants: 12,
      ),
      PricePackage(
        title: 'Paket 3',
        price: 'IDR 10.000.000',
        description: 'Paket 4 hari 3 malam dengan fasilitas terbaik.',
        includedFacilities: [
          'Snorkeling Equipment',
          'Resort Terapung',
          'Makan 3x sehari',
          'Transportasi Kapal',
          'Peralatan Diving',
          'Asuransi Perjalanan'
        ],
        excludedFacilities: ['Pajak wisata lokal'],
        termsAndConditions: 'Minimal 6 peserta.',
        maxParticipants: 12,
      ),
    ],
  ),
  ModelDataDummy(
    title: 'Bromo Sunrise Tour 2D1N',
    location: 'Gunung Bromo, Jawa Timur',
    photos: [
      'https://images.unsplash.com/photo-1588668214407-6ea9a6d8c272',
      'https://images.unsplash.com/photo-1589277683134-e0fc4231addf',
    ],
    price: 'IDR 1.800.000',
    rating: 4.6,
    description:
        'Saksikan keindahan matahari terbit dari puncak Gunung Bromo dalam perjalanan seru selama 2 hari 1 malam. Perjalanan ini akan membawa kamu menjelajahi lautan pasir yang luas, mendaki ke kawah Bromo yang megah, dan menikmati pemandangan indah dari Bukit Penanjakan. Tidak hanya itu, kamu juga akan mengunjungi spot-spot ikonik lainnya seperti Bukit Teletubbies dan Pasir Berbisik yang menawarkan pengalaman wisata alam yang luar biasa.',
    includedFacilities: [
      'Transportasi Jeep 4x4',
      'Penginapan',
      'Pemandu Wisata',
      'Tiket Masuk Bromo'
    ],
    excludedFacilities: ['Makan siang', 'Makan malam', 'Mobil di Bromo'],
    termsAndConditions:
        'Minimal 3 peserta. Tour dimulai dari Malang atau Surabaya.',
    maxParticipants: 8,
    totalRating: 78,
    pricePackage: [
      PricePackage(
        title: 'Paket 1',
        price: 'IDR 1.800.000',
        description: 'Paket 2 hari 1 malam dengan fasilitas terbaik.',
        includedFacilities: [
          'Transportasi Jeep 4x4',
          'Penginapan',
          'Pemandu Wisata',
          'Tiket Masuk Bromo'
        ],
        excludedFacilities: ['Makan siang', 'Makan malam', 'Mobil di Bromo'],
        termsAndConditions: 'Minimal 3 peserta.',
        maxParticipants: 8,
      ),
      PricePackage(
        title: 'Paket 2',
        price: 'IDR 2.000.000',
        description: 'Paket 2 hari 1 malam dengan fasilitas terbaik.',
        includedFacilities: [
          'Transportasi Jeep 4x4',
          'Penginapan',
          'Pemandu Wisata',
          'Tiket Masuk Bromo',
          'Makan Siang'
        ],
        excludedFacilities: ['Makan malam', 'Mobil di Bromo'],
        termsAndConditions: 'Minimal 3 peserta.',
        maxParticipants: 8,
      ),
    ],
  ),
  ModelDataDummy(
    title: 'Labuan Bajo Sailing Trip 3D2N',
    location: 'Labuan Bajo, Indonesia',
    photos: [
      'https://images.unsplash.com/photo-1589309736404-2e142a2acdf0',
      'https://images.unsplash.com/photo-1643044034131-001b53336bd0',
    ],
    price: 'IDR 7.200.000',
    rating: 4.8,
    description:
        'Nikmati pengalaman live on board di Labuan Bajo selama 3 hari 2 malam, menjelajahi keajaiban Kepulauan Komodo. Berlayar di atas kapal yang nyaman, kamu akan mengunjungi destinasi menakjubkan seperti Pulau Padar dengan pemandangan bukitnya yang ikonik, Pink Beach dengan pasir merah muda yang unik, serta Pulau Komodo untuk bertemu langsung dengan komodo, hewan purba yang hanya ada di Indonesia. Selain itu, snorkeling di perairan jernih dan menikmati sunset dari atas kapal akan menjadi pengalaman yang sulit dilupakan.',
    includedFacilities: [
      'Kapal Phinisi',
      'Makan 3x sehari',
      'Snorkeling Gear',
      'Guide Profesional',
      'Tiket Pulau Komodo'
    ],
    excludedFacilities: ['Pajak wisata lokal', 'Diving', 'Asuransi perjalanan'],
    termsAndConditions:
        'Minimal 5 peserta. Kapal berangkat dari Pelabuhan Labuan Bajo.',
    maxParticipants: 14,
    totalRating: 89,
    pricePackage: [
      PricePackage(
        title: 'Paket 1',
        price: 'IDR 7.200.000',
        description: 'Paket 3 hari 2 malam dengan fasilitas terbaik.',
        includedFacilities: [
          'Kapal Phinisi',
          'Makan 3x sehari',
          'Snorkeling Gear',
          'Guide Profesional',
          'Tiket Pulau Komodo'
        ],
        excludedFacilities: [
          'Pajak wisata lokal',
          'Diving',
          'Asuransi perjalanan'
        ],
        termsAndConditions: 'Minimal 5 peserta.',
        maxParticipants: 14,
      ),
      PricePackage(
        title: 'Paket 2',
        price: 'IDR 8.000.000',
        description: 'Paket 3 hari 2 malam dengan fasilitas terbaik.',
        includedFacilities: [
          'Kapal Phinisi',
          'Makan 3x sehari',
          'Snorkeling Gear',
          'Guide Profesional',
          'Tiket Pulau Komodo',
          'Diving'
        ],
        excludedFacilities: ['Pajak wisata lokal', 'Asuransi perjalanan'],
        termsAndConditions: 'Minimal 5 peserta.',
        maxParticipants: 14,
      ),
    ],
  ),
];
