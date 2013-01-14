unit FILE_IO;
{
* FILENAME: File_IO.pas
* Date Created: 1/5/2013
* Created By: Jamie Tomlinson (JRT)
*
* Purpose:
*
* Uses: Main
*       Matrix
*
*
* Procedures/Functions:
*
*  procedure LoadSequence(seq_name: TFileName);
*  procedure SaveSequence(seq_name: TFileName);
*  function HexToInt(HexNum: string): LongInt;
*  function TColorToHex(Color : TColor) : string;
*  function HexToTColor(sColor : string) : TColor;
*
* Variables:
*
* Changes:
*    1/7/2013 - Modified the save file to include light orientation (JRT)
}
interface

uses Windows, Graphics, SysUtils;

  procedure LoadSequence(seq_name: TFileName);
  procedure SaveSequence(seq_name: TFileName);
  function HexToInt(HexNum: string): LongInt;
  function TColorToHex(Color : TColor) : string;
  function HexToTColor(sColor : string) : TColor;


implementation

uses MAIN, Matrix, BUFFER, SETUP;

procedure LoadSequence(seq_name: TFileName);
var
F: File of integer;
Fr: integer;
X: integer;
color: integer;
LRL, DUD: integer;
  Y: Integer;
begin
  //
  AssignFile(F, seq_name);
  Reset(F);
  Try
    Read(F, Cols);
    Read(F, Rows);
    Read(F, CurrentBuffer);
    Read(F, LastFrame);
    Read(F, LRL);
    Read(F, DUD);
    Read(F, TimeHack);
    Read(F, StartChannel);
    if LRL = 1 then IsLRL := True else IsLRL := False;
    if DUD = 1 then IsDUD := True else IsDUD := False;

    SetLength(SASequence, Rows, Cols, CurrentBuffer+1);
    for Fr := 0 to LastFrame do
      for Y := 0 to Rows - 1 do
        for X := 0 to Cols - 1 do

          begin
          Read(F, color);
          SASequence[Y,X,Fr] := HexToTColor(IntToHex(color,6));
          end;
    CurrentBuffer := CurrentBuffer + AddFrames;
    SetLength(SASequence, Rows, Cols, CurrentBuffer);
    Frame := LastFrame;
    FillLightMatrix;
    CreateBuffer;
    SetLength(ChannelArray, Rows, Cols);
    FillChannels;
  Finally
    Close(F);
  end;
  Frame := 0;
end;

procedure SaveSequence(seq_name: TFileName);
var
  F: File of integer;
  Y: Integer;
  X: Integer;
  Fr: Integer;
  color: integer;
  LRL, DUD: integer;
begin
  //
  if IsLRL then LRL := 1 else LRL := 0;
  if IsDUD then DUD := 1 else DUD := 0;

  AssignFile(F, seq_name);
  Rewrite(F);
  try
    Write(F, Cols);
    Write(F, Rows);
    Write(F, CurrentBuffer);
    Write(F, LastFrame);
    Write(F, LRL);
    Write(F, DUD);
    Write(F, TimeHack);
    Write(F, StartChannel);
    for Fr := 0 to LastFrame do
      for Y := 0 to Rows - 1 do
        for X := 0 to Cols - 1 do
          begin
            color := HexToInt(TcolorToHex(SASequence[Y,X,Fr]));
            Write(F, color);
          end;
  finally
    CloseFile(F);
  end;

end;

function HexToInt(HexNum: string): LongInt;
begin
   Result:=StrToInt('$' + HexNum) ;
end;

function TColorToHex(Color : TColor) : string;
begin
   Result :=
     IntToHex(GetRValue(Color), 2) +
     IntToHex(GetGValue(Color), 2) +
     IntToHex(GetBValue(Color), 2) ;
end;

function HexToTColor(sColor : string) : TColor;
begin
   Result :=
     RGB(
       StrToInt('$'+Copy(sColor, 1, 2)),
       StrToInt('$'+Copy(sColor, 3, 2)),
       StrToInt('$'+Copy(sColor, 5, 2))
     ) ;
end;

end.
