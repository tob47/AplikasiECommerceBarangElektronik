browserName=navigator.appName;
browserVer=parseInt(navigator.appVersion);

if ((browserName=="Netscape" && browserVer>=4) || (browserName=="Microsoft Internet Explorer" && browserVer>=4))
version="n3";
else
version="n2";


var now = new Date();
var hours = now.getHours();
var minutes = now.getMinutes();

mydate = new Date();
myday = mydate.getDay();
mymonth = mydate.getMonth();
myweekday= mydate.getDate();
weekday= myweekday;
myyear= mydate.getYear();
year = myyear

if (version=="n3") {

   if(myday == 0) day = " Minggu, "
   else if(myday == 1) day = " Senin, "
   else if(myday == 2) day = " Selasa, "
   else if(myday == 3) day = " Rabu, "
   else if(myday == 4) day = " Kamis, "
   else if(myday == 5) day = " Jum'at, "
   else if(myday == 6) day = " Sabtu, "

   if(mymonth == 0) month = " Januari "
   else if(mymonth ==1) month = " Februari "
   else if(mymonth ==2) month = " Maret "
   else if(mymonth ==3) month = " April "
   else if(mymonth ==4) month = " Mei "
   else if(mymonth ==5) month = " Juni "
   else if(mymonth ==6) month = " Juli "
   else if(mymonth ==7) month = " Agustus "
   else if(mymonth ==8) month = " September "
   else if(mymonth ==9) month = " Oktober "
   else if(mymonth ==10) month = " Nopember "
   else if(mymonth ==11) month = " Desember "

if ((navigator.appName == "Microsoft Internet Explorer") && (year < 2000))		
year="19" + year;
if (navigator.appName == "Netscape")
year=1900 + year;

   document.write(day + myweekday);
   document.write(month+ ""+ year );
}