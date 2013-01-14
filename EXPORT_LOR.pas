unit EXPORT_LOR;
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

uses Windows, SysUtils, Graphics, StrUtils, Classes;


  procedure CreateXMLDoc(sequence_name: string);


var
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
    MainForm.MyMemo.Lines.Append(concat('<?xml version="1.0" encoding="UTF-8" standalone="no"?>'));
    MainForm.MyMemo.Lines.Append(concat('<sequence saveFileVersion="11" author="Smart LED" createdAt="', DateTimeToStr(Now) ,'">'));
    // 2nd Level
    MainForm.MyMemo.Lines.Append( concat(tab(1),'<channels>'));
end; // end of procedure DoXMLHeader;



{
*
*  GET RED(X,Y)
*
}
procedure GetRed(Y, X, Circuit: integer);
var
  NeedClose: Boolean;
  Fr: Integer;
  Red: Integer;
  LastRed: Integer;
  BS, ES: string;
  CString, NCString: String;
  network: integer;

begin

          if circuit > 512 then begin network := network + 1; circuit := circuit - 512; end;
          Indexer := Indexer+1;

          NCString := (concat(tab(2),'<channel name="',IntToStr(Network),' ',IntToStr(circuit) ,
          '(R)" color="255" centiseconds="',IntToStr(AniLength),
          '" deviceType="DMX Universe" circuit="',IntToStr(circuit),
          '" network="',IntToStr(network),'" savedIndex="', InttoStr(Indexer), '"/>'));

          CString := (concat(tab(2),'<channel name="',IntToStr(Network),' ',IntToStr(circuit) ,
          '(R)" color="255" centiseconds="',IntToStr(AniLength),
          '" deviceType="DMX Universe" circuit="',IntToStr(circuit),
          '" network="',IntToStr(network),'" savedIndex="', InttoStr(Indexer), '">'));


  MainForm.EffStrings.Clear;
  Fr := 0;
  LastRed := 0;
  Red := 0;
  NeedClose := False;
  while FR < LastFrame do
    begin
      Red := Trunc(((GetRValue(SASequence[Y,X,FR])/255)*100));
      if ((Red > 0) AND (Red = LastRed)) then  // Color Hasn't Changed
        FR := FR+1
      else
      if ((Red > 0) and (Red <> LastRed)) then // Still On, but color changed
        begin
          if LastRed = 0 then
            begin
          // start a new string
              NeedClose := True;
              BS := concat(tab(3), '<effect type="intensity" startCentisecond="', IntToStr((TimeHack*Fr)div 10));
              LastRed := Red;
          // increment FR
              FR := FR+1;
            end
          else
            begin
          // write an ending string
            ES := concat(BS, '" endCentisecond="',IntToStr((TimeHack*Fr)div 10),'" intensity="',IntToStr(LastRed),'"/>');
            MainForm.EffStrings.Lines.Add(ES);
          // start a new string
            ES := '';
            BS := '';
            BS := concat(tab(3), '<effect type="intensity" startCentisecond="', IntToStr((TimeHack*Fr)div 10));
          // Set LastRed to Red
            LastRed := Red;
          // Increment the frame
            Fr := Fr + 1;
            end;
        end
      else
      if ((Red = 0) AND (LastRed > 0)) then
        begin
        // Write an ending string
          ES := concat(BS, '" endCentisecond="',IntToStr((TimeHack*Fr)div 10),'" intensity="',IntToStr(LastRed),'"/>');
          MainForm.EffStrings.Lines.Add(ES);
          ES := '';
          BS := '';
        // Set LastRed to Red
          LastRed := Red;
        // Increment the Frame
          Fr := Fr + 1;
        end
      else
        FR := FR+1;
    end;
  if NeedClose then
    begin
    MainForm.MyMemo.Lines.Append(CString);
    MainForm.MyMemo.Lines.AddStrings(MainForm.EffStrings.Lines);
    MainForm.MyMemo.Lines.Append(concat(tab(2), '</channel>'));
    end
  else
    MainForm.MyMemo.Lines.Append(NCString);

end; // procedure GetRed(Channel: integer);


{
*
* GetGreen(Y,X)
}
procedure GetGreen(Y, X, Circuit: integer);
var
  NeedClose: Boolean;
  Fr: Integer;
  Green: Integer;
  LastRed: Integer;
  BS, ES: string;
  CString, NCString: String;
  network: integer;

begin

          if circuit > 512 then begin network := network + 1; circuit := circuit - 512; end;
          Indexer := Indexer+1;

          NCString := (concat(tab(2),'<channel name="',IntToStr(Network),' ',IntToStr(circuit) ,
          '(R)" color="65280" centiseconds="',IntToStr(AniLength),
          '" deviceType="DMX Universe" circuit="',IntToStr(circuit),
          '" network="',IntToStr(network),'" savedIndex="', InttoStr(Indexer), '"/>'));

          CString := (concat(tab(2),'<channel name="',IntToStr(Network),' ',IntToStr(circuit) ,
          '(R)" color="65280" centiseconds="',IntToStr(AniLength),
          '" deviceType="DMX Universe" circuit="',IntToStr(circuit),
          '" network="',IntToStr(network),'" savedIndex="', InttoStr(Indexer), '">'));


  MainForm.EffStrings.Clear;
  Fr := 0;
  LastRed := 0;
  Green := 0;
  NeedClose := False;
  while FR <= LastFrame do
    begin
      Green := Trunc(((GetGValue(SASequence[Y,X,FR])/255)*100));
      if ((Green > 0) AND (Green = LastRed)) then  // Color Hasn't Changed
        FR := FR+1
      else
      if ((Green > 0) and (Green <> LastRed)) then // Still On, but color changed
        begin
          if LastRed = 0 then
            begin
          // start a new string
              NeedClose := True;
              BS := concat(tab(3), '<effect type="intensity" startCentisecond="', IntToStr((TimeHack*Fr)div 10));
              LastRed := Green;
          // increment FR
              FR := FR+1;
            end
          else
            begin
          // write an ending string
            ES := concat(BS, '" endCentisecond="',IntToStr((TimeHack*Fr)div 10),'" intensity="',IntToStr(LastRed),'"/>');
            MainForm.EffStrings.Lines.Add(ES);
          // start a new string
            ES := '';
            BS := '';
            BS := concat(tab(3), '<effect type="intensity" startCentisecond="', IntToStr((TimeHack*Fr)div 10));
          // Set LastRed to Red
            LastRed := Green;
          // Increment the frame
            Fr := Fr + 1;
            end;
        end
      else
      if ((Green = 0) AND (LastRed > 0)) then
        begin
        // Write an ending string
          ES := concat(BS, '" endCentisecond="',IntToStr((TimeHack*Fr)div 10),'" intensity="',IntToStr(LastRed),'"/>');
          MainForm.EffStrings.Lines.Add(ES);
          ES := '';
          BS := '';
        // Set LastRed to Red
          LastRed := Green;
        // Increment the Frame
          Fr := Fr + 1;
        end
      else
        FR := FR+1;
    end;
  if NeedClose then
    begin
    MainForm.MyMemo.Lines.Append(CString);
    MainForm.MyMemo.Lines.AddStrings(MainForm.EffStrings.Lines);
    MainForm.MyMemo.Lines.Append(concat(tab(2), '</channel>'));
    end
  else
    MainForm.MyMemo.Lines.Append(NCString);

end; // procedure GetGreen(Channel: integer);


{
*
* GetBlue(Y,X)
}
procedure GetBlue(Y, X, Circuit: integer);
var
  NeedClose: Boolean;
  Fr: Integer;
  Blue: Integer;
  LastRed: Integer;
  BS, ES: string;
  CString, NCString: String;
  network: integer;

begin

          if circuit > 512 then begin network := network + 1; circuit := circuit - 512; end;
          Indexer := Indexer+1;

          NCString := (concat(tab(2),'<channel name="',IntToStr(Network),' ',IntToStr(circuit) ,
          '(R)" color="16711680" centiseconds="',IntToStr(AniLength),
          '" deviceType="DMX Universe" circuit="',IntToStr(circuit),
          '" network="',IntToStr(network),'" savedIndex="', InttoStr(Indexer), '"/>'));

          CString := (concat(tab(2),'<channel name="',IntToStr(Network),' ',IntToStr(circuit) ,
          '(R)" color="16711680" centiseconds="',IntToStr(AniLength),
          '" deviceType="DMX Universe" circuit="',IntToStr(circuit),
          '" network="',IntToStr(network),'" savedIndex="', InttoStr(Indexer), '">'));


  MainForm.EffStrings.Clear;
  Fr := 0;
  LastRed := 0;
  Blue := 0;
  NeedClose := False;
  while FR <= LastFrame do
    begin
      Blue := Trunc(((GetBValue(SASequence[Y,X,FR])/255)*100));
      if ((Blue > 0) AND (Blue = LastRed)) then  // Color Hasn't Changed
        FR := FR+1
      else
      if ((Blue > 0) and (Blue <> LastRed)) then // Still On, but color changed
        begin
          if LastRed = 0 then
            begin
          // start a new string
              NeedClose := True;
              BS := concat(tab(3), '<effect type="intensity" startCentisecond="', IntToStr((TimeHack*Fr)div 10));
              LastRed := Blue;
          // increment FR
              FR := FR+1;
            end
          else
            begin
          // write an ending string
            ES := concat(BS, '" endCentisecond="',IntToStr((TimeHack*Fr)div 10),'" intensity="',IntToStr(LastRed),'"/>');
            MainForm.EffStrings.Lines.Add(ES);
          // start a new string
            ES := '';
            BS := '';
            BS := concat(tab(3), '<effect type="intensity" startCentisecond="', IntToStr((TimeHack*Fr)div 10));
          // Set LastRed to Red
            LastRed := Blue;
          // Increment the frame
            Fr := Fr + 1;
            end;
        end
      else
      if ((Blue = 0) AND (LastRed > 0)) then
        begin
        // Write an ending string
          ES := concat(BS, '" endCentisecond="',IntToStr((TimeHack*Fr)div 10),'" intensity="',IntToStr(LastRed),'"/>');
          MainForm.EffStrings.Lines.Add(ES);
          ES := '';
          BS := '';
        // Set LastRed to Red
          LastRed := Blue;
        // Increment the Frame
          Fr := Fr + 1;
        end
      else
        FR := FR+1;
    end;
  if NeedClose then
    begin
    MainForm.MyMemo.Lines.Append(CString);
    MainForm.MyMemo.Lines.AddStrings(MainForm.EffStrings.Lines);
    MainForm.MyMemo.Lines.Append(concat(tab(2), '</channel>'));
    end
  else
    MainForm.MyMemo.Lines.Append(NCString);
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

          GetRed(Y, X, Circuit);
          GetGreen(Y, X, Circuit);
          GetBlue(Y, X, Circuit);


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
	MainForm.MyMemo.Lines.Append(concat(tab(2),'<timingGrid saveID="0" name="Fixed Grid: ',FloatToStr(TimeHack/100),'" type="fixed" spacing="',IntToStr(TimeHack div 10),'"/>'));
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
