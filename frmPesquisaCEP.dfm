object frmPesqCEP: TfrmPesqCEP
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisa CEP'
  ClientHeight = 139
  ClientWidth = 237
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
    Left = 64
    Top = 24
    Width = 129
    Height = 23
    MaxLength = 8
    TabOrder = 0
    OnKeyPress = edtCEPKeyPress
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
    OnClick = btnPesquisarClick
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
    OnClick = btnCancelarClick
  end
end
