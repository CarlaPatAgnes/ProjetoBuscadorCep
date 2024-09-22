unit frmMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmMenuPrinc = class(TForm)
    MainMenu1: TMainMenu;
    GeraodeResultados1: TMenuItem;
    JSONXML1: TMenuItem;
    iposdePesquisa1: TMenuItem;
    CEP1: TMenuItem;
    CEP2: TMenuItem;
    Sair1: TMenuItem;
    procedure JSONXML1Click(Sender: TObject);
    procedure CEP1Click(Sender: TObject);
    procedure CEP2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuPrinc: TfrmMenuPrinc;

implementation

{$R *.dfm}

uses frmPesquisaCEP, frmPesquisaEnd, frmPrincipal, frmPesqCEPca12;

procedure TfrmMenuPrinc.CEP1Click(Sender: TObject);
begin
   frmPesqCEP.ShowModal;
   frmPesqCEP.Free;
end;

procedure TfrmMenuPrinc.CEP2Click(Sender: TObject);
begin
    frmPesqEnd.ShowModal;
    frmPesqEnd.Free;
end;

procedure TfrmMenuPrinc.JSONXML1Click(Sender: TObject);
begin
   frmPrinc.ShowModal;
   frmPrinc.Free;
end;

procedure TfrmMenuPrinc.Sair1Click(Sender: TObject);
begin
   Application.Terminate;
end;

end.
