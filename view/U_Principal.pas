unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, Vcl.Mask,
  Vcl.StdCtrls, Vcl.ExtCtrls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TF_Principal = class(TForm)
    pgPrincipal: TcxPageControl;
    TabLista: TcxTabSheet;
    TabCad: TcxTabSheet;
    edtDescricaoProd: TLabeledEdit;
    edtCodInterno: TLabeledEdit;
    edtNCM: TLabeledEdit;
    edtFornecedor: TLabeledEdit;
    edtPrecoCusto: TMaskEdit;
    edtPrecoVenda: TMaskEdit;
    lblPrecoVenda: TLabel;
    lblPrecoCusto: TLabel;
    panelButton: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnDeletar: TButton;
    dsPrincipal: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1codproduto: TcxGridDBColumn;
    cxGrid1DBTableView1descricao: TcxGridDBColumn;
    cxGrid1DBTableView1fornecedor: TcxGridDBColumn;
    cxGrid1DBTableView1precocusto: TcxGridDBColumn;
    cxGrid1DBTableView1precovenda: TcxGridDBColumn;
    cxGrid1DBTableView1ncm: TcxGridDBColumn;
    cxGrid1DBTableView1datacad: TcxGridDBColumn;
    btnSalvar: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);

  private
    { Private declarations }
  public
    procedure Insert;
    procedure Preencher;
    procedure Delete;

    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

{$R *.dfm}

uses U_DM, U_DMProduto, classProdutoController, classProdutoModel;

procedure TF_Principal.btnNovoClick(Sender: TObject);
begin
  if pgPrincipal.ActivePage = tabLista then
  begin
     pgPrincipal.ActivePage := tabCad;
     btnNovo.Enabled        := False;
     btnSalvar.Enabled      := True;
  end
  else
  begin
     edtCodInterno.Text    := '';
     edtNCM.Text           := '';
     edtDescricaoProd.Text := '';
     edtFornecedor.Text    := '';
     edtPrecoCusto.Text    := '';
     edtPrecoVenda.Text    := '';
     btnNovo.Enabled    := False;
     btnEditar.Enabled  := False;
     btnDeletar.Enabled := False;
     btnSalvar.Enabled  := True;
  end;
end;

procedure TF_Principal.btnSalvarClick(Sender: TObject);
begin
  Insert;
end;

procedure TF_Principal.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  btnNovo.Enabled    := True;
  btnEditar.Enabled  := True;
  btnDeletar.Enabled := True;
  btnSalvar.Enabled  := True;
end;

procedure TF_Principal.Delete;
var
  oProduto : TProduto;
  oProdutoController : TProdutoController;
  Erro : String;
begin
  oProduto := TProduto.Create;
  oProdutoController := TProdutoController.Create;
  try
    with oProduto do
    begin
      //id         := ;
      codproduto := edtCodInterno.Text;
      descricao  := edtDescricaoProd.Text;
      fornecedor := edtNCM.Text;
      precocusto := StrToFloat(edtPrecoCusto.Text);
      precovenda := StrToFloat(edtPrecoVenda.Text);
      ncm        := edtNCM.Text;
      datacad    := Now;
    end;
    if oProdutoController.Insert(oProduto, Erro) = False then
    raise Exception.Create(Erro);
  finally
    FreeAndNil(oProdutoController);
    FreeAndNil(oProduto);
  end;

end;

procedure TF_Principal.FormCreate(Sender: TObject);
begin
  pgPrincipal.ActivePage := tabLista;
  btnNovo.Enabled        := True;
  btnSalvar.Enabled      := False;
  btnEditar.Enabled      := False;
  btnDeletar.Enabled     := False;
  Preencher;
end;

procedure TF_Principal.Insert;
var
  oProduto : TProduto;
  oProdutoController : TProdutoController;
  Erro : String;
begin
  oProduto := TProduto.Create;
  oProdutoController := TProdutoController.Create;
  try
    with oProduto do
    begin
      id         := UDMProduto.GerarId;
      codproduto := edtCodInterno.Text;
      descricao  := edtDescricaoProd.Text;
      fornecedor := edtNCM.Text;
      precocusto := StrToFloat(edtPrecoCusto.Text);
      precovenda := StrToFloat(edtPrecoVenda.Text);
      ncm        := edtNCM.Text;
      datacad    := Now;
    end;
    if oProdutoController.Insert(oProduto, Erro) = False then
    raise Exception.Create(Erro);
  finally
    FreeAndNil(oProdutoController);
    FreeAndNil(oProduto);
  end;

end;

procedure TF_Principal.Preencher;
begin
  UDMProduto.Preencher;
  cxGrid1DBTableView1.Navigator.Visible := True;
end;

end.
