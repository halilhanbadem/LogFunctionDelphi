library LogFunc;

{

 Author: halil han badem }

uses
  System.SysUtils,
  System.Classes,
  Winapi.Windows;
{$R *.res}


Procedure Log(SLog: String);
var
 StringL: TStringList;
 buf: array[0..260] of char;
 Yol: String;
begin
 GetModuleFileName(HInstance, buf, Length(buf));
 Yol := StringReplace(buf, '\LogFunc.dll', Trim(''), [rfReplaceAll, rfIgnoreCase]);

 if FileExists(Yol+'\db.log') then
 begin
   StringL := TStringList.Create;
   StringL.LoadFromFile(Yol+'\db.log');
   StringL.Add('['+DateToStr(Date)+' '+TimeToStr(Time)+']: '+SLog);
   StringL.SaveToFile(Yol+'\db.log');
 end
 else
 begin
   StringL := TStringList.Create;
   StringL.Add('['+DateToStr(Date)+' '+TimeToStr(Time)+']: '+SLog);
   StringL.SaveToFile(Yol+'\db.log');
 end;
end;

 Exports Log;

begin
end.
