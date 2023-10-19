unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, Db, DBTables;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    Query1: TQuery;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.DFM}

procedure TForm5.Button2Click(Sender: TObject);
begin
CLOSE;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
query1.close;
query1.SQL.clear;
query1.SQL.add('select * from CadQuestoes');
query1.prepare;
Query1.open;
end;

end.
