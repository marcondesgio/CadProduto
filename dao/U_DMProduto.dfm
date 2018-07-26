object UDMProduto: TUDMProduto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 208
  Width = 269
  object qryPrincipal: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from "tblcadastro";')
    SQLConnection = UDM.sqlCnn
    Left = 32
    Top = 16
    object qryPrincipalid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qryPrincipalcodproduto: TStringField
      FieldName = 'codproduto'
      Size = 10
    end
    object qryPrincipaldescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryPrincipalfornecedor: TStringField
      FieldName = 'fornecedor'
      Size = 50
    end
    object qryPrincipalprecocusto: TSingleField
      FieldName = 'precocusto'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryPrincipalprecovenda: TSingleField
      FieldName = 'precovenda'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryPrincipalncm: TStringField
      FieldName = 'ncm'
      Size = 15
    end
    object qryPrincipaldatacad: TDateField
      FieldName = 'datacad'
    end
  end
  object dspPrincipal: TDataSetProvider
    DataSet = qryPrincipal
    Left = 32
    Top = 72
  end
  object qryAux: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = UDM.sqlCnn
    Left = 192
    Top = 16
  end
  object cdsPrincipal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrincipal'
    Left = 32
    Top = 136
    object cdsPrincipalid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsPrincipalcodproduto: TStringField
      FieldName = 'codproduto'
      Size = 10
    end
    object cdsPrincipaldescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object cdsPrincipalfornecedor: TStringField
      FieldName = 'fornecedor'
      Size = 50
    end
    object cdsPrincipalprecocusto: TSingleField
      FieldName = 'precocusto'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsPrincipalprecovenda: TSingleField
      FieldName = 'precovenda'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsPrincipalncm: TStringField
      FieldName = 'ncm'
      Size = 15
    end
    object cdsPrincipaldatacad: TDateField
      FieldName = 'datacad'
    end
  end
end
