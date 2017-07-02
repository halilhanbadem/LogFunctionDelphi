# logfunction

SQL Server için geçerli olan ve bu DLL'yi kullanırken formunuzda herhangi bir connection bağlantısını bulundurmak zorunda değilsiniz. Direkt bileşensiz kullanabilirsiniz.

Birkaç öneri vereyim eğer Access veya başka bir veritabanı için kullanacaksanız UniDac bileşeninin Provider kütüphanesini DLL'ye import etmeli ve connection bileşenini oluşturma kodunun hemen yukarısına yazmanız lazım. 

Devam edeyim şimdi değişkenlerin ne anlama geldiğinden bahsedeyim;

SLog: Log açıklaması
CString: Connection tanımınız.
TAdi: Tablo adınız.

NOT: Tabloda Date ve Comment türünde iki farklı kolon açmalısınız değiştirmek isterseniz fonksiyon üzerinden değiştirebilirsiniz.

Örnek Kullanım:

Log('Deneme Log Kaydı!', 'Provider Name=SQL Server;Data Source=DESKTOP-7U6ETIN;Initial Catalog=hyper_emlak;Port=0;User ID=sa;Password=hyperdbpassword', 'Log');

Gösterimi:

<a href="https://hizliresim.com/5QL9lz"><img src="https://i.hizliresim.com/5QL9lz.png"></a>

İyi çalışmalar :)
