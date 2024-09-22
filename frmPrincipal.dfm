object frmPrinc: TfrmPrinc
  Left = 0
  Top = 0
  Caption = 'Pesquisar'
  ClientHeight = 391
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 15
  object lbNumCEP: TLabel
    Left = 14
    Top = 76
    Width = 114
    Height = 23
    Caption = 'Informe o CEP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 57
    Align = alTop
    Caption = 'BUSCADOR DE CEP'
    Color = clGradientActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNone
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 504
  end
  object rgVia: TRadioGroup
    Left = 8
    Top = 112
    Width = 171
    Height = 87
    Caption = 'Consulta Via:'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnSAIR: TButton
    Left = 237
    Top = 347
    Width = 169
    Height = 33
    Caption = 'SAIR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnSAIRClick
  end
  object rbJSON: TRadioButton
    Left = 16
    Top = 154
    Width = 69
    Height = 17
    Caption = 'JSON'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object rbXML: TRadioButton
    Left = 112
    Top = 154
    Width = 61
    Height = 17
    Caption = 'XML'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object mmGerado: TMemo
    Left = 185
    Top = 125
    Width = 224
    Height = 209
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 5
  end
  object edtCEP: TEdit
    Left = 145
    Top = 75
    Width = 129
    Height = 23
    MaxLength = 9
    TabOrder = 6
    OnKeyPress = edtCEPKeyPress
  end
  object btnConsultar: TButton
    Left = 284
    Top = 74
    Width = 93
    Height = 25
    Caption = 'Consultar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnConsultarClick
  end
end
