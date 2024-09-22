object frmPesqEnd: TfrmPesqEnd
  Left = 0
  Top = 0
  Caption = 'Pesquisar Endere'#231'o'
  ClientHeight = 169
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object lbUF: TLabel
    Left = 15
    Top = 26
    Width = 20
    Height = 20
    Caption = 'UF:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lbCidade: TLabel
    Left = 15
    Top = 58
    Width = 50
    Height = 20
    Caption = 'Cidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 15
    Top = 85
    Width = 65
    Height = 20
    Caption = 'Endere'#231'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnPesqEnd: TButton
    Left = 141
    Top = 125
    Width = 89
    Height = 33
    Caption = 'Pesquisar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnCancEnd: TButton
    Left = 245
    Top = 125
    Width = 89
    Height = 33
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnCancEndClick
  end
  object edtUF: TEdit
    Left = 87
    Top = 23
    Width = 49
    Height = 23
    MaxLength = 2
    TabOrder = 2
  end
  object edtCidade: TEdit
    Left = 87
    Top = 54
    Width = 153
    Height = 23
    MaxLength = 100
    TabOrder = 3
  end
  object edtEndereco: TEdit
    Left = 87
    Top = 83
    Width = 338
    Height = 23
    MaxLength = 100
    TabOrder = 4
  end
end
