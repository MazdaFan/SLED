unit MATRIX;
{
* FILENAME: Matrix.pas
* Date Created: 1/5/2013
* Created By: Jamie Tomlinson (JRT)
*
* Purpose:
*
* Uses: Main.pas
*       Setup.pas
*
* Procedures/Functions:
*   procedure FreeLights;
*   procedure FillShapeArray;
*   procedure ShiftUp;
*   procedure ShiftDown;
*   procedure ShiftRight;
*   procedure ShiftLeft;
*
* Variables:
*  EvHandler:TEventHandlers;
*
* Changes:
}
interface

uses Classes, Graphics, Controls, ExtCtrls, SysUtils;

type
   TEventHandlers = class // create a dummy class
       procedure ButtonClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   end;

  procedure FreeLightMatrix;
  procedure FillLightMatrix;
  procedure FillChannels;
  procedure ShiftUp;
  procedure ShiftDown;
  procedure ShiftRight;
  procedure ShiftLeft;

const
  ShapeSize = 15;

var
  EvHandler:TEventHandlers;

implementation

uses MAIN, Setup, BUFFER;

Procedure FreeLightMatrix;
var
  X: Integer;
  Y: Integer;
begin

    // Step through the array of lights and free any previous instance.
      if Length(LightMatrix) > 0 then

        begin
          for Y := 0 to Rows - 1 do
            for X := 0 to Cols -1 do
              begin
                  LightMatrix[Y, X].Free;
                  LightMatrix[Y, X] := nil;
              end;
         end;
end;

// Generic procedure for when the mouse is clicked on a light shape
procedure TEventHandlers.ButtonClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  begin
  // if the object that sent the click was a shape
  if Sender is TShape then
  begin
  with Sender as TShape do
  begin
  // Put if statements to catch Shift, Alt and Control here
    if Shift = [ssShift] then     // Catch Shifted Keystrokes
      begin
        if Button = mbLeft then
          begin
            //
          end
        else
          begin
            //
          end;
      end
    else if Shift = [ssAlt] then       // Catch Alt Keypresses
      begin
        if Button = mbLeft then
          begin
            //
          end
        else
          begin
            //
          end;
      end
    else if Shift = [ssCtrl] then   // Catch Ctrl Keypresses
      begin
        if Button = mbLeft then
          begin
            //  If we have a Ctrl Left Click, then change the current color to what is clicked.
            CurrentColor := Brush.Color;
          end
        else
          begin
            //
          end;
      end
    else                        // No Modifier
      begin
        if Button = mbLeft then
          begin
            // Set its color to the current color and refresh it
            Brush.Color := CurrentColor;
            Refresh;
            // MainForm.Label2.Caption := IntToStr(Tag);         // Debug to check channels in the shapes.tag
          end
        else
          begin
            Brush.Color := clBlack;
            Refresh;
          end;
      end;
    end;
  end;
end;


{
  FILL SHAPE ARRAY
  This procedure dynamically creates our shapes (lights) and forms them
  into a matrix described by the variables Cols and Rows.  The shapes have a
  parent set to "nil", so they must be free'd manually.  Closing the form without
  freeing the shapes will result in a HUGE memory leak, therefore the FORMCLOSE
  call has FREELIGHTS, which will destroy each shape, and free its memory.
}
procedure FillLightMatrix;
var
  Y: Integer;
  X: Integer;
begin
  //  Get rid of the old tshapes
  FreeLightMatrix;
  SetLength(LightMatrix, Rows, Cols);
  // Now lets start filling our grid

  for Y := 0 to Rows - 1 do
    for X := 0 to Cols - 1 do
      // We need to set all of the properties of each light
      begin
          LightMatrix[Y, X] := TShape.Create(nil);
          LightMatrix[Y, X].Width := ShapeSize;
          LightMatrix[Y, X].Height := ShapeSize;
          LightMatrix[Y, X].Shape := stCircle;
          LightMatrix[Y, X].Brush.Color := clBlack;
          LightMatrix[Y, X].Left := ((X*ShapeSize)+100);
          LightMatrix[Y, X].Top := ((Y*ShapeSize)+100);
          LightMatrix[Y, X].DragKind := dkDrag;
          LightMatrix[Y, X].OnMouseDown := EVHandler.ButtonClick;
          LightMatrix[Y, X].Parent := MainForm;
      end;
end;





procedure FillChannels;
var
X: Integer;
Y: Integer;
Channel: integer;
begin
  Channel := StartChannel;
      if IsLRL then
        begin
          for Y := 0 to Rows - 1 do
            if Y+1 mod 2 = 1 then   // even row
              begin
                for X := Cols - 1 downto 0 do
                  ChannelArray[Y, X] := Channel;
                  Channel := Channel + 1;
              end
            else   // Odd Row
              begin
                for X := 0 to Cols - 1 do
                  begin
                    ChannelArray[Y, X] := Channel;
                    Channel := Channel + 1;
                  end;
              end;
        end
      else
        begin
          for Y := 0 to Rows - 1 do
            for X := 0 to Cols - 1 do
              begin
                ChannelArray[Y, X] := Channel;
                Channel := Channel + 1;
              end;
        end;


end;

{
********************************************************************************
*
*  SHIFTUP
*
*  Moves each color one row up.  If its the last row (bottom row) sets it
*  the color of the top of the buffer row.
*
********************************************************************************
}

procedure ShiftUp;
var
  y: Integer;
  X: Integer;
begin

    for y := 0 to Rows - 1 do
      for X := 0 to Cols - 1 do
        if Y < Rows-1 then // we haven't hit the last row yet
            LightMatrix[Y, X].Brush.Color := LightMatrix[Y+1, X].Brush.Color
          else
            LightMatrix[Y,X].Brush.Color := BufferMatrix[0, X].Brush.Color;

    ShiftBufferUp;
end; // ShiftUp


{
********************************************************************************
*
*  SHIFTDOWN
*
*  Moves each color one space down in the matrix.  Sets the top items (X+1 < Columns) to black
*
********************************************************************************
}
procedure ShiftDown;
var
  y: Integer;
  x: Integer;
begin
  for y := Rows - 1 downto 0 do
    for x := 0 to Cols - 1 do
      if Y > 0 then
        LightMatrix[Y, X].Brush.Color := LightMatrix[Y-1, X].Brush.Color
      else
        LightMatrix[Y,X].Brush.Color := BufferMatrix[Rows-1, X].Brush.Color;

  ShiftBufferDown;

end;


{
   SHIFTRIGHT
   Moves each color one space to the right.  Sets the far left items to black.
}
procedure ShiftRight;
var
  y: Integer;
  x: Integer;
begin
  for y := 0 to Rows - 1 do
    for x := Cols - 1 downto 0 do
      if X > 0 then
        LightMatrix[Y, X].Brush.Color := LightMatrix[Y, X-1].Brush.Color
      else
        LightMatrix[Y,X].Brush.Color := BufferMatrix[Y, Cols-1].Brush.Color;

  ShiftBufferRight;
end;




{
  SHIFTLEFT
  Moves each color one space to the left.  Sets the far right items to black.
}
procedure ShiftLeft;
var
  y: Integer;
  x: Integer;

begin
  for y := 0 to Rows - 1 do
    for x := 0 to Cols - 1 do
      if X < Cols - 1 then
        LightMatrix[Y,X].Brush.Color := LightMatrix[Y, X+1].Brush.Color
      else
        LightMatrix[Y,X].Brush.Color := BufferMatrix[Y, 0].Brush.Color;

  ShiftBufferLeft;
end;

end.
