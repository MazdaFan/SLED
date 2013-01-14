unit BUFFER;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, Dialogs;

type
  TBufferForm = class(TForm)
    ColorDialog1: TColorDialog;
    Shape1: TShape;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;
procedure CreateBuffer;
procedure FillBufferMatrix;
procedure FreeBufferMatrix;
procedure ShiftBufferUp;
procedure ShiftBufferDown;
procedure ShiftBufferLeft;
procedure ShiftBufferRight;


var
  BufferForm: TBufferForm;
  BufferMatrix: Array of array of TShape;

implementation

{$R *.dfm}

uses MAIN, MATRIX;

Procedure FreeBufferMatrix;
var
  X: Integer;
  Y: Integer;
begin

    // Step through the array of lights and free any previous instance.
      if Length(BufferMatrix) > 0 then

        begin
          for Y := 0 to Rows - 1 do
            for X := 0 to Cols -1 do
              begin
                  BufferMatrix[Y, X].Free;
                  BufferMatrix[Y, X] := nil;
              end;
         end;
end;

procedure FillBufferMatrix;
var
  Y: Integer;
  X: Integer;
begin
  //  Get rid of the old tshapes
  FreeBufferMatrix;
  SetLength(BufferMatrix, Rows, Cols);
  // Now lets start filling our grid

  for Y := 0 to Rows - 1 do
    for X := 0 to Cols - 1 do
      // We need to set all of the properties of each light
      begin
          BufferMatrix[Y, X] := TShape.Create(nil);
          BufferMatrix[Y, X].Width := ShapeSize;
          BufferMatrix[Y, X].Height := ShapeSize;
          BufferMatrix[Y, X].Shape := stCircle;
          BufferMatrix[Y, X].Brush.Color := clBlack;
          BufferMatrix[Y, X].Left := ((X*ShapeSize));
          BufferMatrix[Y, X].Top := ((Y*ShapeSize)+30);
          BufferMatrix[Y, X].DragKind := dkDrag;
          BufferMatrix[Y, X].OnMouseDown := EVHandler.ButtonClick;
          BufferMatrix[Y, X].Parent := BufferForm;
      end;
end;

procedure CreateBuffer;
begin
  //
  FreeBufferMatrix;
  FillBufferMatrix;
  BufferForm.Resize;   // Need to figure out how to make the form resize itself
end;

procedure ShiftBufferUp;
var
  y: Integer;
  X: Integer;
begin

    for y := 0 to Rows - 1 do
      for X := 0 to Cols - 1 do
        if Y < Rows-1 then // we haven't hit the last row yet
            BufferMatrix[Y, X].Brush.Color := BufferMatrix[Y+1, X].Brush.Color
          else
            BufferMatrix[Y,X].Brush.Color := clBlack;
end;

procedure ShiftBufferDown;
var
  y: Integer;
  x: Integer;
begin
  for y := Rows - 1 downto 0 do
    for x := 0 to Cols - 1 do
      if Y > 0 then
        BufferMatrix[Y, X].Brush.Color := BufferMatrix[Y-1, X].Brush.Color
      else
        BufferMatrix[Y,X].Brush.Color := clBlack;
end;

procedure ShiftBufferLeft;
var
  y: Integer;
  x: Integer;

begin
  for y := 0 to Rows - 1 do
    for x := 0 to Cols - 1 do
      if X < Cols - 1 then
        BufferMatrix[Y,X].Brush.Color := BufferMatrix[Y, X+1].Brush.Color
      else
        BufferMatrix[Y,X].Brush.Color := clBlack;
end;

procedure ShiftBufferRight;
var
  y: Integer;
  x: Integer;
begin
  for y := 0 to Rows - 1 do
    for x := Cols - 1 downto 0 do
      if X > 0 then
        BufferMatrix[Y, X].Brush.Color := BufferMatrix[Y, X-1].Brush.Color
      else
        BufferMatrix[Y,X].Brush.Color := clBlack;
end;

procedure TBufferForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [ssShift] then     // Catch Shifted Keystrokes
    begin
      //
    end
  else if Shift = [ssAlt] then       // Catch Alt Keypresses
    begin
      //
    end
  else if Shift = [ssCtrl] then   // Catch Ctrl Keypresses
    begin
        //
    end
  else                        // No Modifier
    begin
    case Key of
      VK_F2:;   // Place Holder - Does nothing
    else
      MainForm.FormKeyDown(Self, Key, Shift);
    end;
  end;
end;

end.
