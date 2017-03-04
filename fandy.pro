/**
Create By Fandy 
***/

predicates
  memiliki(symbol,symbol,integer) - nondeterm (o,i,o) %di dalam kurung adalah Tipe data
  ini(symbol,symbol,integer) - nondeterm (o,i,o) %nondeterm o adalah outputnya dan i adalah inputan
clauses
  memiliki(fandy,uang,5000).
  memiliki(novel,duit,1000).
  memiliki(ingan,dollar,2000).
  memiliki(tiyan,rupiah,6000).
  memiliki(ishak,euro,6564).
  
  ini(Nama,Harta,Memiliki):- %dalam kurung adalah variable
  	memiliki(Nama,Harta,Memiliki).
  	
goal
  memiliki(Nama,uang,Memiliki). %karena untuk memiliki uang hanya ada 1,jadi menghasilkan 1 solution dan nama = fandy , Memiliki = 5000.

