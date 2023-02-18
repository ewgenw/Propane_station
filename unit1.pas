unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls, ZConnection, ZDataset, unit2, unit3;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label6: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Timer1: TTimer;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  gustina: integer;{глобальна настройка густини газу}

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
     label58.caption:='00000' ;
     //Бочка №1
     zquery1.Active:=false;
     zquery1.SQL.Clear;
     zquery1.SQL.Add('SELECT product,liters,temperature,created_at FROM level_history WHERE dev_id='+chr(39)+'48054'+chr(39)+' ORDER BY created_at DESC LIMIT 1');
     zquery1.Active:=true;
     zquery1.First;
     label1.caption:=inttostr(zquery1.FieldByName('liters').AsInteger);
     label58.caption:=inttostr(strtoint(label58.caption)+zquery1.FieldByName('liters').AsInteger);
     label2.caption:=inttostr(zquery1.FieldByName('product').AsInteger);
     label3.caption:=floattostr(zquery1.FieldByName('temperature').Asfloat);
     label43.caption:=zquery1.FieldByName('created_at').Asstring;
     zquery1.Active:=false;

     //Бочка №2
     zquery1.Active:=false;
     zquery1.SQL.Clear;
     zquery1.SQL.Add('SELECT product,liters,temperature,created_at FROM level_history WHERE dev_id='+chr(39)+'48052'+chr(39)+' ORDER BY created_at DESC LIMIT 1');
     zquery1.Active:=true;
     zquery1.First;
     label7.caption:=inttostr(zquery1.FieldByName('liters').AsInteger);
     label58.caption:=inttostr(strtoint(label58.caption)+zquery1.FieldByName('liters').AsInteger);
     label8.caption:=inttostr(zquery1.FieldByName('product').AsInteger);
     label9.caption:=floattostr(zquery1.FieldByName('temperature').Asfloat);
     label44.caption:=zquery1.FieldByName('created_at').Asstring;
     zquery1.Active:=false;

     //Бочка №3
     zquery1.Active:=false;
     zquery1.SQL.Clear;
     zquery1.SQL.Add('SELECT product,liters,temperature,created_at FROM level_history WHERE dev_id='+chr(39)+'48049'+chr(39)+' ORDER BY created_at DESC LIMIT 1');
     zquery1.Active:=true;
     zquery1.First;
     label13.caption:=inttostr(zquery1.FieldByName('liters').AsInteger);
     label58.caption:=inttostr(strtoint(label58.caption)+zquery1.FieldByName('liters').AsInteger);
     label14.caption:=inttostr(zquery1.FieldByName('product').AsInteger);
     label15.caption:=floattostr(zquery1.FieldByName('temperature').Asfloat);
     label45.caption:=zquery1.FieldByName('created_at').Asstring;
     zquery1.Active:=false;

     //Бочка №4
     zquery1.Active:=false;
     zquery1.SQL.Clear;
     zquery1.SQL.Add('SELECT product,liters,temperature,created_at FROM level_history WHERE dev_id='+chr(39)+'48050'+chr(39)+' ORDER BY created_at DESC LIMIT 1');
     zquery1.Active:=true;
     zquery1.First;
     label19.caption:=inttostr(zquery1.FieldByName('liters').AsInteger);
     label58.caption:=inttostr(strtoint(label58.caption)+zquery1.FieldByName('liters').AsInteger);
     label20.caption:=inttostr(zquery1.FieldByName('product').AsInteger);
     label21.caption:=floattostr(zquery1.FieldByName('temperature').Asfloat);
     label46.caption:=zquery1.FieldByName('created_at').Asstring;
     zquery1.Active:=false;

     //Бочка №5
     zquery1.Active:=false;
     zquery1.SQL.Clear;
     zquery1.SQL.Add('SELECT product,liters,temperature,created_at FROM level_history WHERE dev_id='+chr(39)+'48053'+chr(39)+' ORDER BY created_at DESC LIMIT 1');
     zquery1.Active:=true;
     zquery1.First;
     label25.caption:=inttostr(zquery1.FieldByName('liters').AsInteger);
     label58.caption:=inttostr(strtoint(label58.caption)+zquery1.FieldByName('liters').AsInteger);
     label26.caption:=inttostr(zquery1.FieldByName('product').AsInteger);
     label27.caption:=floattostr(zquery1.FieldByName('temperature').Asfloat);
     label47.caption:=zquery1.FieldByName('created_at').Asstring;
     zquery1.Active:=false;

     //Бочка №6
     zquery1.Active:=false;
     zquery1.SQL.Clear;
     zquery1.SQL.Add('SELECT product,liters,temperature,created_at FROM level_history WHERE dev_id='+chr(39)+'48051'+chr(39)+' ORDER BY created_at DESC LIMIT 1');
     zquery1.Active:=true;
     zquery1.First;
     label31.caption:=inttostr(zquery1.FieldByName('liters').AsInteger);
     label58.caption:=inttostr(strtoint(label58.caption)+zquery1.FieldByName('liters').AsInteger);
     label32.caption:=inttostr(zquery1.FieldByName('product').AsInteger);
     label33.caption:=floattostr(zquery1.FieldByName('temperature').Asfloat);
     label48.caption:=zquery1.FieldByName('created_at').Asstring;
     zquery1.Active:=false;

     //Бочка №7
     zquery1.Active:=false;
     zquery1.SQL.Clear;
     zquery1.SQL.Add('SELECT product,liters,temperature,created_at FROM level_history WHERE dev_id='+chr(39)+'48055'+chr(39)+' ORDER BY created_at DESC LIMIT 1');
     zquery1.Active:=true;
     zquery1.First;
     label37.caption:=inttostr(zquery1.FieldByName('liters').AsInteger);
     label58.caption:=inttostr(strtoint(label58.caption)+zquery1.FieldByName('liters').AsInteger);
     label38.caption:=inttostr(zquery1.FieldByName('product').AsInteger);
     label39.caption:=floattostr(zquery1.FieldByName('temperature').Asfloat);
     label49.caption:=zquery1.FieldByName('created_at').Asstring;
     zquery1.Active:=false;

     //витратомір
     zquery1.Active:=false;
     zquery1.SQL.Clear;
     zquery1.SQL.Add('SELECT product,product_kg,temperature,created_at,density FROM coriolis_history ORDER BY created_at DESC LIMIT 1');
     zquery1.Active:=true;
     zquery1.First;
     label50.caption:=floattostr(zquery1.FieldByName('product').Asfloat*1000);
     label51.caption:=inttostr(zquery1.FieldByName('product_kg').AsInteger);
     label52.caption:=floattostr(round(zquery1.FieldByName('temperature').Asfloat*100)/100);
     label56.caption:=zquery1.FieldByName('created_at').Asstring;
     label61.Caption:=inttostr(zquery1.FieldByName('density').AsInteger);
     zquery1.Active:=false;




end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     form1.enabled:=false;
     form2.show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
     form1.enabled:=false;
     form3.show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     Button1Click(form1);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

     Button1Click(form1);
end;

end.

