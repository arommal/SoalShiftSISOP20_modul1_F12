# SoalShiftSISOP20_modul1_F12
2.  (a) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. 

    (b) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.
    
    (c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan dienkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b.)
    
    (d) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.
    
Untuk menyelesaikan nomor 2 a dan b, kami menggunakan
```
nama=$1
cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 28 > $nama.txt
```
dimana ketika source code tersebut dijalankan dengan argumen yang diinputkan oleh user dan hanya berupa alphabet, sehingga kita menyimpan argumen tersebut ke variabel ``nama``. Kemudian kita menggunakan fungsi /dev/urandom, yang merupakan **pseudorandom number generators** yang kemudian kita translatekan menjadi A-Z, a-z, dan 0-9. ``-dc`` disini menandakan bahwa kita akan mendelete semua karakter yang bukan merupakan A-Z, a-z, atau 0-9.dan mengambil 28 karakter. Kemudian hasil random kita, kita ``cat`` dan masukkan kedalam file ``$nama.txt``, dimana $nama tadi adalah inputan user.

Untuk menyelesaikan nomor 2 c, kami menggunakan 
```
name=""
name=${1::-4}
hour=0
hour=$(date +"%H")
for ((num=1; $num <= $hour; num=num+1))
	do
	  name=$(echo "$name" | tr '[A-Za-z]' '[B-ZAb-za]')
	done
name+=".txt"
mv ./$1 ./$name
```
Dimana ketika source code tersebut dijalankan dengan 'bash soal2_enkripsi.sh namafile.txt', maka kita mulai dengan menyimpan nama file tersebut dengan ``name=${1::-4}``, disini kami menggunakan 1::4, yaitu menandakan menggunakan argumen 1, namun dikurangi 4 karakter dari akhir (agar .txt tidak ikut ter-enkripsi). Kemudian kami mengambil nilai dari jam sekarang dengan ``hour=$(date +"%H")``. Kemudian, kami melakukan loop sebanyak ``hour`` kali, untuk setiap loop, kami melakukan translate dengan mengubah yang awalnya adalah A-Z dan a-z menjadi B-ZA dan b-za hal ini dilakukan agar setiap karakter akan bergeser 1. sehingga setelah loop selesai, maka masing masing karakter dari string tersebut akan bergeser sebanyak ``hour`` kali. Kemudian kami append nama tersebut dengan".txt" kembali, dan melakukan move dari nama file awal yang merupakann argumen, menjadi ``$name`` yang merupakan hasil dari enkripsi.

Untuk menyelesaikan nomor 2 d, kami menggunakan
```
name=""
name=${1::-4}
hour=0
hour=$(date +"%H")
for ((num=1; $num <= $hour; num=num+1))
	do
	  name=$(echo "$name" | tr '[A-Za-z]' '[ZA-Yza-y]')
	done
name+=".txt"
mv ./$1 ./$name
```
Dimana source code ini hampir sama dengan source code enkripsi, hanya berbeda pada bagian translate yaitu kita mengconvert dari A-Z dan a-z menjadi ZA-Y dan za-y, yang membuat bergeser ke kiri sebanyak 1x.

