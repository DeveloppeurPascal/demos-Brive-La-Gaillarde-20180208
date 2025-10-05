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
  File last update : 2025-10-05T15:59:50.407+02:00
  Signature : f5e0ba863084dc54383b613caaa585340d9b8935
  ***************************************************************************
*)

unit u_download;

interface

uses system.SysUtils;

type
  tdownload_file = class(tobject)
    class procedure download(from_url, to_filename: string;
      success: tproc = nil; error: tproc = nil);
    class function temporaryFileName(appName: string): string;
  end;

implementation

{ download_file }

uses system.ioutils, system.Net.HttpClient, system.Classes;

class procedure tdownload_file.download(from_url, to_filename: string;
  success: tproc = nil; error: tproc = nil);
begin
  tthread.CreateAnonymousThread(
    procedure
    var
      serveur: THTTPClient;
      serveur_reponse: IHTTPResponse;
      fichier: tfilestream;
    begin
      try
        serveur := THTTPClient.Create;
        try
          serveur_reponse := serveur.Get(from_url);
          if serveur_reponse.StatusCode = 200 then
          begin
            fichier := tfilestream.Create(to_filename,
              fmCreate or fmOpenWrite or fmShareDenyWrite);
            try
              fichier.CopyFrom(serveur_reponse.ContentStream,
                serveur_reponse.ContentStream.Size);
            finally
              fichier.Free;
            end;
            if assigned(success) then
              tthread.queue(nil,
                procedure
                begin
                  success;
                end);
          end
          else
          begin
            raise Exception.CreateFmt
              ('Cannot get distant file. Please contact us or retry later. HTTP %d - %s',
              [serveur_reponse.StatusCode, serveur_reponse.StatusText]);
          end;
        finally
          serveur.Free;
        end;
      except
        if assigned(error) then
          tthread.queue(nil,
            procedure
            begin
              error;
            end);
      end;
    end).Start;
end;

class function tdownload_file.temporaryFileName(appName: string): string;
begin
  result := tpath.Combine(tpath.gettempPath,
    appName + '-' + datetimetotimestamp(now).Time.ToString + '.tmp')
end;

end.
