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
  Signature : d6543cff2ffe79560cb0d00065666a4064a41b0c
  ***************************************************************************
*)

program Project1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

function touche: char;
var
  c: char;
begin
  read(c);
  touche := c;
end;

procedure menu(n: integer);
begin
  writeln('**********');
  writeln('Option ' + n.ToString);
  writeln('**********');
end;

procedure menu1;
begin
  menu(1);
end;

procedure menu2;
begin
  menu(2);
end;

procedure menu3;
begin
  menu(3);
end;

procedure menu4;
begin
  menu(4);
end;

procedure menuprincipal;
var
  sortie, toucheok: boolean;
begin
  sortie := false;
  repeat
    writeln('a-Option 1');
    writeln('z-Option 2');
    writeln('e-Option 3');
    writeln('r-Option 4');
    writeln('x-Quitter');
    repeat
      toucheok := true;
      case touche of
        'a', 'A':
          menu1;
        'z', 'Z':
          menu2;
        'e', 'E':
          menu3;
        'r', 'R':
          menu4;
        'x', 'X':
          begin
            writeln('Au revoir');
            sortie := true;
          end;
      else
        toucheok := false;
      end;
    until toucheok;
  until sortie;
end;

begin
  try
    menuprincipal;
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;
  while (true) do;

end.
