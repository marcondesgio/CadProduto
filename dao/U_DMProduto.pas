unit U_DMProduto;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider, Data.DB,
  Data.SqlExpr, Datasnap.DBClient,U_DM, classProdutoModel;

type
  TUDMProduto = class(TDataModule)
    qryPrincipal: TSQLQuery;
    dspPrincipal: TDataSetProvider;
    qryPrincipalid: TIntegerField;
    qryPrincipalcodproduto: TStringField;
    qryPrincipaldescricao: TStringField;
    qryPrincipalfornecedor: TStringField;
    qryPrincipalprecocusto: TSingleField;
    qryPrincipalprecovenda: TSingleField;
    qryPrincipalncm: TStringField;
    qryPrincipaldatacad: TDateField;
    qryAux: TSQLQuery;
    cdsPrincipal: TClientDataSet;
    cdsPrincipalid: TIntegerField;
    cdsPrincipalcodproduto: TStringField;
    cdsPrincipaldescricao: TStringField;
    cdsPrincipalfornecedor: TStringField;
    cdsPrincipalprecocusto: TSingleField;
    cdsPrincipalprecovenda: TSingleField;
    cdsPrincipalncm: TStringField;
    cdsPrincipaldatacad: TDateField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function GerarId : Integer;
    function Insert(oProduto : TProduto; var Erro : String) : Boolean;
    function Update(oProduto : TProduto; var Erro : String) : Boolean;
    function Delete(oProduto : TProduto; var Erro : String) : Boolean;
    procedure Preencher;
    { Public declarations }
  end;

var
  UDMProduto: TUDMProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TUDMProduto }

procedure TUDMProduto.DataModuleCreate(Sender: TObject);
begin
  qryPrincipal.Open;
end;

function TUDMProduto.Delete(oProduto: TProduto; var Erro: String): Boolean;
begin
  with UDMProduto.cdsPrincipal, oProduto do
  begin
    cdsPrincipal.Close;
    cdsPrincipal.Open;
    cdsPrincipal.Insert;

    cdsPrincipalid.asInteger        := id;
    cdsPrincipalcodproduto.asString := codproduto;
    cdsPrincipaldescricao.asString  := descricao;
    cdsPrincipalfornecedor.AsString := fornecedor;
    cdsPrincipalprecocusto.asFloat  := precocusto;
    cdsPrincipalprecovenda.asFloat  := precovenda;
    cdsPrincipalncm.asstring        := ncm;
    cdsPrincipaldatacad.AsDateTime  := datacad;
    try
      UDMProduto.cdsPrincipal.Post;
      UDMProduto.cdsPrincipal.ApplyUpdates(-1);
      Result := True;
    except on E: Exception do
    begin
      Erro := 'Erro na inserção de produto: ' + sLineBreak + E.Message;
      Result := False;
    end;
    end;
  end;
end;

function TUDMProduto.GerarId: Integer;
Var
   sSql : String;
begin
   sSql := '';
   sSql := 'select gen_id("GEN_tblcadastro_ID",1) from rdb$database';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSql);
   qryAux.Open;
   Result := qryAux.Fields[0].AsInteger;
   qryAux.Close;
end;

function TUDMProduto.Insert(oProduto: TProduto; var Erro: String): Boolean;
begin
  with UDMProduto.cdsPrincipal, oProduto do
  begin
    UDMProduto.cdsPrincipal.Close;
    UDMProduto.cdsPrincipal.Open;
    UDMProduto.cdsPrincipal.Insert;

    UDMProduto.cdsPrincipalid.AsInteger        := id;
    UDMProduto.cdsPrincipalcodproduto.asString := codproduto;
    UDMProduto.cdsPrincipaldescricao.asString  := descricao;
    UDMProduto.cdsPrincipalfornecedor.AsString := fornecedor;
    UDMProduto.cdsPrincipalprecocusto.asFloat  := precocusto;
    UDMProduto.cdsPrincipalprecovenda.asFloat  := precovenda;
    UDMProduto.cdsPrincipalncm.asstring        := ncm;
    UDMProduto.cdsPrincipaldatacad.AsDateTime  := datacad;
    try
      UDMProduto.cdsPrincipal.Post;
      UDMProduto.cdsPrincipal.ApplyUpdates(-1);
      Result := True;
    except on E: Exception do
    begin
      Erro := 'Erro na edição do produto: ' + sLineBreak + E.Message;
      Result := False;
    end;
    end;
  end;
end;

procedure TUDMProduto.Preencher;
begin
  cdsPrincipal.Close;
  cdsPrincipal.Open;
end;

function TUDMProduto.Update(oProduto: TProduto; var Erro: String): Boolean;
begin
  with cdsPrincipal, oProduto do
  begin
    cdsPrincipal.Close;
    UDMProduto.cdsPrincipal.Open;
    UDMProduto.cdsPrincipal.Locate('id',UDMProduto.cdsPrincipalid.AsInteger,[]);
    UDMProduto.cdsPrincipal.Edit;

    UDMProduto.cdsPrincipalid.asInteger        := id;
    UDMProduto.cdsPrincipalcodproduto.asString := codproduto;
    UDMProduto.cdsPrincipaldescricao.asString  := descricao;
    UDMProduto.cdsPrincipalfornecedor.AsString := fornecedor;
    UDMProduto.cdsPrincipalprecocusto.asFloat  := precocusto;
    UDMProduto.cdsPrincipalprecovenda.asFloat  := precovenda;
    UDMProduto.cdsPrincipalncm.asstring        := ncm;
    UDMProduto.cdsPrincipaldatacad.AsDateTime  := datacad;
    try
      UDMProduto.cdsPrincipal.Post;
      UDMProduto.cdsPrincipal.ApplyUpdates(-1);
      Result := True;
    except on E: Exception do
    begin
      Erro := 'Erro na edição do produto: ' + sLineBreak + E.Message;
      Result := False;
    end;
    end;
  end;
end;

end.
