unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  IdHTTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdSSLOpenSSLHeaders,
  RegExpr, IdBaseComponent, IdCookieManager, IdURI, IdHeaderList, IdGlobalProtocols,
  Vcl.OleCtrls, SHDocVw,
  MSHTML, ActiveX;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    WebBrowser1: TWebBrowser;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure WebBrowser1NavigateComplete2(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CurDispatch: IDispatch;
  function StripTag(S: string): string;

implementation

{$R *.dfm}

function StripTag(S: string): string;
var TagBegin, TagEnd, TagLength: integer;

begin
  TagBegin := Pos('<', S);
  while (TagBegin > 0) do
    begin
      TagEnd := Pos('>', S);
      TagLength := TagEnd - TagBegin + 1;
      Delete(S, TagBegin, TagLength);
      TagBegin := Pos('<', S);
    end;
  Result := S;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.WindowState := wsMaximized;
  WebBrowser1.Navigate('https://olimp.kz/mobile/index.php?page=line&action=1&live=1');
end;

procedure TForm1.WebBrowser1NavigateComplete2(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  if CurDispatch = nil then
    CurDispatch := pDisp;
end;

procedure TForm1.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
var
  html: IHtmlDocument2;
begin
  if (pDisp = CurDispatch) then
    begin
      html := WebBrowser1.Document as IHtmlDocument2;
      Memo1.Text := html.body.innerHTML;
      CurDispatch := nil; {clear the global variable }
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  IdHTTP: TIdHTTP;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
  re1: TRegExpr;
  lst1: TStringList;
  s: string;
  i: Integer;
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  s: string;
  lst1: TStringList;
  re1: TRegExpr;
  i: integer;
begin
  lst1 := TStringList.Create;
  re1 := TRegExpr.Create;
  s := Copy(Memo1.Text, Pos('Баскетбол', memo1.Text), Length(Memo1.Text) - Pos('Баскетбол', memo1.Text) - 100);
  s := Copy(s, 1, Pos('CURSOR', s));

  re1.Expression := 'live-id="(.*?)">'; //id
  if re1.Exec(s) then
    repeat
      lst1.Add(re1.Match[1])
    until not re1.ExecNext;

  for i := 0 to lst1.Count - 1 do
    StringGrid1.Cells[0, i + 1] := Trim(StripTag(lst1.Strings[i]));
  lst1.Clear;
    
  re1.Expression := 'live\[]=\d{2,10}">(.*?)<BR>';  //event
  if re1.Exec(s) then
    repeat
      lst1.Add(re1.Match[1])
    until not re1.ExecNext;

  for i := 0 to lst1.Count - 1 do
    StringGrid1.Cells[1, i + 1] := Trim(StripTag(lst1.Strings[i]));
  lst1.Clear;

  re1.Expression := 'lost>(.*?)</SPAN>';  //score
  if re1.Exec(s) then
    repeat
      lst1.Add(re1.Match[1])
    until not re1.ExecNext;

  for i := 0 to lst1.Count - 1 do
    StringGrid1.Cells[2, i + 1] := Trim(StripTag(lst1.Strings[i]));
  lst1.Clear;
    
  Memo1.Text := s;
  
end;


end.
