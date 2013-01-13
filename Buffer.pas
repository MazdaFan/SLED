unit BUFFER;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, Dialogs;

type
  TBufferForm = class(TForm)
    ColorDialog1: TColorDialog;
    Shape1: TShape;
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
          BufferMatrix[Y, X].Left := ((X*ShapeSize)+100);
          BufferMatrix[Y, X].Top := ((Y*ShapeSize)+100);
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
end;

procedure ShiftBufferUp;
var
  y: Integer;
  X: Integer;
begin

    for y := 0 to Rows - 1 do
      for X := 0 to Cols - 1 do
        if Y < Rows-2 then // we haven't hit the last row yet
            BufferMatrix[Y, X].Brush.Color := LightMatrix[Y+1, X].Brush.Color
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

end.
