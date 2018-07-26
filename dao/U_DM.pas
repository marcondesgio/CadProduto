unit U_DM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXDataSnap,
  Data.DBXCommon, IPPeerClient, Data.DBXFirebird;

type
  TUDM = class(TDataModule)
    sqlCnn: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UDM: TUDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TUDM.DataModuleCreate(Sender: TObject);
begin
  sqlCnn.Connected := True;
end;

end.
