unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TForm8 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit9, Unit10, Unit11, Unit12, Unit13, Unit14;

{$R *.DFM}

procedure TForm8.Button1Click(Sender: TObject);
begin
FORM9.SHOW;
end;

procedure TForm8.Button6Click(Sender: TObject);
begin
FORM10.SHOW;
end;

procedure TForm8.Button4Click(Sender: TObject);
begin
FORM11.SHOW;
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
FORM12.SHOW;
end;

procedure TForm8.Button5Click(Sender: TObject);
begin
FORM13.SHOW;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
FORM14.SHOW;
end;

procedure TForm8.SpeedButton1Click(Sender: TObject);
begin
Close;
end;

end.
