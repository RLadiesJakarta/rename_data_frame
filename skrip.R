#Menggunakan base R untuk membuat dataframe,
#menambahkan variabel berdasarkan suatu kategori numerik
#memberikan nama baru untuk salah satu level suatu variabel
#mengurutkan variabel berdasarkan nilai numerik

#buat variabel

nama_kota <- c("Jakarta","Bogor","Bandung","Medan","Tangerang",
               "Padang","Palembang","Banda Aceh")

populasi<-c(9000000,
            950000,
            2300000,
            2000000,
            1800000,
            830000,
            1400000,
            220000)

luas<-c(660,
        120,
        160,
        260,
        150,
        690,
        400,
        60)

#buat dataset
ds<-data.frame(nama_kota,populasi,luas)

#buat variabel baru (kepadatan penduduk: populasi/luas)
ds$kepadatan <- ds$populasi/ds$luas
ds #variabel baru terbentuk

#buat dataset baru berdasarkan pengkategorian
summary(ds$populasi)

#populasi >231000 dikategorikan "tinggi",
#populasi <231000 dikategorikan "rendah,
#dan nilai lainnya adalah "sedang"
ds$f.populasi <- ifelse(ds$populasi >2310000, "tinggi", 
                        ifelse(ds$populasi < 231000, "rendah", "sedang"))

#rename level dari faktor
ds$nama_kota<-as.factor(ds$nama_kota) #jadikan data kategorikal
ds$f.populasi<-as.factor(ds$f.populasi) #jadikan data kategorikal

#kita ubah Jakarta menjadi DKI Jkt, sementara yg lain sama
levels(ds$nama_kota)[levels(ds$nama_kota)=="Jakarta"] <- "DKI Jakarta"
ds$nama_kota

#kita urutkan berdasarkan keinginan (misalnya ukuran populasi)
ds.new1 <- ds[order(populasi),] #dari kecil ke besar
ds.new2 <- ds[order(-populasi),] #dari besar ke kecil



