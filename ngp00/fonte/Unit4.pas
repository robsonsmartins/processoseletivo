unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, StdCtrls, ExtCtrls, Db, DBTables, Buttons;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Button1: TButton;
    Label14: TLabel;
    Label15: TLabel;
    Edit1: TEdit;
    Label16: TLabel;
    Button2: TButton;
    Button3: TButton;
    Edit3: TEdit;
    Button4: TButton;
    DataSource1: TDataSource;
    Query1: TQuery;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBComboBox2: TDBComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBMemo1: TDBMemo;
    DBImage1: TDBImage;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit5;

{$R *.DFM}

procedure TForm4.Button2Click(Sender: TObject);
begin
form5.show;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
close;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
//query1.close;
//query1.SQL.clear;
//query1.SQL.add('insert into CadQuestoes (CodDiscip,Divisao,Topico,GrauDific) VALUES('+chr(39)+DBComboBox1.Text+chr(39)+','+chr(39)+DBEdit1.Text+chr(39)+','+chr(39)+DBEdit2.Text+chr(39)+','+chr(39)+DBEdit3.Text+chr(39)+')');
//query1.prepare;
//Query1.ExecSQL;

end;

end.
 