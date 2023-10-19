unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBTables, Buttons;

type
  TForm9 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label5: TLabel;
    DataSource1: TDataSource;
    Query1: TQuery;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.DFM}

procedure TForm9.Button3Click(Sender: TObject);
begin
CLOSE;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
query1.close;
query1.SQL.clear;
query1.SQL.add('insert into Cursos (CodCurso,NomeCurso,PeriodoCurso) VALUES('+chr(39)+Edit1.Text+chr(39)+','+chr(39)+Edit2.Text+chr(39)+','+chr(39)+Edit3.Text+chr(39)+')');
query1.prepare;
Query1.ExecSQL;
Edit1.Text := '';
Edit2.Text := '';
Edit3.Text := '';

end;

procedure TForm9.Button1Click(Sender: TObject);
begin
query1.close;
query1.SQL.clear;
query1.SQL.add('select * from Cursos');
query1.prepare;
Query1.open;
end;

end.
