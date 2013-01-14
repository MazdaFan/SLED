unit EXPORT_XML;
{
* FILENAME: Export_XML.pas
* Date Created: 1/5/2013
* Created By: Jamie Tomlinson (JRT)
*
* Purpose:
*
* Uses:
*   Main.pas
*
* Procedures/Functions:
*     procedure CreateXMLDoc(sequence_name: string);  // Creates and writes an XML document to disk using variables
*                                                     // from the other modules, and on/off times from GetTimes
*
*     procedure GetTimes(Channel: integer);  // Steps through the LightSequence array and determines our on and
*                                               off times for each channel.
*
* Variables:
*      Centiseconds: array of array of integer;   // Our start and stop times for a channel in centiseconds
*
* Changes:
*   1/7/13 - Changed to use TMemo from MainForm so that I had TStrings to store XML data to.
}
interface

uses Windows, SysUtils, Graphics, StrUtils;


  procedure CreateXMLDoc(sequence_name: string);


var
  Centiseconds: array of array of integer;
  Indexer: integer;
  AniLength: integer;
  MyList: array of Integer;
  MyListIndex: integer;
  MyListMax: integer;

implementation



uses MAIN;

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
end;



{
 DO XML HEADER
 Write an XML header to MainForm.MyMemo.Lines
}
procedure DoXMLHeader;
begin
  // 1st Level
    MainForm.MyMemo.Lines.Append('<?xml version="1.0" encoding="UTF-8" standalone="no"?>');
    MainForm.MyMemo.Lines.Append(concat('<sequence saveFileVersion="11" author="Smart LED" createdAt="', DateTimeToStr(Now) ,'">'));
    // 2nd Level
    MainForm.MyMemo.Lines.Append( concat(tab(1),'<channels>'));
end; // end of procedure DoXMLHeader;



{
*
*  GET RED(X,Y)
*
}
procedure GetRed(Y, X: integer);
var
  ChannelOn, NeedClose: Boolean;
  OnTime, OffTime: integer;
  Intensity, LastIntensity: integer;
  Fr: Integer;
  Red: Integer;
  ES: string;
begin
  //
  LastIntensity := 0;
  Intensity := 0;
  OnTime := 0;
  OffTime := 0;


  for Fr := 0 to LastFrame do
    begin
    Red := GetRValue(SASequence[Y, X, Fr]);
    Intensity := Trunc((Red / 255)*100);
    if Intensity > 0 then
      begin
        ChannelOn := True;
        LastIntensity := Intensity;
        OnTime := (TimeHack * Fr);
        ES := concat(tab(3), '<effect type="intensity" startCentisecond="', IntToStr(OnTime));
      end
    else
      if intensity <> lastintensity then
        begin
          ChannelOn := False;
          OffTime := (TimeHack * Fr);
          ES := concat(ES, '" endCentisecond="',IntToStr(OffTime),'" intensity="',IntToStr(LastIntensity),'"/>');
          MainForm.MyMemo.Lines.Append(ES);
          ES := '';
          NeedClose := True;
          if Intensity > 0 then
            begin
              ChannelOn := True;
              OnTime := (TimeHack * Fr);
              LastIntensity := Intensity;
              ES := concat(tab(3), '<effect type="intensity" startCentisecond="', IntToStr(OnTime));
            end;
        end;
    end;
  if NeedClose then MainForm.MyMemo.Lines.Append(concat(tab(2), '</channel>'));
end; // procedure GetRed(Channel: integer);


{
*
* GetGreen(Y,X)
}
procedure GetGreen(Y, X: integer);
var
  ChannelOn, NeedClose: Boolean;
  OnTime, OffTime: integer;
  Intensity, LastIntensity: integer;
  Fr: Integer;
  Green: Integer;
  ES: string;
begin
  //
  LastIntensity := 0;
  Intensity := 0;
  OnTime := 0;
  OffTime := 0;

  for Fr := 0 to LastFrame do
    begin
    Green := GetGValue(SASequence[Y, X, Fr]);
    Intensity := Trunc((Green / 255)*100);
    if Intensity > 0 then
      begin
        ChannelOn := True;
        LastIntensity := Intensity;
        OnTime := (TimeHack * Fr);
        ES := concat(tab(3), '<effect type="intensity" startCentisecond="', IntToStr(OnTime));
      end
    else
      if intensity <> lastintensity then
        begin
          ChannelOn := False;
          OffTime := (TimeHack * Fr);
          ES := concat(ES, '" endCentisecond="',IntToStr(OffTime),'" intensity="',IntToStr(LastIntensity),'"/>');
          MainForm.MyMemo.Lines.Append(ES);
          ES := '';
          NeedClose := True;
          if Intensity > 0 then
            begin
              ChannelOn := True;
              OnTime := (TimeHack * Fr);
              LastIntensity := Intensity;
              ES := concat(tab(3), '<effect type="intensity" startCentisecond="', IntToStr(OnTime));
            end;
        end;
    end;
  if NeedClose then MainForm.MyMemo.Lines.Append(concat(tab(2), '</channel>'));
end; // procedure GetGreen(Channel: integer);


{
*
* GetBlue(Y,X)
}
procedure GetBlue(Y, X: integer);
var
  ChannelOn, NeedClose: Boolean;
  OnTime, OffTime: integer;
  Intensity, LastIntensity: integer;
  Fr: Integer;
  Blue: Integer;
  ES: string;
begin
  //
  LastIntensity := 0;
  Intensity := 0;
  OnTime := 0;
  OffTime := 0;

  for Fr := 0 to LastFrame do
    begin
    Blue := GetGValue(SASequence[Y, X, Fr]);
    Intensity := Trunc((Blue / 255)*100);
    if Intensity > 0 then
      begin
        ChannelOn := True;
        LastIntensity := Intensity;
        OnTime := (TimeHack * Fr);
        ES := concat(tab(3), '<effect type="intensity" startCentisecond="', IntToStr(OnTime));
      end
    else
      if intensity <> lastintensity then
        begin
          ChannelOn := False;
          OffTime := (TimeHack * Fr);
          ES := concat(ES, '" endCentisecond="',IntToStr(OffTime),'" intensity="',IntToStr(LastIntensity),'"/>');
          MainForm.MyMemo.Lines.Append(ES);
          ES := '';
          NeedClose := True;
          if Intensity > 0 then
            begin
              ChannelOn := True;
              OnTime := (TimeHack * Fr);
              LastIntensity := Intensity;
              ES := concat(tab(3), '<effect type="intensity" startCentisecond="', IntToStr(OnTime));
            end;
        end;
    end;
  if NeedClose then MainForm.MyMemo.Lines.Append(concat(tab(2), '</channel>'));
end; // procedure GetBlue(Channel: integer);


{
 *
 * DO XML Channels
 *
 * Takes care of outputting the individual as well as the RGB channels
 *to MainForm.MyMemo.Lines.
}
procedure DoXMLChannels;
var
  network: integer;
  circuit: integer;
  X: integer;
  Y: Integer;
begin
  //
    AniLength := (TimeHack*CurrentBuffer);
    if AniLength = 0 then AniLength := 6000;

    for Y := 0 to Rows - 1 do   // Step through LightArray
      for X := 0 to Cols - 1 do
        begin
          network := (ChannelArray[Y, X] div 512) + 1;
          circuit := (ChannelArray[Y, X] - ((network - 1)* 512));


          // Write the originating line for the red channel
          if circuit > 512 then begin network := network + 1; circuit := circuit - 512; end;
          Indexer := Indexer+1;
          // Third Level
          MainForm.MyMemo.Lines.Append(concat(tab(2),'<channel name="',IntToStr(Network),' ',IntToStr(circuit) ,
          '(R)" color="255" centiseconds="',IntToStr(AniLength),
          '" deviceType="DMX Universe" circuit="',IntToStr(circuit),
          '" network="',IntToStr(network),'" savedIndex="', InttoStr(Indexer), '"/>'));

          // Make a call to do the on/off times here
          GetRed(Y, X);


          // Write the originating line for the green channel
          circuit := circuit + 1;
          if circuit > 512 then begin network := network + 1; circuit := circuit - 512; end;
          Indexer := Indexer+1;
          // Third Level
          MainForm.MyMemo.Lines.Append(concat(tab(2),'<channel name="',IntToStr(Network),' ',IntToStr(circuit) ,
          '(G)" color="65280" centiseconds="',IntToStr(AniLength),
          '" deviceType="DMX Universe" circuit="',IntToStr(circuit),
          '" network="',IntToStr(network),'" savedIndex="', InttoStr(Indexer), '"/>'));

          // Make a call to do the on/off times here
          GetGreen(Y, X);
          // Third Level


          // Write the originating line for the blue channel
          circuit := circuit + 1;
          if circuit > 512 then begin network := network + 1; circuit := circuit - 512; end;
          Indexer := Indexer+1;
          // Third Level
          MainForm.MyMemo.Lines.Append(concat(tab(2),'<channel name="',IntToStr(Network),' ',IntToStr(circuit) ,
          '(B)" color="16711680" centiseconds="',IntToStr(AniLength),
          '" deviceType="DMX Universe" circuit="',IntToStr(circuit),
          '" network="',IntToStr(network),'" savedIndex="', InttoStr(Indexer), '"/>'));

          // Make a call to do the on/off times here
          GetBlue(Y, X);


          Indexer := Indexer + 1;
          // Third Level
          MainForm.MyMemo.Lines.Append(concat(tab(2),'<rgbChannel totalCentiseconds="',
          IntToStr(AniLength),'" name="RGB" savedIndex="',IntToStr(Indexer),'">'));

          // Add the RGB Index to our list of indexed channels
          MyList[MyListIndex] := Indexer;
          MyListIndex := MyListIndex + 1;
          if MyListIndex = MyListMax then begin MyListMax := MyListMax + 100; SetLength(MyList, MyListMax); end;


          // Forth Level
          MainForm.MyMemo.Lines.Append(concat(tab(3),'<channels>'));

          // Fifth Level
          MainForm.MyMemo.Lines.Append(concat(tab(4),'<channel savedIndex="',IntToStr(Indexer-3),'"/>'));
          MainForm.MyMemo.Lines.Append(concat(tab(4),'<channel savedIndex="',IntToStr(Indexer-2),'"/>'));
          MainForm.MyMemo.Lines.Append(concat(tab(4),'<channel savedIndex="',IntToStr(Indexer-1),'"/>'));

          // Forth Level
          MainForm.MyMemo.Lines.Append(concat(tab(3),'</channels>'));

          // Third Level
          MainForm.MyMemo.Lines.Append(concat(tab(2),'</rgbChannel>'));

      end;


end;      // end of procedure DoXMLChannels;



procedure DoXMLFooter;
var
  I: integer;
begin

	Mainform.MyMemo.Lines.Append(Concat(tab(1),'</channels>'));
	MainForm.MyMemo.Lines.Append(Concat(tab(1),'<timingGrids>'));
	MainForm.MyMemo.Lines.Append(concat(tab(2),'<timingGrid saveID="0" name="Fixed Grid: ',IntToStr(TimeHack),'" type="fixed" spacing="',IntToStr(TimeHack),'"/>'));
	MainForm.MyMemo.Lines.Append(concat(tab(1),'</timingGrids>'));
  // Second Level
	MainForm.MyMemo.Lines.Append(concat(tab(1),'<tracks>'));
  // Third Level
	MainForm.MyMemo.Lines.Append(concat(tab(2),'<track totalCentiseconds="',IntToStr(AniLength),'" timingGrid="0">'));
  // Forth level
	MainForm.MyMemo.Lines.Append(concat(tab(3),'<channels>'));
  // Fifth Level
  for I := 0 to MyListIndex - 1 do
      MainForm.MyMemo.Lines.Append(concat(tab(4),'<channel savedIndex="',IntToStr(MyList[I]),'"/>'));
  // Forth Level
	MainForm.MyMemo.Lines.Append(concat(tab(3),'</channels>'));
  // Forth Level
	MainForm.MyMemo.Lines.Append(concat(tab(3),'<loopLevels>'));
  // Fifth Level
	MainForm.MyMemo.Lines.Append(concat(tab(4),'<loopLevel/>'));
  // Forth Level
	MainForm.MyMemo.Lines.Append(concat(tab(3),'</loopLevels>'));
  // Third Level
	MainForm.MyMemo.Lines.Append(concat(tab(2),'</track>'));
  // Second Level
	MainForm.MyMemo.Lines.Append(concat(tab(1),'</tracks>'));
  // Second Level
	MainForm.MyMemo.Lines.Append(concat(tab(1),'<animation rows="40" columns="60" image=""/>'));
  // First Level
  MainForm.MyMemo.Lines.Append('</sequence>');



end;



procedure CreateXMLDoc(sequence_name: string);
begin
  //
  SetLength(MyList,100);
  MyListIndex := 0;
  MyListMax := 100;
  MainForm.MyMemo.Lines.Delete(0);
  Indexer := -1;      // Our "SavedIndex" for LOR's XML file
  DoXMLHeader;
  DoXMLChannels;
  DoXMLFooter;
  if not EndsText('.las', sequence_name) then sequence_name := concat(sequence_name, '.las');
  MainForm.MyMemo.Lines.SaveToFile(sequence_name);

  // Now we need our secondary file
  MainForm.MyMemo.Lines.Clear;

  MainForm.MyMemo.Lines.Append('<?xml version="1.0" encoding="UTF-8" standalone="no"?>');
  MainForm.MyMemo.Lines.Append('<sequenceEditorView version="1" animationCellSideLengthHidden="7" animationCellSideLengthShown="7" heightPerRow="24" hideAnimationControls="false" rowButtonWidth="0.85" viewRowButtons="true" widthPerCentisecond="2"/>');

  sequence_name := concat(sequence_name, '.lsv');
  MainForm.MyMemo.Lines.SaveToFile(sequence_name);

  MainForm.MyMemo.Lines.Clear;


end;    // end of procedure CreateXMLDoc


end.  // end of file
