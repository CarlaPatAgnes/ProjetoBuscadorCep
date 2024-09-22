unit frmPesqCEPca12;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmCEP12 = class(TForm)
    lbNumCEP: TLabel;
    edtCEP: TEdit;
    btnPesquisar: TButton;
    btnCancelar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCEP12: TfrmCEP12;

implementation

{$R *.dfm}

end.
