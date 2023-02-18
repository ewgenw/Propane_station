unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  EditBtn,Unit4,dateutils,printers, RichView, PtblRV, SynEdit;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    RadioButton1: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioGroup1: TRadioGroup;
    TimeEdit1: TTimeEdit;
    TimeEdit2: TTimeEdit;
    TimeEdit3: TTimeEdit;
    TimeEdit4: TTimeEdit;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RichView1Click(Sender: TObject);
  private

  public
  var


  end;

var
  Form2: TForm2;
  hourly:boolean;

implementation

uses unit1;
{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin
  dateedit1.Date:=now;
  dateedit2.Date:=now;
  dateedit3.Date:=now;
  dateedit4.Date:=now;
  timeedit3.Enabled:=true;
  timeedit4.Enabled:=true;
  hourly:=true;
  timeedit1.Time:=strtodatetime('00:00:00');
  timeedit2.Time:=strtodatetime('23:59:59');
  timeedit3.Time:=strtodatetime('00:00:00');
  timeedit4.Time:=strtodatetime('23:59:59');
end;

procedure TForm2.RichView1Click(Sender: TObject);
begin

end;

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     form1.enabled:=true;
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
     hourly:=true;
     timeedit3.Enabled:=true;
     timeedit4.Enabled:=true;
     dateedit4.Date:=dateedit3.Date+1;
     timeedit3.Time:=strtodatetime('08:00:00');
     timeedit4.Time:=strtodatetime('07:59:59');
end;

procedure TForm2.Button10Click(Sender: TObject);
var dd,mm,yy:word;
begin
     hourly:=true;
     timeedit3.Enabled:=true;
     timeedit4.Enabled:=true;
     DecodeDate(Dateedit3.Date,yy,mm,dd);
     Dateedit3.Date:=encodedate(yy,mm,01);
     if mm<12 then
        Dateedit4.Date:=encodedate(yy,mm+1,01)-1;
     if mm=12 then Dateedit4.Date:=encodedate(yy+1,01,01)-1;
end;

procedure TForm2.Button11Click(Sender: TObject);
var yy,mm,dd,hh,mn,ss,ms:word;
    currdt,enddt,nextdt:tdatetime;
    begindt,stopdt,currb,currs,blia:string;
    temp3,temp4:integer;
    l_za_period,kg_za_period,ft1,ft2:real;
begin
      kg_za_period:=0;
      l_za_period:=0;
      memo1.Lines.Clear;
      memo1.Lines.add('                  ЗВІТ ПРО ГАЗОСПОЖИВАННЯ');


  {погодинно}
if hourly then begin
     memo1.Lines.add('погодинно з '+datetostr(form2.dateedit3.Date)+' '+timetostr(form2.TimeEdit3.time)+' по '+datetostr(form2.dateedit4.Date)+' '+timetostr(form2.TimeEdit4.time));
     memo1.Lines.add('Зформовано '+datetimetostr(now));
     currdt:=strtodatetime(datetostr(dateedit3.Date)+' '+timetostr(timeedit3.time));
     enddt:=strtodatetime(datetostr(dateedit4.Date)+' '+timetostr(timeedit4.time));
     //шапка
     memo1.lines.add('-----Час-----+--Літрів--+-Кілограм--+-Сер.t-+Сер.густ!');

     //пробігаємо циклом погодинно
     while not(currdt>enddt) do begin
          //наступна година
          nextdt:=inchour(currdt,1);

          //дату й час переводим в формат зрозумілий постгресу
          decodedate(currdt,yy,mm,dd);
          decodetime(currdt,hh,mn,ss,ms);
          begindt:=inttostr(yy)+'-'+inttostr(mm)+'-'+inttostr(dd)+' '+inttostr(hh)+':'+inttostr(mn)+':'+inttostr(ss)+'.0';
          decodedate(nextdt,yy,mm,dd);
          decodetime(nextdt,hh,mn,ss,ms);
          stopdt:=inttostr(yy)+'-'+inttostr(mm)+'-'+inttostr(dd)+' '+inttostr(hh)+':'+inttostr(mn)+':'+inttostr(ss)+'.0';
          //HH:MM для виводу в табличку
		  blia:=inttostr(hh)+':'+inttostr(mn);
          //сума для середньої т та густ.
          form1.ZQuery1.SQL.Clear;
          form1.ZQuery1.sql.Add('SELECT sum(temperature) as tmp3,sum(density) AS tmp4 FROM coriolis_history WHERE ((created_at>='+chr(39)+begindt+chr(39)+')AND (created_at<='+chr(39)+stopdt+chr(39)+'))');
          form1.ZQuery1.active:=true;
          temp3:=form1.ZQuery1.FieldByName('tmp3').asinteger;
          temp4:=form1.ZQuery1.FieldByName('tmp4').asinteger;
          form1.ZQuery1.active:=false;
          //к-ть просумованого
          form1.ZQuery1.SQL.Clear;
          form1.ZQuery1.SQL.add('SELECT count(temperature) as tmp3,count(density) AS tmp4 FROM coriolis_history WHERE ((created_at>='+chr(39)+begindt+chr(39)+')AND (created_at<='+chr(39)+stopdt+chr(39)+'))');
          form1.ZQuery1.active:=true;
          if temp3<>0 then temp3:=round(temp3/form1.ZQuery1.FieldByName('tmp3').asinteger);
          if temp4<>0 then temp4:=round(temp4/form1.ZQuery1.FieldByName('tmp4').asinteger);
          form1.ZQuery1.active:=false;
          //шукаємо останній запис за годину з тонажом та обємом
          form1.ZQuery1.SQL.Clear;
          form1.ZQuery1.sql.Add('SELECT product,product_kg FROM coriolis_history WHERE ((created_at>='+chr(39)+begindt+chr(39)+')AND (created_at<='+chr(39)+stopdt+chr(39)+'))  ORDER BY created_at DESC LIMIT 1');
          form1.ZQuery1.active:=true;
          ft1:=form1.ZQuery1.FieldByName('product').asfloat;
          ft2:=form1.ZQuery1.FieldByName('product_kg').asfloat;
          form1.ZQuery1.active:=false;
          //шукаємо останній запис за минулу годину

          //дату й час переводим в формат зрозумілий постгресу
          decodedate(inchour(currdt,-1),yy,mm,dd);
          decodetime(inchour(currdt,-1),hh,mn,ss,ms);
          begindt:=inttostr(yy)+'-'+inttostr(mm)+'-'+inttostr(dd)+' '+inttostr(hh)+':'+inttostr(mn)+':'+inttostr(ss)+'.0';
          decodedate(inchour(nextdt,-1),yy,mm,dd);
          decodetime(inchour(nextdt,-1),hh,mn,ss,ms);
          stopdt:=inttostr(yy)+'-'+inttostr(mm)+'-'+inttostr(dd)+' '+inttostr(hh)+':'+inttostr(mn)+':'+inttostr(ss)+'.0';

           form1.ZQuery1.SQL.Clear;
           form1.ZQuery1.sql.Add('SELECT product,product_kg FROM coriolis_history WHERE ((created_at>='+chr(39)+begindt+chr(39)+')AND (created_at<='+chr(39)+stopdt+chr(39)+'))  ORDER BY created_at DESC LIMIT 1');
           form1.ZQuery1.active:=true;
           //віднімаєм і округляєм до 3 знаків після коми
           ft1:=(round((ft1-form1.ZQuery1.FieldByName('product').asfloat)*100000))/100;//тут кубометри вереводим в літри
           ft2:=(round((ft2-form1.ZQuery1.FieldByName('product_kg').asfloat)*100))/100;
           form1.ZQuery1.active:=false;
           if ft1<0 then ft1:=0;
           if ft2<0 then ft2:=0;
           kg_za_period:=kg_za_period+ft2;
           l_za_period:=l_za_period+ft1;
            //вивід в друковану форму
           blia:=inttostr(hh)+':'+inttostr(mn)+' - '+blia;
           memo1.lines.add(format('%12s',[blia])+' |'+format('%9s',[floattostr(ft1)])+' | '+format('%9s',[floattostr(ft2)])+' | '+format('%5s',[inttostr(temp3)])+' | '+format('%7s',[inttostr(temp4)])+'!');
           memo1.lines.add('-------------+----------+-----------+-------+--------!');

          //+1 hour
          currdt:=inchour(currdt,1);
     end;
        //вивод суми
        memo1.Lines.Add('----ВСЬОГО--'+' |'+format('%9s',[floattostr(l_za_period)])+' | '+format('%9s',[floattostr(kg_za_period)])+' | ');

  end;

  {подобово}
  if not(hourly)then begin
     memo1.Lines.add('подобово з '+datetostr(form2.dateedit3.Date)+' '+timetostr(form2.TimeEdit3.time)+' по '+datetostr(form2.dateedit4.Date)+' '+timetostr(form2.TimeEdit4.time));
     memo1.Lines.add('Зформовано '+datetimetostr(now));


     //шапка

     memo1.lines.add('----Дата----+--Літрів--+-Кілограм--+-Сер.t-+Сер.густ!');

     //курсор
     currdt:=dateedit3.Date;
     //пробігаємо всі дати по черзі
     while not(currdt>dateedit4.Date) do begin
          //дата курсора
           decodedate(currdt,yy,mm,dd);

           currb:=inttostr(yy)+'-'+inttostr(mm)+'-'+inttostr(dd)+' 00:00:00.0';
           currs:=inttostr(yy)+'-'+inttostr(mm)+'-'+inttostr(dd)+' 23:59:59.9';
          //сума для середньої темп та густини
           form1.ZQuery1.SQL.Clear;
           form1.ZQuery1.sql.Add('SELECT sum(temperature) as tmp3,sum(density) AS tmp4 FROM coriolis_history WHERE ((created_at>='+chr(39)+currb+chr(39)+')AND (created_at<='+chr(39)+currs+chr(39)+'))');
           form1.ZQuery1.active:=true;
           temp3:=form1.ZQuery1.FieldByName('tmp3').asinteger;
           temp4:=form1.ZQuery1.FieldByName('tmp4').asinteger;
           form1.ZQuery1.active:=false;
           //к-ть просумованого
           form1.ZQuery1.SQL.Clear;
           form1.ZQuery1.SQL.add('SELECT count(temperature) as tmp3,count(density) AS tmp4 FROM coriolis_history WHERE ((created_at>='+chr(39)+currb+chr(39)+')AND (created_at<='+chr(39)+currs+chr(39)+'))');
           form1.ZQuery1.active:=true;
           if temp3<>0 then temp3:=round(temp3/form1.ZQuery1.FieldByName('tmp3').asinteger);
           if temp4<>0 then temp4:=round(temp4/form1.ZQuery1.FieldByName('tmp4').asinteger);
           form1.ZQuery1.active:=false;

           //шукаємо останній запис за день з тонажом та обємом
           form1.ZQuery1.SQL.Clear;
           form1.ZQuery1.sql.Add('SELECT product,product_kg FROM coriolis_history WHERE ((created_at>='+chr(39)+currb+chr(39)+')AND (created_at<='+chr(39)+currs+chr(39)+'))  ORDER BY created_at DESC LIMIT 1');
           form1.ZQuery1.active:=true;
           ft1:=form1.ZQuery1.FieldByName('product').asfloat;
           ft2:=form1.ZQuery1.FieldByName('product_kg').asfloat;
           form1.ZQuery1.active:=false;
           //шукаємо останній запис за минулий день з тонажом та обємом
             //минулий день
           decodedate(currdt-1,yy,mm,dd);
           currb:=inttostr(yy)+'-'+inttostr(mm)+'-'+inttostr(dd)+' 00:00:00.0';
           currs:=inttostr(yy)+'-'+inttostr(mm)+'-'+inttostr(dd)+' 23:59:59.9';

           form1.ZQuery1.SQL.Clear;
           form1.ZQuery1.sql.Add('SELECT product,product_kg FROM coriolis_history WHERE ((created_at>='+chr(39)+currb+chr(39)+')AND (created_at<='+chr(39)+currs+chr(39)+'))  ORDER BY created_at DESC LIMIT 1');
           form1.ZQuery1.active:=true;
           //віднімаєм і округляєм до 3 знаків після коми
           ft1:=(round((ft1-form1.ZQuery1.FieldByName('product').asfloat)*100000))/100;//тут кубометри вереводим в літри
           ft2:=(round((ft2-form1.ZQuery1.FieldByName('product_kg').asfloat)*100))/100;
           form1.ZQuery1.active:=false;
           if ft1<0 then ft1:=0;
           if ft2<0 then ft2:=0;
           kg_za_period:=kg_za_period+ft2;
           l_za_period:=l_za_period+ft1;

           //вивід в друковану форму
           memo1.lines.add(datetostr(currdt)+'  |'+format('%9s',[floattostr(ft1)])+' | '+format('%9s',[floattostr(ft2)])+' | '+format('%5s',[inttostr(temp3)])+' | '+format('%7s',[inttostr(temp4)])+'!');
           memo1.lines.add('------------+----------+-----------+-------+--------!');
           //плюс день до дати
           currdt:=currdt+1;

     end;
        //вивод суми
        memo1.Lines.Add('----ВСЬОГО--'+' |'+format('%9s',[floattostr(l_za_period)])+' | '+format('%9s',[floattostr(kg_za_period)])+' | ');

  end;
end;

procedure TForm2.Button12Click(Sender: TObject);
  var

  i,ln: word;
begin
   i:=0;
   ln:=0;
   with Printer do
   try
     BeginDoc;
     printer.Canvas.Font:=memo1.Font;
     Printer.Canvas.TextOut(80, Ln, '');
     ln:=ln+Abs(Printer.Canvas.Font.Height);
// create data to print
   for i:=0 to memo1.Lines.Count do begin
           Printer.Canvas.TextOut(80, Ln, memo1.Lines[i]);
           ln:=ln+Abs(Printer.Canvas.Font.Height);
           if (ln>= printer.PageHeight) then
              Printer.NewPage;
      end;

   finally
     EndDoc;
   end;



end;

procedure TForm2.Button8Click(Sender: TObject);
begin
     hourly:=true;
     timeedit3.Enabled:=true;
     timeedit4.Enabled:=true;
     if radiobutton9.Checked then begin
        dateedit4.Date:=dateedit3.Date;
        timeedit3.Time:=strtodatetime('08:00:00');
        timeedit4.Time:=strtodatetime('19:59:59');
     end
     else begin
     if radiobutton10.Checked then begin
        dateedit4.Date:=dateedit3.Date+1;
        timeedit3.Time:=strtodatetime('20:00:00');
        timeedit4.Time:=strtodatetime('07:59:59');

     end;

     end;
end;

procedure TForm2.Button9Click(Sender: TObject);
var dd,mm,yy:word;
begin
     timeedit3.Enabled:=false;
     timeedit4.Enabled:=false;
     hourly:=false;
     DecodeDate(Dateedit3.Date,yy,mm,dd);
     Dateedit3.Date:=encodedate(yy,mm,01);
     if mm<12 then
        Dateedit4.Date:=encodedate(yy,mm+1,01)-1;
     if mm=12 then Dateedit4.Date:=encodedate(yy+1,01,01)-1;
end;

end.

