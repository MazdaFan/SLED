object BufferForm: TBufferForm
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Buffer'
  ClientHeight = 151
  ClientWidth = 242
  Color = clBtnFace
  Constraints.MinHeight = 178
  Constraints.MinWidth = 249
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnMouseUp = FormMouseUp
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 25
    Height = 25
    OnMouseDown = Shape1MouseDown
  end
  object Shape2: TShape
    Left = 31
    Top = 0
    Width = 25
    Height = 25
    OnMouseDown = Shape1MouseDown
  end
  object Shape3: TShape
    Left = 62
    Top = 0
    Width = 25
    Height = 25
    OnMouseDown = Shape1MouseDown
  end
  object Shape4: TShape
    Left = 93
    Top = 0
    Width = 25
    Height = 25
    OnMouseDown = Shape1MouseDown
  end
  object Shape5: TShape
    Left = 124
    Top = 0
    Width = 25
    Height = 25
    OnMouseDown = Shape1MouseDown
  end
  object Shape6: TShape
    Left = 155
    Top = 0
    Width = 25
    Height = 25
    OnMouseDown = Shape1MouseDown
  end
  object Shape7: TShape
    Left = 186
    Top = 0
    Width = 25
    Height = 25
    OnMouseDown = Shape1MouseDown
  end
  object Shape8: TShape
    Left = 217
    Top = 0
    Width = 25
    Height = 25
    OnMouseDown = Shape1MouseDown
  end
  object ColorDialog1: TColorDialog
    Left = 392
    Top = 80
  end
end
