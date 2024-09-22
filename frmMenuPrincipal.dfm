object frmMenuPrinc: TfrmMenuPrinc
  Left = 0
  Top = 0
  Caption = 'Sistema Buscador de CEP -v1.0'
  ClientHeight = 225
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesktopCenter
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 24
    Top = 40
    object GeraodeResultados1: TMenuItem
      Caption = 'Gera'#231#227'o de Resultados'
      object JSONXML1: TMenuItem
        Caption = 'JSON/XML'
        OnClick = JSONXML1Click
      end
    end
    object iposdePesquisa1: TMenuItem
      Caption = 'Tipos de Pesquisa'
      object CEP1: TMenuItem
        Caption = 'CEP'
        OnClick = CEP1Click
      end
      object CEP2: TMenuItem
        Caption = 'Endere'#231'o'
        OnClick = CEP2Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
