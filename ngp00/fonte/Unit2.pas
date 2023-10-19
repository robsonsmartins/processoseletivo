unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ano: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Image2: TImage;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit3, Unit4, Unit6, Unit8;

{$R *.DFM}



procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
FORM3.SHOW;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
FORM4.SHOW;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
FORM6.SHOW;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
FORM8.SHOW;
end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
Close;
end;

END.
