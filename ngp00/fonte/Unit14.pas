unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TForm14 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

uses Unit15, Unit16, Unit17, Unit18, Unit19, Unit20;

{$R *.DFM}

procedure TForm14.Button1Click(Sender: TObject);
begin
FORM15.SHOW;
end;

procedure TForm14.Button3Click(Sender: TObject);
begin
FORM16.SHOW;
end;

procedure TForm14.Button5Click(Sender: TObject);
begin
FORM17.SHOW;
end;

procedure TForm14.Button6Click(Sender: TObject);
begin
FORM18.SHOW;
end;

procedure TForm14.Button4Click(Sender: TObject);
begin
FORM19.SHOW;
end;

procedure TForm14.Button2Click(Sender: TObject);
begin
form20.show;
end;

procedure TForm14.SpeedButton1Click(Sender: TObject);
begin
Close;
end;

end.
