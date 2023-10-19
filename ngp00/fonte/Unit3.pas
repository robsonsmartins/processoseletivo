unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, DBCtrls, StdCtrls, Mask, ExtCtrls, Db, DBTables, Grids, DBGrids;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    DataSource1: TDataSource;
    Query1: TQuery;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
//  cWhere: String;

implementation

uses Unit2;


{$R *.DFM}



procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
FORM2.SHOW;
close;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
if (edit2.text='') or (edit5.text='') or (edit3.text='') or (edit4.text='')
then ShowMessage('Os campos não podem ser nulos')
else begin

query1.close;
query1.SQL.clear;
query1.SQL.add('insert into Senhas (Nome,CodGrupo,Login,Senha) VALUES('+chr(39)+Edit2.Text+chr(39)+','+chr(39)+Edit5.Text+chr(39)+','+chr(39)+Edit3.Text+chr(39)+','+chr(39)+Edit4.Text+chr(39)+')');
query1.prepare;
Query1.ExecSQL;


Edit2.Text := '';
Edit5.Text := '';
Edit3.Text := '';
Edit4.Text := '';
end;

//Query1.SQL.Add('insert into nomes (Cli_Nome,Cli_Idade,Cli_Sexo) values ('+chr(39)+Edit1.Text+chr(39)+','+chr(39)+Edit2.Text+chr(39)+','+chr(39)+Edit3.Text+chr(39)+')');



end;

procedure TForm3.SpeedButton3Click(Sender: TObject);
begin
query1.close;
query1.SQL.clear;
query1.SQL.add('select * from Senhas');
query1.prepare;
Query1.open;
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
edit2.text :=dbgrid1.Fields[1].AsString ;
edit5.text :=dbgrid1.Fields[4].AsString ;
edit3.text :=dbgrid1.Fields[2].AsString ;
edit4.text :=dbgrid1.Fields[3].AsString ;
end;

procedure TForm3.SpeedButton5Click(Sender: TObject);
begin
query1.close;
query1.SQL.clear;
query1.SQL.add('delete from Senhas where login ='+chr(39)+edit3.text+chr(39)+'');
query1.prepare;
Query1.ExecSQL;
Edit2.Text := '';
Edit5.Text := '';
Edit3.Text := '';
Edit4.Text := '';
query1.close;
query1.SQL.clear;
query1.SQL.add('select * from Senhas');
query1.prepare;
Query1.open;

end;

procedure TForm3.SpeedButton6Click(Sender: TObject);
begin
query1.close;
query1.SQL.clear;
Query1.SQL.Add('UPDATE senhas set Nome = '+#39+Edit2.Text+#39+ ', login = '+#39+Edit5.Text+#39+ ', CodGrupo = '#39+Edit3.Text+#39+ ', Senha = '+#39+Edit4.Text+#39+ ' where login = ' +#39+edit3.text+#39);
//Query1.SQL.Add('UPDATE convenios set Codconv = '+#39+Edit1.Text+#39+ ',Cidconv = '+#39+Edit3.Text+#39+ ' WHERE Nomeconv = ' +#39+Edit2.Text+#39);

//query1.SQL.add;
query1.prepare;
Query1.ExecSQL;
//Edit2.Text := '';
//Edit5.Text := '';
//Edit3.Text := '';
//Edit4.Text := '';
///Query1.close;
//query1.SQL.clear;
//query1.SQL.add('select * from Senhas');
//query1.prepare;
//Query1.open;

end;

end.

//     procedure TForm1.BitBtn3Click(Sender: TObject);
//begin
//Query1.Close;
//Query1.SQL.Clear;
//Query1.SQL.Add('UPDATE convenios SET Codconv = '+#39+Edit1.Text+#39+ ',Cidconv = '+#39+Edit3.Text+#39+ ' WHERE Nomeconv = ' +#39+Edit2.Text+#39);
//Query1.Prepare;
//Query1.ExecSQL;
//end;

//end.

