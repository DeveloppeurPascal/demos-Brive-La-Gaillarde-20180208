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
  File last update : 2025-10-05T15:59:50.380+02:00
  Signature : 144d1a6dc9120e59c6821de74b9520741a69a918
  ***************************************************************************
*)

program Project1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

function calculer(nb1, nb2: integer): integer;
begin
  if (nb1 > 0) then
    Result := calculer(nb1 - 1, nb2)
  else
    Result := nb1;
end;

var
  nb1, nb2: integer;
  ch: string;

begin
  try
    repeat
      writeln('Nombre 1 ?');
      readln(ch);
      try
        nb1 := strtoint(ch);
      except
        writeln('Veuillez saisir une valeur numérique entière.');
        nb1 := 0;
      end;
    until (nb1 > 0);
    repeat
      writeln('Nombre 2 ?');
      readln(ch);
      try
        nb2 := strtoint(ch);
      except
        writeln('Veuillez saisir une valeur numérique entière.');
        nb2 := 0;
      end;
    until (nb2 > 0);
    writeln('Résultat : ', IntToStr(calculer(nb1, nb2)));
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;
  while (true) do;

end.
