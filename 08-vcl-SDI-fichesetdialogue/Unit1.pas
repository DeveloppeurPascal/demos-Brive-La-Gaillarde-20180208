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
  File last update : 2025-10-05T15:59:50.390+02:00
  Signature : ffe88bca697e2f10ebc207a7290a2fb476ac50e1
  ***************************************************************************
*)

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
    nb: integer;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.Button1Click(Sender: TObject);
var
  fiche: tform2;
begin
  inc(nb);
  fiche := tform2.Create(Self);
  fiche.Label1.Caption := 'Fiche ' + nb.ToString;
  fiche.Caption := fiche.Label1.Caption;
  fiche.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  fiche: tform2;
begin
  fiche := tform2.Create(Self);
  try
    fiche.Label1.Caption := 'Fenêtre bloquante';
    fiche.Caption := fiche.Label1.Caption;
    fiche.ShowModal;
  finally
    FreeAndNil(fiche);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  nb := 0;
end;

initialization

ReportMemoryLeaksOnShutdown := true;

end.
