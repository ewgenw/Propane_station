unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

uses unit1;
{$R *.lfm}

{ TForm3 }

procedure TForm3.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     form1.enabled:=true;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
     edit9.Text:=inttostr(round(form1.Timer1.Interval/1000));
end;

procedure TForm3.Button1Click(Sender: TObject);
begin

     form3.Close;


end;

procedure TForm3.Button2Click(Sender: TObject);
begin
     form1.timer1.interval:=strtoint(edit9.Text)*1000;
     form1.Timer1.Enabled:=true;
     unit1.gustina:=strtoint(edit8.Text);
     form3.Close;
end;

procedure TForm3.Edit8Change(Sender: TObject);
begin

end;

end.

