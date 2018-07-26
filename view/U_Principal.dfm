object F_Principal: TF_Principal
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 381
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgPrincipal: TcxPageControl
    Left = 0
    Top = 0
    Width = 700
    Height = 330
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = TabLista
    Properties.CustomButtons.Buttons = <>
    ExplicitWidth = 580
    ClientRectBottom = 326
    ClientRectLeft = 4
    ClientRectRight = 696
    ClientRectTop = 24
    object TabLista: TcxTabSheet
      Caption = 'Listagem'
      ImageIndex = 0
      ExplicitWidth = 572
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 692
        Height = 302
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 572
        object cxGrid1DBTableView1: TcxGridDBTableView
          OnDblClick = cxGrid1DBTableView1DblClick
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsPrincipal
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxGrid1DBTableView1codproduto: TcxGridDBColumn
            Caption = 'C'#243'd. Interno '
            DataBinding.FieldName = 'codproduto'
            Width = 68
          end
          object cxGrid1DBTableView1descricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'descricao'
            Width = 173
          end
          object cxGrid1DBTableView1datacad: TcxGridDBColumn
            Caption = 'Data'
            DataBinding.FieldName = 'datacad'
          end
          object cxGrid1DBTableView1fornecedor: TcxGridDBColumn
            Caption = 'Fornecedor'
            DataBinding.FieldName = 'fornecedor'
            Width = 155
          end
          object cxGrid1DBTableView1precocusto: TcxGridDBColumn
            Caption = 'Pre'#231'o Custo '
            DataBinding.FieldName = 'precocusto'
            Width = 76
          end
          object cxGrid1DBTableView1precovenda: TcxGridDBColumn
            Caption = 'Pre'#231'o Venda'
            DataBinding.FieldName = 'precovenda'
            Width = 77
          end
          object cxGrid1DBTableView1ncm: TcxGridDBColumn
            Caption = 'NCM'
            DataBinding.FieldName = 'ncm'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object TabCad: TcxTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitWidth = 572
      object lblPrecoVenda: TLabel
        Left = 427
        Top = 104
        Width = 60
        Height = 13
        Caption = 'Pre'#231'o Venda'
      end
      object lblPrecoCusto: TLabel
        Left = 311
        Top = 104
        Width = 58
        Height = 13
        Caption = 'Pre'#231'o Custo'
      end
      object edtDescricaoProd: TLabeledEdit
        Left = 16
        Top = 73
        Width = 405
        Height = 21
        EditLabel.Width = 102
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o do Produto'
        TabOrder = 0
      end
      object edtCodInterno: TLabeledEdit
        Left = 16
        Top = 29
        Width = 121
        Height = 21
        EditLabel.Width = 62
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'd. Interno'
        TabOrder = 1
      end
      object edtNCM: TLabeledEdit
        Left = 427
        Top = 73
        Width = 121
        Height = 21
        EditLabel.Width = 22
        EditLabel.Height = 13
        EditLabel.Caption = 'NCM'
        TabOrder = 2
      end
      object edtFornecedor: TLabeledEdit
        Left = 16
        Top = 120
        Width = 289
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'Fornecedor'
        TabOrder = 3
      end
      object edtPrecoCusto: TMaskEdit
        Left = 311
        Top = 120
        Width = 107
        Height = 21
        TabOrder = 4
        Text = ''
      end
      object edtPrecoVenda: TMaskEdit
        Left = 427
        Top = 120
        Width = 121
        Height = 21
        TabOrder = 5
        Text = ''
      end
    end
  end
  object panelButton: TPanel
    Left = 0
    Top = 330
    Width = 700
    Height = 51
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 580
    object btnNovo: TButton
      Left = 11
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 532
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
    end
    object btnDeletar: TButton
      Left = 451
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Deletar'
      TabOrder = 2
    end
    object btnSalvar: TButton
      Left = 613
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 3
      OnClick = btnSalvarClick
    end
  end
  object dsPrincipal: TDataSource
    DataSet = UDMProduto.cdsPrincipal
    Left = 16
    Top = 65528
  end
end
