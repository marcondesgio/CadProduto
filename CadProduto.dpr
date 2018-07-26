program CadProduto;

uses
  Vcl.Forms,
  U_Principal in 'view\U_Principal.pas' {F_Principal},
  classProdutoModel in 'modal\classProdutoModel.pas',
  classProdutoController in 'controller\classProdutoController.pas',
  U_DM in 'dao\U_DM.pas' {UDM: TDataModule},
  U_DMProduto in 'dao\U_DMProduto.pas' {UDMProduto: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TUDM, UDM);
  Application.CreateForm(TUDMProduto, UDMProduto);
  Application.CreateForm(TF_Principal, F_Principal);
  Application.Run;
end.
