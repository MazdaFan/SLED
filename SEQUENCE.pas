unit SEQUENCE;
{
* FILENAME: Sequence.pas
* Date Created: 1/5/2013
* Created By: Jamie Tomlinson (JRT)
*
* Purpose:
*
* Uses:
*   Main.pas
*   Matrix.pas
*
* Procedures/Functions:
*   procedure CreateTrack;
*   procedure CaptureFrame;
*   procedure BackupFrame;
*   procedure ForwardFrame;
*   procedure PlaySequence;
*   procedure DeleteFrame;
*   procedure InsertFrame;
*
* Variables: None
*
* Changes:
}
interface

uses  SysUtils, Graphics;

  procedure CreateTrack;
  procedure CaptureFrame;
  procedure BackupFrame;
  procedure ForwardFrame;
  procedure PlaySequence;
  procedure DeleteFrame;
  procedure InsertFrame;

implementation

uses MAIN, MATRIX;

procedure CreateTrack;
begin
  // set the initial length of our sequence to 100 frames
  CurrentBuffer := AddFrames;
  SetLength(SASequence, Rows, Cols, CurrentBuffer);
  Frame := 0;
end;


{
  CAPTURE FRAME
  This procedure allows us to capture a frame of animation to our sequence array.
  It uses the frame variable to keep track of time in the animation.
  Simply put, it transfers all the colors currently showing to the sequency array
  allowing for playback at a later date, or for saving to a file.

  What would be required to output this to an XML file that could be read by
  existing sequencing software?

  Colors are saved as integers representing the current color of the existing shape.
  These integer colors are representative of using 6 digit HEX code to represent colors.
  $FF = 255 = Red
  $FF00 = 65280 = Green
  $FF0000 = 16711680 = Blue
  $FFFFFF = 16777215 = White
  $000000 = 0 = Black

  According to TColor, there can be a fourth HEX pair to represent a pallete.
}
procedure CaptureFrame;
var
  X: Integer;
  Y: Integer;
begin
  // REWORK
  for Y := 0 to Rows -1 do
    for X := 0 to Cols - 1 do
        SASequence[Y, X, Frame] := LightMatrix[Y, X].Brush.Color;

  Frame := Frame + 1;
  if Frame > LastFrame then LastFrame := LastFrame + 1;  // This should allow us to step through without changing
                                                         // our end marker

  MainForm.Label2.Caption := IntToStr(Frame);   // display our current frame

  if Frame = CurrentBuffer then    // Hit the end of our buffer
    begin
      CurrentBuffer := CurrentBuffer + AddFrames;
      SetLength(SASequence, Rows, Cols, CurrentBuffer);   // Add more buffer
    end;

end;



{
  BACK UP FRAME
  This procedure simply steps backwards in time by one animation frame and redraws the matrix
  This procedure actually changes the value of the frame variable, so it is pointing to a previous
  instant in time in the animation.  Any changes made and captured result in the sequence array being
  altered.  An added benefit is that the post point in time sequence is NOT changed, so we could actually
  step forward in time, but we would need a variable to represent the previous (before stepping back) last
  frame so we wouldn't overshoot the end of the sequence array.
}
procedure BackupFrame;
var
  X: Integer;
  Y: Integer;
begin

  // If we aren't at the beginning of our sequence then we can step backwards
  if Frame > 0 then
    begin
      Frame := Frame - 1;
      // and reload that "animation" into the light matrix.  Repaint to be able to see the changes.
      for Y := 0 to Rows - 1 do
      for X := 0 to Cols - 1 do
        begin
          LightMatrix[Y, X].Brush.Color := SASequence[Y, X, Frame];
          MainForm.Label2.Caption := IntToStr(Frame);
          LightMatrix[Y, X].Repaint;
        end;
    end;

end;

{
  FORWARD FRAME
  Allows us to step forward through our animation
}

procedure ForwardFrame;
var
  X: Integer;
  Y: Integer;
begin
  // REWORK
  // If we aren't at the end of our sequence, we can step forwards
  if Frame < LastFrame then
    begin
      Frame := Frame + 1;
      // and reload that "animation" into the light matrix.  Repaint to be able to see the changes.
      for Y := 0 to Rows - 1 do
      for X := 0 to Cols - 1 do
        begin
          LightMatrix[Y, X].Brush.Color := SASequence[Y, X, Frame];
          MainForm.Label2.Caption := IntToStr(Frame);
          LightMatrix[Y, X].Repaint;
        end;
    end;
end;


{
  PLAY SEQUENCE
  Allows a person to replay a sequence that he has created.  Simply loads
  the color from the sequence array and places it into each shape.  It uses the FRAME
  variable to keep track of where we are in the array for "time".
}
procedure PlaySequence;
var
  x, y, Z: integer;
begin

  for Z := 0 to LastFrame do       // Time in frames
    begin
    for y := 0 to Rows - 1 do
      for x := 0 to Cols - 1 do
        begin
          LightMatrix[Y, X].Brush.Color := SASequence[y, x, z];
          LightMatrix[Y, X].Repaint;
      end;
    end;
end;

procedure DeleteFrame;
begin
  //
end;

procedure InsertFrame;
begin
  //
end;

end.
