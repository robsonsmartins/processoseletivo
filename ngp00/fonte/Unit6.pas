unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button7: TButton;
    Button8: TButton;
    Button6: TButton;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit7;

{$R *.DFM}



procedure TForm6.Button1Click(Sender: TObject);
begin
FORM7.SHOW;
end;

procedure TForm6.Button5Click(Sender: TObject);
begin
FORM7.SHOW;
end;

procedure TForm6.Button7Click(Sender: TObject);
begin
FORM7.SHOW;
end;

procedure TForm6.Button6Click(Sender: TObject);
begin
FORM7.SHOW;
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
FORM7.SHOW;
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
FORM7.SHOW;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
FORM7.SHOW;
end;

procedure TForm6.Button8Click(Sender: TObject);
begin
FORM7.SHOW;
end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
begin
Close;
end;

end.
