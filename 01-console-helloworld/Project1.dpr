program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

  var c: char;
begin
  try
    writeln('Bonjour Brive la Gaillarde');
    writeln;
    repeat
      read(c);
    until c = 'q';
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
