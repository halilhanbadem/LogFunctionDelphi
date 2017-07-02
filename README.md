# logfunction
cengaver
Bunun veritabanı tablosuna yazan bir sürümünü de yaparsanız daha faydalı olabilir, bu haliyle de en azından bir text dosya ile kullanılabilir,


Tekrar merhabalar, bir konu açmak yerine burdan paylaşmak istedim. Geliştirmek için öneri veren @cengaver hoca'ya öncellikle teşekkürlerimi iletiyorum. SQL Server için geçerli olan ve bu DLL'yi kullanırken formunuzda herhangi bir connection bağlantısını bulundurmak zorunda değilsiniz. Direkt bileşensiz kullanabilirsiniz.


[ars=delphi]library FuncLog;

{
Company: HyperSoftware
Author: Halil Han Badem }

uses
 System.SysUtils,
 System.Classes,
 Winapi.Windows,
 Uni, SQLServerUniProvider;
{$R *.res}


Procedure Log(SLog, CString, TAdi: String);
var
Baglanti: TUniConnection;
Query: TUniQuery;
Provider: TSQLServerUniProvider;
begin
Provider := TSQLServerUniProvider.Create(nil);

Baglanti := TUniConnection.Create(nil);
Baglanti.ConnectString := CString;
Baglanti.Connected := True;


Query := TUniQuery.Create(nil);

Query.Connection := Baglanti;
Query.SQL.Text := 'select * from '+TAdi;
Query.Active := True;

Query.SQL.Text := 'insert into '+TAdi+' (Date, Comment) VALUES(:Date, :Comment)';
Query.ParamByName('Date').AsDateTime := Now;
Query.ParamByName('Comment').AsString := SLog;
Query.ExecSQL;
end;

Exports Log;

begin
end.[/ars]


Birkaç öneri vereyim eğer Access veya başka bir veritabanı için kullanacaksanız UniDac bileşeninin Provider kütüphanesini DLL'ye import etmeli ve connection bileşenini oluşturma kodunun hemen yukarısına yazmanız lazım. 

Bkz.

[ars=delphi]var
Provider: TSQLServerUniProvider;
begin
Provider := TSQLServerUniProvider.Create(nil);[/ars]

Devam edeyim şimdi değişkenlerin ne anlama geldiğinden bahsedeyim;

SLog: Log açıklaması
CString: Connection tanımınız.
TAdi: Tablo adınız.

NOT: Tabloda Date ve Comment türünde iki farklı kolon açmalısınız değiştirmek isterseniz fonksiyon üzerinden değiştirebilirsiniz.

Örnek Kullanım:

[ars=delphi]Log('Deneme Log Kaydı!', 'Provider Name=SQL Server;Data Source=DESKTOP-7U6ETIN;Initial Catalog=hyper_emlak;Port=0;User ID=sa;Password=hyperdbpassword', 'Log');

[/ars]

Gösterimi:

<a href="https://hizliresim.com/5QL9lz"><img src="https://i.hizliresim.com/5QL9lz.png"></a>

Eski GitHub linkinden ulaşabilirsiniz.

Klasör adı: LogFuncModule(Database)


İyi çalışmalar :)

