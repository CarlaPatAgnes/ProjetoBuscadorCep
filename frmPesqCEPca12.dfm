object frmCEP12: TfrmCEP12
  Left = 0
  Top = 0
  Caption = 'CA1.2'
  ClientHeight = 131
  ClientWidth = 258
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lbNumCEP: TLabel
    Left = 22
    Top = 24
    Width = 28
    Height = 20
    Caption = 'CEP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object edtCEP: TEdit
    Left = 72
    Top = 25
    Width = 129
    Height = 23
    MaxLength = 8
    TabOrder = 0
  end
  object btnPesquisar: TButton
    Left = 21
    Top = 77
    Width = 89
    Height = 33
    Caption = 'Pesquisar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnCancelar: TButton
    Left = 125
    Top = 77
    Width = 89
    Height = 33
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
