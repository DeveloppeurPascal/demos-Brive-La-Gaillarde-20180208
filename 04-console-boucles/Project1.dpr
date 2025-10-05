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
  Signature : bccea42be433f3b93ca2233f0ec62b8a88622a99
  ***************************************************************************
*)

program Project1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, System.math;

function calculer(nb1, nb2: integer): integer;
var
  i: integer;
begin
  if (nb1 > 0) then
    Result := calculer(nb1 - 1, nb2)
  else
  begin
    Result := 0;
    for i := 0 to nb2 do
      inc(Result);
  end;
end;

function GetNombre(n: integer): integer;
var
  nb: integer;
  ch: string;
begin
  repeat
    writeln('Nombre ' + n.ToString + ' ?');
    readln(ch);
    try
      nb := strtoint(ch);
    except
      writeln('Veuillez saisir une valeur numérique entière.');
      nb := 0;
    end;
  until (nb > 0);
  exit(nb);
end;

var
  nb1, nb2: integer;
  ch: string;

begin
  try
    nb1 := GetNombre(1);
    nb2 := GetNombre(2);
    writeln('Résultat : ', cos(Power(2, calculer(nb1, nb2))));
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;
  while (true) do;

end.
