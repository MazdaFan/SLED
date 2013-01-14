object BufferForm: TBufferForm
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Buffer'
  ClientHeight = 151
  ClientWidth = 241
  Color = clBtnFace
  Constraints.MinHeight = 189
  Constraints.MinWidth = 257
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
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
  end
  object ColorDialog1: TColorDialog
    Left = 392
    Top = 80
  end
end
