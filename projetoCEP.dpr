program projetoCEP;

uses
  Vcl.Forms,
  frmPrincipal in 'frmPrincipal.pas' {frmPrinc},
  frmMenuPrincipal in 'frmMenuPrincipal.pas' {frmMenuPrinc},
  frmPesquisaCEP in 'frmPesquisaCEP.pas' {frmPesqCEP},
  frmPesquisaEnd in 'frmPesquisaEnd.pas' {frmPesqEnd};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenuPrinc, frmMenuPrinc);
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.CreateForm(TfrmPesqCEP, frmPesqCEP);
  Application.CreateForm(TfrmPesqEnd, frmPesqEnd);
  Application.Run;
end.
