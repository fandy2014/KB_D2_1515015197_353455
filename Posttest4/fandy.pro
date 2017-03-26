DOMAINS
 
    nama,jender,pekerjaan,benda,alasan,zat = symbol
    umur = integer

PREDICATES
  nondeterm orang(nama,umur,jender,pekerjaan)
  nondeterm selingkuh(nama,nama)
  terbunuh_dengan(nama,benda)
  terbunuh(nama)
  nondeterm pembunuh(nama)
  motif(alasan)
  ternodai(nama,zat)
  milik(nama,benda)
  nondeterm cara_kerja_mirip(benda,benda)
  nondeterm kemungkinan_milik(nama,benda)
  nondeterm dicurigai(nama)
ClAUSES
  orang(budi,55,m,tukang_kayu).
  orang(aldi,25,m,pemain_sepak_bola).
  orang(aldi,25,m,tukang_jagal).
  orang(joni,25,m,pencopet).

  selingkuh(ina,joni).
  selingkuh(ina,budi).
  selingkuh(siti,joni).

  terbunuh_dengan(siti,pentungan).
  terbunuh(siti).

  motif(uang).
  motif(cemburu).
  motif(dendam).

  ternodai(budi,darah).
  ternodai(siti,darah).
  ternodai(aldi,lumpur).
  ternodai(joni,coklat).
  ternodai(ina,coklat).

  milik(budi,kaki_palsu).
  milik(joni,pistol).

  cara_kerja_mirip(kaki_palsu,pentungan).
  cara_kerja_mirip(balok,pentungan).
  cara_kerja_mirip(gunting,pisau).
  cara_kerja_mirip(sepak_bola,pentungan).

  kemungkinan_milik(X,sepatu_bola):- orang(X,_,_,pemain_sepak_bola).
  kemungkinan_milik(X,gunting):- orang(X,_,_,pekerja_salon).
  kemungkinan_milik(X,Benda):- milik(X,Benda).

  dicurigai(X):- 
  terbunuh_dengan(siti,Senjata),
  cara_kerja_mirip(Benda,Senjata),
  kemungkinan_milik(X,Benda).

  dicurigai(X):-
  motif(cemburu),
  orang(X,_,m,_),
  selingkuh(siti,X).

  dicurigai(X):-
  motif(cemburu),
  orang(X,_,f,_),
  selingkuh(X,Lakilaki),
  selingkuh(siti,Lakilaki).

  dicurigai(X):-
  motif(uang),
  orang(X,_,_,pencopet).

  pembunuh(Pembunuh):- %ini sebagai unifikasi argumen
  orang(Pembunuh,_,_,_),%ini sebagai sub goal kepertama 
  terbunuh(Terbunuh),%ini sebagai sub goal kedua
  Terbunuh <> Pembunuh,
  dicurigai(Pembunuh),%ini sebagai sub goal ketiga
  ternodai(Pembunuh,Zat),
  ternodai(Terbunuh,Zat).

GOAL
  pembunuh(X).% x adalah variabel yang dapat di unifikasikan karena pembunuh juga variabel bebas dapat di unifikasi maka x=pembunuh
 
  %Pembunuhnya adalah Budi karena ia adalah seorang tukang kayu, dan siti terbunuh dengan pentungan dan pentungan itu terbuat dari kayu, Jadi motif pembunuhannnya dikarenakan Budi cemburu Sirti selingkuh dengan Joni.
  %Budi ternodai darah sama seperti Siti.
  