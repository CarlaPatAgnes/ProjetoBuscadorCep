unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  System.net.HttpClient,System.Net.HttpClientComponent,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.JSON, Xml.XMLDoc, Xml.XMLIntf;

type
  TfrmPrinc = class(TForm)
    Panel1: TPanel;
    rgVia: TRadioGroup;
    btnSAIR: TButton;
    rbJSON: TRadioButton;
    rbXML: TRadioButton;
    mmGerado: TMemo;
    edtCEP: TEdit;
    lbNumCEP: TLabel;
    btnConsultar: TButton;
    procedure btnSAIRClick(Sender: TObject);
    procedure btnBuscacepClick(Sender: TObject);
    procedure btnEndClick(Sender: TObject);
    procedure edtCEPKeyPress(Sender: TObject; var Key: Char);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    private
    { Private declarations }
   public
     { Public declarations }
      procedure ConsultaJSON(const CEP: String);
      procedure ConsultarXML(const CEP: string);

  end;

var
  frmPrinc: TfrmPrinc;

implementation

{$R *.dfm}

uses frmPesquisaCEP, frmPesquisaEnd, frmMenuPrincipal;

procedure TfrmPrinc.btnBuscacepClick(Sender: TObject);
begin
   frmPesqCEP.ShowModal;
   frmPesqCEP.Free;
end;

procedure TfrmPrinc.btnConsultarClick(Sender: TObject);
var
  CEP: string;
begin
  CEP := edtCEP.Text;
  //Verificando a opção selecionado
  if rbJSON.Checked then
  //chamando a consulta via JSON,caso seja selecionado
    ConsultaJSON(CEP)
  else if rbXML.Checked then
  //chamando a consulta via XML,caso seja selecionado
    ConsultarXML(CEP)
  else
  //caso nao seja selecionado nenhuma das opções...
    ShowMessage('Caro usuário,favor selecionar o formato da consulta (JSON ou XML)!');
end;

procedure TfrmPrinc.btnEndClick(Sender: TObject);
begin
    frmPesqEnd.ShowModal;
    frmPesqEnd.Free;
end;

procedure TfrmPrinc.btnSAIRClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrinc.edtCEPKeyPress(Sender: TObject; var Key: Char);
begin
    if not(key in ['0'..'9',#8]) then
     Key:=#0;
end;

procedure TfrmPrinc.FormShow(Sender: TObject);
begin
   edtCEP.SetFocus;
   mmGerado.Clear;
end;

//consulta via JSON
procedure TfrmPrinc.ConsultaJSON(const CEP: String);
var
  HttpClient: THttpClient;
  Response:   IHTTPResponse;
  JsonValue:  TJSONValue;
begin
  HttpClient := THttpClient.Create;
  try
    //Consultando a API do ViaCEP
    Response := HttpClient.Get('https://viacep.com.br/ws/' + CEP + '/json/');
    //indica que a solicitação foi bem-sucedida
    if Response.StatusCode = 200 then
    begin
      JsonValue := TJSONObject.ParseJSONValue(Response.ContentAsString);
      try
        // Processar e exibir dados JSON
        mmGerado.Lines.Add(JsonValue.ToString);
      finally
        JsonValue.Free;
      end;
    end
    else
      ShowMessage('Erro: ' + IntToStr(Response.StatusCode));
  finally
    HttpClient.Free;
  end;
end;

//consulta via XML
procedure TfrmPrinc.ConsultarXML(const CEP: string);
var
  HttpClient: THttpClient;
  Response:   IHTTPResponse;
  XMLDoc:     IXMLDocument;
begin
  HttpClient := THttpClient.Create;
  try
    //Consultando a API do ViaCEP
    Response := HttpClient.Get('https://viacep.com.br/ws/' + CEP + '/xml/');
    //indica que a solicitação foi bem-sucedida
    if Response.StatusCode = 200 then
    begin
      XMLDoc := LoadXMLData(Response.ContentAsString);
      try
        // Processar e exibir dados XML
        mmGerado.Lines.Add(XMLDoc.XML.Text);
      finally
        XMLDoc := nil; // Libera a memória
      end;
    end
    else
      ShowMessage('Erro: ' + IntToStr(Response.StatusCode));
  finally
    HttpClient.Free;
  end;
end;




end.
