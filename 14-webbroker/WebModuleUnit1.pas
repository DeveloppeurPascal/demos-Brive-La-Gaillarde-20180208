(* C2PP
  ***************************************************************************

  Présentation RAD Studio 10.2 Tokyo à Brive La Gaillarde le 8 février 2018

  Copyright 2018 Patrick PREMARTIN under MIT license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://samples.developpeur-pascal.fr/

  Project site :
  https://github.com/DeveloppeurPascal/demos-Brive-La-Gaillarde-20180208

  ***************************************************************************
  File last update : 2025-10-05T15:59:50.427+02:00
  Signature : ded2f05d42ebf59c5346f549fef2568231215bf7
  ***************************************************************************
*)

unit WebModuleUnit1;

interface

uses System.SysUtils, System.Classes, Web.HTTPApp;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  i: integer;
begin
  Response.Content := '<html>' +
    '<head><title>Application Serveur Web</title></head>' +
    '<body><p>Application Serveur Web</p>';
  Response.Content := Response.Content + '<p>Méthode : ' +
    Request.Method + '</p>';
  Response.Content := Response.Content + '<p>Page : ' + Request.PathInfo
    + '</p>';
  Response.Content := Response.Content + '<p>Paramètres : ';
  for i := 0 to Request.QueryFields.Count - 1 do
    Response.Content := Response.Content + '<br />' + Request.QueryFields[i];
  Response.Content := Response.Content + '</p>';
  Response.Content := Response.Content +
    '<p>Lien 1 : <a href="?bidule=hello&truc=world">cliquez</a></p>';
  Response.Content := Response.Content +
    '<p>Lien 2 : <a href="python.php?hehe=memepasenreve">cliquez</a></p>';
  Response.Content := Response.Content + '</body>' + '</html>';
end;

end.
