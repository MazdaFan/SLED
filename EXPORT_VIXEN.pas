unit EXPORT_VIXEN;

interface
uses Windows, SysUtils, Graphics, StrUtils, Classes;

procedure Export_Vix(sequence_name: string);


implementation

uses MAIN;


{
********************************************************************************
*
*  Tab()
*
*  adds tab characters together and returns a string that can be added to the
*  the beginning of any string
*
********************************************************************************
}
function tab(X: integer): string;
var
IndentString: Char;
ResultString: string;
  Y: Integer;
begin
  IndentString := Char(9);
  ResultString := '';
  for Y := 0 to X-1 do
    ResultString := concat(ResultString, IndentString);

Result := ResultString;
end; // function tab()

{
********************************************************************************
*
* procedure BuildVixHeader
*
* Builds a header and stores it in MyMemo
*
********************************************************************************
}

procedure BuildVixHeader;
begin

With MainForm.MyMemo.Lines do
  begin
    Append(concat('<?xml version="1.0" encoding="utf-8"?>'));
    Append(concat('<Program>'));
    Append(concat(tab(1),'<Time>',IntToStr(),'</Time>'));
    Append(concat(tab(1),'<EventPeriodInMilliseconds>100</EventPeriodInMilliseconds>'));
    Append(concat(tab(1),'<MinimumLevel>0</MinimumLevel>'));
    Append(concat(tab(1),'<MaximumLevel>255</MaximumLevel>'));
    Append(concat(tab(1),'<AudioDevice>-1</AudioDevice>'));
    Append(concat(tab(1),'<AudioVolume>0</AudioVolume>'));
    Append(concat(tab(1),'<Channels />'));
    Append(concat(tab(1),'<PlugInData />'));
    Append(concat(tab(1),'<SortOrders lastSort="-1" />'));
    Append(concat(tab(1),'<EventValues>'));
    Append(concat(tab(1),'</EventValues>'));
    Append(concat(tab(1),'<LoadableData />'));
    Append(concat(tab(1),'<EngineType>Standard</EngineType>'));
    Append(concat(tab(1),'<Extensions>'));
    Append(concat(tab(2),'<Extension type=".led">'));
    Append(concat(tab(3),'<Boards width="1" height="1" />'));
    Append(concat(tab(3),'<CellSize>5</CellSize>'));
  end;

  end;  // procedure BuildVixHeader;


{
********************************************************************************
*
*  procedure BuildVixFooter
*
*   Builds a footer to the .vix file and stores it in MyMemo
*
********************************************************************************
}
procedure BuildVixFooter;
begin

  with MainForm.MyMemo.Lines do
    begin
      Append(concat(tab(3),'</Frames>'));
      Append(concat(tab(2),'</Extension>'));
      Append(concat(tab(1),'</Extensions>'));
      Append(concat('</Program>'));
    end;

end;  // procedure BuildVixFooter;

{
********************************************************************************
*
*  procedure WriteVixFile
*
*  uses MainForm.MyMemo to output vixens .led file.
*
********************************************************************************
}
procedure WriteVixFile;
begin

  // <Frame length="50">DwAAAA4AAAAOAAEADQABAAwAAQAMAAIACwACAAoAAgAKAAMACQADAAgAAwAIAAQABwAEAAYABAAGAAUABQAFAAQABQADAAYAAgAGAAIABwABAAcAAAAHAA==</Frame>
  //
  //   or
  // <Frame length='50>
  // </Frame>

end; // procedure WriteVixFile;

{
********************************************************************************
*
*   Procedure Export_Vix
*
*   Does all the setup work.  Only procedure visible outside of this file.
*
********************************************************************************
}
procedure Export_Vix(sequence_name: string);
begin
    MainForm.MyMemo.Clear;

    BuildVixHeader;

    // BuildVixFrames

    BuildVixFooter;

    WriteVixFile;

end;


end.
{
********************************************************************************
*
*
*
*
*
********************************************************************************
}