unit classProdutoController;

interface

uses classProdutoModel,U_DMProduto, System.SysUtils;

type
  TProdutoController = class
  private

  public
    constructor Create;
    destructor Destroy; override;
    function Insert(oProduto : TProduto; var Erro : String) : Boolean;
    function Update(oProduto : TProduto; var Erro : String) : Boolean;
    function Delete(oProduto : TProduto; var Erro : String) : Boolean;
  end;

implementation

{ TProdutoController }

constructor TProdutoController.Create;
begin
  UDMProduto := TUDMProduto.Create(nil);
end;

function TProdutoController.Delete(oProduto: TProduto;
  var Erro: String): Boolean;
begin
  Result := UDMProduto.Delete(oProduto, Erro);
end;

destructor TProdutoController.Destroy;
begin
  FreeAndNil(UDMProduto);
  inherited;
end;

function TProdutoController.Insert(oProduto: TProduto;
  var Erro: String): Boolean;
begin
  Result := UDMProduto.Insert(oProduto, Erro);
end;

function TProdutoController.Update(oProduto: TProduto;
  var Erro: String): Boolean;
begin
  Result := UDMProduto.Update(oProduto, Erro);
end;

end.
