unit classProdutoModel;

interface

type
  TProduto = class
  private
    Fprecocusto: Double;
    Fdescricao: String;
    Fprecovenda: Double;
    Fid: Integer;
    Fncm: String;
    Ffornecedor: String;
    Fcodproduto: String;
    Fdatacad: TDate;
  public
    property id : Integer read Fid write Fid;
    property codproduto : String read Fcodproduto write Fcodproduto;
    property descricao : String read Fdescricao write Fdescricao;
    property fornecedor : String read Ffornecedor write Ffornecedor;
    property precocusto : Double read Fprecocusto write Fprecocusto;
    property precovenda : Double read Fprecovenda write Fprecovenda;
    property ncm : String read Fncm write Fncm;
    property datacad : TDate read Fdatacad write Fdatacad;
  end;

implementation

end.
