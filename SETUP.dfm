object SetupForm: TSetupForm
  Left = 0
  Top = 0
  Caption = 'Set Up Your Lights'
  ClientHeight = 405
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 285
    Width = 26
    Height = 13
    Caption = 'Rows'
  end
  object Label2: TLabel
    Left = 104
    Top = 285
    Width = 40
    Height = 13
    Caption = 'Columns'
  end
  object Label3: TLabel
    Left = 8
    Top = 216
    Width = 42
    Height = 13
    Caption = 'Universe'
  end
  object Label4: TLabel
    Left = 104
    Top = 216
    Width = 80
    Height = 13
    Caption = 'Starting Channel'
  end
  object Label5: TLabel
    Left = 8
    Top = 170
    Width = 53
    Height = 13
    Caption = 'Other Time'
    Enabled = False
  end
  object bCancel: TButton
    Left = 8
    Top = 344
    Width = 81
    Height = 25
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = bCancelClick
  end
  object bOK: TButton
    Left = 104
    Top = 344
    Width = 80
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 6
    OnClick = bOKClick
  end
  object RadioGroup2: TRadioGroup
    Left = 8
    Top = 8
    Width = 81
    Height = 65
    Caption = 'Lights Go'
    ItemIndex = 1
    Items.Strings = (
      'L to R'
      'L to R to L')
    TabOrder = 0
  end
  object seUniverse: TSpinEdit
    Left = 8
    Top = 240
    Width = 81
    Height = 22
    MaxValue = 512
    MinValue = 1
    TabOrder = 1
    Value = 1
  end
  object seChannel: TSpinEdit
    Left = 104
    Top = 240
    Width = 81
    Height = 22
    MaxValue = 512
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
  object seRows: TSpinEdit
    Left = 8
    Top = 304
    Width = 81
    Height = 22
    MaxValue = 512
    MinValue = 1
    TabOrder = 3
    Value = 1
  end
  object seCols: TSpinEdit
    Left = 104
    Top = 304
    Width = 81
    Height = 22
    MaxValue = 512
    MinValue = 1
    TabOrder = 4
    Value = 1
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 79
    Width = 177
    Height = 82
    Caption = 'Time per Frame'
    Columns = 2
    ItemIndex = 4
    Items.Strings = (
      '1 Sec'
      '.5 Sec'
      '.25 Sec'
      '.1 Sec'
      '.05 Sec'
      'Other')
    TabOrder = 7
    OnClick = RadioGroup1Click
  end
  object Edit1: TEdit
    Left = 75
    Top = 167
    Width = 69
    Height = 21
    Enabled = False
    TabOrder = 8
    Text = '0.025'
  end
end
