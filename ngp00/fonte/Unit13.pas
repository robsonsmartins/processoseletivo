unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBTables, Grids, DBGrids;

type
  TForm13 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Button4: TButton;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    DataSource1: TDataSource;
    Query1: TQuery;
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.DFM}

procedure TForm13.Button4Click(Sender: TObject);
begin
close;
end;

end.
