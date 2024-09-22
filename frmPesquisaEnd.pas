unit frmPesquisaEnd;

interface

uses
Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
Vcl.StdCtrls,Data.DB, IdHTTP, System.JSON, FireDAC.Comp.Client;

type
  TfrmPesqEnd = class(TForm)
    lbUF: TLabel;
    btnPesqEnd: TButton;
    btnCancEnd: TButton;
    edtUF: TEdit;
    lbCidade: TLabel;
    edtCidade: TEdit;
    Label1: TLabel;
    edtEndereco: TEdit;
    procedure btnCancEndClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PesquisarEndereco(const Estado, Cidade, Endereco: string);
    function ProcessarJson(const Json: string): string;
  end;

var
  frmPesqEnd: TfrmPesqEnd;

implementation

{$R *.dfm}

uses frmMenuPrincipal;

procedure TfrmPesqEnd.btnCancEndClick(Sender: TObject);
begin
    close;
end;

function TfrmPesqEnd.ProcessarJson(const Json: string): string;
var
  JsonValue: TJSONValue;
begin
  JsonValue := TJSONObject.ParseJSONValue(Json);
  try
    if Assigned(JsonValue) and (JsonValue is TJSONArray) and (TJSONArray(JsonValue).Count > 0) then
    begin
      // Obtenha o primeiro endereço do JSON
      Result := TJSONObject(TJSONArray(JsonValue)[0]).GetValue<string>('logradouro', 'Endereço não encontrado');
    end
    else
      Result := 'Erro ao processar o JSON';
  finally
    JsonValue.Free;
  end;
end;

procedure TfrmPesqEnd.PesquisarEndereco(const Estado, Cidade, Endereco: string);
var
  Query: TFDQuery;
  HttpClient: TIdHTTP;
  JsonResponse: string;
  EnderecoCompleto: string;
begin
  // Validação dos campos
  if (Length(Estado) < 3) or (Length(Cidade) < 3) or (Length(Endereco) < 3) then
  begin
    ShowMessage('O campo Estado, Cidade ou Endereço deve conter pelo menos 3 caracteres.');
    Exit;
  end;

  qrConexao := FDbdCep.Create(nil);
  HttpClient := TIdHTTP.Create(nil);
  try
    qrConexao.Connection := FDbdCep; // Conexão com o banco de dados

    // Verificar se o endereço já existe na base
    qrPesqEnd.SQL.Text := 'SELECT * FROM BuscaCep WHERE Estado = :Estado AND Cidade = :Cidade AND Endereco = :Endereco';
    qrPesqEnd.ParamByName('Estado').AsString := edtUF.Text;
    qrPesqEnd.ParamByName('Cidade').AsString := edtCidade.Text;
    qrPesqEnd.ParamByName('Endereco').AsString := edtEndereco.Text;
    qrPesqEnd.Open;

    if not qrPesqEnd.IsEmpty then
    begin
      // Endereço encontrado na base
      if MessageDlg('Endereço encontrado. Deseja atualizar as informações?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        // 3. Atualizar informações
        HttpClient.Request.ContentType := 'application/json';
        JsonResponse := HttpClient.Get('https://viacep.com.br/ws/' + Estado + '/' + Cidade + '/' + Endereco + '/json/');

        // Processar JsonResponse e extrair o endereço
        EnderecoCompleto := ProcessarJson(JsonResponse);

        // Atualizar registro no banco
        Query.Edit;
        Query.FieldByName('Endereco').AsString := EnderecoCompleto;
        Query.Post;
        ShowMessage('Informações atualizadas com sucesso.');
      end
      else
      begin
        // Mostrar endereço existente
        ShowMessage('Endereço: ' + qrPesqEnd.FieldByName('Endereco').AsString);
      end;
    end
    else
    begin
      // Consultando o Web Service se não encontrado na base
      JsonResponse := HttpClient.Get('https://viacep.com.br/ws/' + Estado + '/' + Cidade + '/' + Endereco + '/json/');

      if JsonResponse <> '{}' then
      begin
        // Processar JsonResponse e armazenar
        EnderecoCompleto := ProcessarJson(JsonResponse);

        // Armazenar resultado na tabela BuscaCep
        qrInsertEnd.SQL.Text := 'INSERT INTO BuscaCep (Estado, Cidade, Endereco) VALUES (:Estado, :Cidade, :Endereco)';
        qrInsertEnd.Params.Clear;
        qrInsertEnd.ParamByName('Estado').AsString := Estado;
        qrInsertEnd.ParamByName('Cidade').AsString := Cidade;
        qrInsertEnd.ParamByName('Endereco').AsString := EnderecoCompleto;
        qrInsertEnd.ExecSQL;

        ShowMessage('Endereço salvo com sucesso: ' + EnderecoCompleto);
      end
      else
      begin
        // 5. Mensagem se o endereço não foi encontrado
        ShowMessage('Endereço completo não encontrado.');
      end;
    end;
  finally
    Query.Free;
    HttpClient.Free;
  end;
end;

end.
