% ARIZA ÇEŞİTLERİ 
fault(motor_calismiyor, 'Motor Çalışmıyor') :-symptom(mars_motoru_arizasi, 'Marş motoru arızalı mı?');
    	symptom(atesleme_hatasi, 'Ateşleme sisteminde hata var mı?');
    	symptom(yakit_yok, 'Araçta yakıt yok mu?');
    	symptom(bitik_aku, 'Akü bitmiş mi?').

fault(motor_tekliyor, 'Motor Tekleme Yapıyor') :-symptom(buji_arizasi, 'Buji arızalı mı veya kablosu kopuk mu?');
    	symptom(kirli_enjektor, 'Enjektör kirli mi?');
    	symptom(hava_yakit_karisimi, 'Hava yakıt karışımı hatalı mı?').

fault(motor_isinmasi, 'Motor Aşırı Isınıyor') :-symptom(yetersiz_radyator_suyu, 'Radyatör suyu az mı?');
    	symptom(arizali_fan, 'Fan arızalı mı?');
    	symptom(arizali_termostat, 'Termostat arızalı mı?').

fault(gosterge_calismiyor, 'Göstergeler çalışmıyor') :-symptom(yanik_sigorta, 'Sigorta yanmış mı?');
    	symptom(arizali_ecu, 'ECU (Beyin) arızalı mı?');
    	symptom(kopuk_kablo, 'Kopuk kablo var mı?').

fault(motor_yakit_almiyor, 'Motora Yakıt Gitmiyor') :-symptom(arizali_yakit_pompasi, 'Yakıt pompası arızalı mı?');
    	symptom(tikali_yakit_filtresi, 'yakıt filtresi tıkalı mı?').

fault(su_sizintisi, 'Araçta su sızıntısı var') :-symptom(catlak_hortum, 'Hortum çatlamış mı?');
    	symptom(delik_radyator, 'Radyatörde delik var mı?');
    	symptom(yanik_conta, 'Conta yanmış mı?').

fault(yakit_kacagi, 'Yakıt Kaçağı var') :-symptom(delik_yakit_hatti, 'Yakıt hattında delik var mı?');
    	symptom(gevsek_baglanti, 'Yakıt hattında gevşek bir bağlantı var mı?').
	
fault(zor_vites_gecisi, 'Vites Geçişi Zorlu') :-symptom(gevsek_debriyaj_teli, 'Debriyaj teli gevşemiş mi?');
    	symptom(hidrolik_kacak, 'Hidrolikte kaçak var mı?').

fault(otomatik_vites_kayisi, 'Vites Otomatik Kayıyor') :-symptom(dusuk_yag_basinci, 'Yağ basıncı düşük mü?');
    	symptom(arizali_tork_konvertoru, 'Tork konvertörü arızalı mı?').

fault(fren_tutmuyor, 'Fren Tutmuyor') :-symptom(hidrolik_az, 'Fren hidroliği az mı?');
    	symptom(asinmis_balata, 'Balata aşınmış mı?').

% Teşhis

% Kullanıcıdan Cevaplar Alınır
symptom(_Hata_Kodu, Hata) :- %Hata_Kodu kullanılmayacağı için başına _ eklendi.
    format('~w (e/h):', [Hata]),
    read(Cevap),
    Cevap = e.

% Teşhis İşlemi yapılır.
diagnosis :- 
    findall(Ariza, fault(_, Ariza), Tekrarli_Liste), % _ yine "yakit_kacagi" gibi baştaki etiketler yerine kullanılmamak amaçlı eklendi.
    sort(Tekrarli_Liste, Liste), % Arızalar tekrar tekrar listeye yazıldığı için sort ile bu problem ortadan kaldırıldı.
    (   Liste = [] ->  % Liste ile birden fazla hata olasılıkları listeleniyor.
 			format('Başka arıza bulunamadı.~n');
    		format('Olası Arızalar: ~w.~n', [Liste])
    ).