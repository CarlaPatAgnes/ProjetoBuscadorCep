unit frmPesquisaCEP;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Data.DB,REST.Client, REST.Types,IdHTTP,
   System.JSON, Datasnap.DBClient,FireDAC.Comp.Client;

type
  TfrmPesqCEP = class(TForm)
    lbNumCEP: TLabel;
    edtCEP: TEdit;
    btnPesquisar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCEPKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisarClick(Sender: TObject);
   private
    { Private declarations }
  public
    { Public declarations }
    procedure PesquisarCEP(const CEP: string);
    function ProcessarJson(const Json: string): string;
  end;

var
  frmPesqCEP: TfrmPesqCEP;

implementation

{$R *.dfm}

uses frmMenuPrincipal;

procedure TfrmPesqCEP.btnCancelarClick(Sender: TObject);
begin
    close;
end;

procedure TfrmPesqCEP.btnPesquisarClick(Sender: TObject);
begin
   PesquisarCEP(edtCEP.Text);
end;

procedure TfrmPesqCEP.edtCEPKeyPress(Sender: TObject; var Key: Char);
begin
   if not(key in ['0'..'9',#8]) then
     Key:=#0;
end;

procedure TfrmPesqCEP.FormShow(Sender: TObject);
begin
   edtCEP.SetFocus;
end;

function TfrmPesqCEP.ProcessarJson(const Json: string): string;
var
  JsonValue: TJSONValue;
begin
  JsonValue := TJSONObject.ParseJSONValue(Json);
  try
    if Assigned(JsonValue) and (JsonValue is TJSONObject) then
    begin
      Result := JsonValue.GetValue<string>('logradouro', 'Endereço não encontrado');
    end
    else
      Result := 'Erro ao processar o JSON';
  finally
    JsonValue.Free;
  end;
end;

procedure TfrmPesqCEP.PesquisarCEP(const CEP: string);
var
  Query: TFDQuery;
  HttpClient: TIdHTTP;
  JsonResponse: string;
  Endereco: string;
begin
  qrConexao := TFDconexao.Create(nil);
  try
    qrConexao.Connection := FDbdCep; // Conexão com o banco de dados

    // 1. Verificar se o CEP já existe na base
    qrPesq.SQL.Text := 'SELECT * FROM BuscaCep WHERE CEP = :CEP';
    qrPesq.ParamByName('CEP').AsString := edtCEP.Text;
    qrPesq.Open;

    if not qrPesq.IsEmpty then
    begin
      // CEP encontrado na base
      if MessageDlg('Endereço encontrado. Deseja atualizar as informações?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        //Consulta o Web Service para atualizar o endereço caso tenha necessidade
        HttpClient := TIdHTTP.Create(nil);
        try
          JsonResponse := HttpClient.Get('https://viacep.com.br/ws/' + CEP + '/json/');
          // Processar JsonResponse e extrae o endereço
          Endereco := ProcessarJson(JsonResponse);

          // Atualizar registro no banco
          qrUpdate.Edit;
          qrUpdate.FieldByName('Endereco').AsString := Endereco;
        finally
          HttpClient.Free;
        end;
      end
      else
      begin
         ShowMessage('Endereço: ' + qrPesq.FieldByName('Endereco').AsString);
      end;
    end
    else
    begin
      // Consultando o Web Service
      HttpClient := TIdHTTP.Create(nil);
      try
        JsonResponse := HttpClient.Get('https://viacep.com.br/ws/' + CEP + '/json/');

        // Processa JsonResponse e verificar se há endereço
        if JsonResponse <> '{}' then
        begin
        //chamando funcao
          Endereco := ProcessarJson(JsonResponse);

          // Armazenar resultado na tabela BuscaCep
          qrInsert.SQL.Text := 'INSERT INTO BuscaCep (CEP, Endereco) VALUES (:CEP, :Endereco)';
          qrInsert.Params.Clear;
          qrInsert.ParamByName('CEP').AsString := CEP;
          qrInsert.ParamByName('Endereco').AsString := Endereco;
          qrInsert.ExecSQL;

          ShowMessage('Endereço salvo com sucesso: ' + Endereco);
        end
        else
        begin
          // Mensagem se o CEP não foi encontrado
          ShowMessage('CEP não encontrado.');
        end;
      finally
        HttpClient.Free;
      end;
    end;
     qrConexao.Free;
    end;
  end;
end;



end.
