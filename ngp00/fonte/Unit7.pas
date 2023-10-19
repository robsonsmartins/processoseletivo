unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Db, DBTables, Buttons;

type
  TForm7 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    Query1: TQuery;
    DBMemo1: TDBMemo;
    DBImage1: TDBImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit6;

{$R *.DFM}

procedure TForm7.Button2Click(Sender: TObject);
begin
FORM6.SHOW;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
query1.close;
query1.SQL.clear;
query1.SQL.add('insert into ProvaCand (NumQuestP,GabCand) VALUES('+chr(39)+Edit1.Text+chr(39)+','+chr(39)+Edit2.Text+chr(39)+')');
query1.prepare;
Query1.ExecSQL;
Edit1.Text := '';
Edit2.Text := '';

end;

procedure TForm7.SpeedButton2Click(Sender: TObject);
begin
form6.show;
close;
end;

end.
