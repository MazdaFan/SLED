object MainForm: TMainForm
  Left = 197
  Top = 111
  HelpType = htKeyword
  HelpKeyword = 'MainForm'
  AutoSize = True
  Caption = 'Smart LED Animator'
  ClientHeight = 554
  ClientWidth = 994
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 640
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  HelpFile = 'SLED.chm'
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnMouseUp = FormMouseUp
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 880
    Top = 35
    Width = 45
    Height = 16
    AutoSize = False
    Caption = 'Frame:'
  end
  object Label2: TLabel
    Left = 931
    Top = 35
    Width = 8
    Height = 16
    AutoSize = False
    Caption = '0'
  end
  object Label3: TLabel
    Left = 931
    Top = 57
    Width = 48
    Height = 16
    AutoSize = False
    Caption = '0:00.00'
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 535
    Width = 994
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    AutoHint = True
    Panels = <>
    SimplePanel = True
  end
  object MyMemo: TMemo
    Left = 8
    Top = 491
    Width = 17
    Height = 16
    ParentCustomHint = False
    TabStop = False
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Ctl3D = True
    DoubleBuffered = True
    Lines.Strings = (
      '')
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    Visible = False
    WantReturns = False
    WantTabs = True
    WordWrap = False
  end
  object EffStrings: TMemo
    Left = 31
    Top = 491
    Width = 17
    Height = 16
    ParentCustomHint = False
    TabStop = False
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Ctl3D = True
    DoubleBuffered = True
    Lines.Strings = (
      '')
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    Visible = False
    WantReturns = False
    WantTabs = True
    WordWrap = False
  end
  object MediaPlayer1: TMediaPlayer
    Left = 712
    Top = 47
    Width = 141
    Height = 30
    ColoredButtons = [btPlay, btPause, btStop, btStep, btBack]
    EnabledButtons = [btPlay, btPause, btStop, btStep, btBack]
    VisibleButtons = [btPlay, btPause, btStop, btStep, btBack]
    TabOrder = 3
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 513
    Width = 994
    Height = 17
    DoubleBuffered = False
    ParentDoubleBuffered = False
    Smooth = True
    Style = pbstMarquee
    SmoothReverse = True
    TabOrder = 4
  end
  object StaticText1: TStaticText
    Left = 885
    Top = 57
    Width = 40
    Height = 20
    AutoSize = False
    Caption = 'Time:'
    TabOrder = 5
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 994
    Height = 29
    Caption = 'ToolBar1'
    Images = ImageList1
    TabOrder = 6
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'New'
      ImageIndex = 4
      MenuItem = New1
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Caption = 'Sequence'
      ImageIndex = 2
      MenuItem = OpenSequence1
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 0
      Caption = 'Sequence'
      ImageIndex = 3
      MenuItem = SaveSequence1
    end
    object ToolButton4: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 77
      Top = 0
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      Caption = '&Copy'
      ImageIndex = 0
      MenuItem = CopyItem
    end
    object ToolButton6: TToolButton
      Left = 100
      Top = 0
      Hint = 'Paste|Inserts Clipboard contents'
      Caption = '&Paste'
      ImageIndex = 5
      MenuItem = PasteItem
    end
  end
  object MainMenu1: TMainMenu
    Left = 776
    Top = 504
    object File1: TMenuItem
      Caption = '&File'
      Hint = 'File related commands'
      object New1: TMenuItem
        Caption = 'New'
        ImageIndex = 4
        OnClick = New1Click
      end
      object FileNewItem: TMenuItem
        Caption = 'Open'
        Hint = 'Open|Open a file'
        ImageIndex = 7
        object OpenSequence1: TMenuItem
          Caption = 'Sequence'
          ImageIndex = 2
          OnClick = OpenSequence1Click
        end
        object OpenTemplate1: TMenuItem
          Caption = 'Template'
          OnClick = OpenTemplate1Click
        end
        object Audio1: TMenuItem
          Caption = 'Audio'
          OnClick = Audio1Click
        end
      end
      object FileSaveItem: TMenuItem
        Caption = '&Save'
        Hint = 'Save|Save current file'
        ImageIndex = 8
        object SaveSequence1: TMenuItem
          Caption = 'Sequence'
          ImageIndex = 3
          OnClick = SaveSequence1Click
        end
        object SaveTemplate1: TMenuItem
          Caption = 'Template'
        end
      end
      object FileSaveAsItem1: TMenuItem
        Caption = 'Save As...'
        Hint = 'Save As|Save current file with different name'
      end
      object Play1: TMenuItem
        Caption = 'Play'
        OnClick = Play1Click
      end
      object ExportSequence1: TMenuItem
        Caption = 'Export Sequence'
        object AsLORS31: TMenuItem
          Caption = 'As LOR S3'
          OnClick = AsLORS31Click
        end
        object AsVixen1: TMenuItem
          Caption = 'As Vixen'
          Enabled = False
          OnClick = AsVixen1Click
        end
        object AsLSP1: TMenuItem
          Caption = 'As LSP'
          Enabled = False
          OnClick = AsLSP1Click
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object FileExitItem: TMenuItem
        Caption = 'E&xit'
        Hint = 'Exit|Exit application'
        OnClick = FileExit1Execute
      end
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      Hint = 'Edit commands'
      object CutItem: TMenuItem
        Caption = 'Cu&t'
        Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
        ImageIndex = 0
        ShortCut = 16472
      end
      object CopyItem: TMenuItem
        Caption = '&Copy'
        Hint = 'Copy|Copies the selection and puts it on the Clipboard'
        ImageIndex = 0
        ShortCut = 16451
      end
      object PasteItem: TMenuItem
        Caption = '&Paste'
        Hint = 'Paste|Inserts Clipboard contents'
        ImageIndex = 5
        ShortCut = 16470
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      Hint = 'Help topics'
      object HelpAboutItem: TMenuItem
        Caption = '&About...'
        Hint = 
          'About|Displays program information, version number, and copyrigh' +
          't'
        OnClick = HelpAbout1Execute
      end
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'All Files (*.*)|*.*|MP3 Files (*.mp3)|*.mp3'
    Title = 'Open SLED Sequence'
    Left = 832
    Top = 504
  end
  object SaveDialog: TSaveDialog
    Filter = 'SLED Files (*.sas)|*.sas|All Files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save SLED Sequence'
    Left = 896
    Top = 504
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 720
    Top = 504
  end
  object ImageList1: TImageList
    Left = 664
    Top = 504
    Bitmap = {
      494C010108000C00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000055555503808080448585
      885E8686865D8686865D8686865D8686865D8686865D7A827D60307C45861F86
      40932F7D45896C7A704940404004000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000055555503808080448585
      885E8686865D8181815D7979795D7679795D6868685D6868685D6565655D6565
      655D6767675E6464644540404004000000000000000000000000000000000000
      0000000000010000871100008B1600008B1600008B1600008B1600008C140000
      8004000000000000000000000000000000000000000071717112B9BABAC9C5C6
      C7FAC5C6C7F7C5C6C7F7C5C6C7F7C5C6C7F7C8C7C9F7BCBFBDF83D9E63FD0AA0
      4CFF3B9E62FFAAAFAACA80808012000000000000000000000000000000000000
      00000000000098989848A2A2A57CA3A3A37AA3A3A37AA3A3A37AA3A3A37AA3A3
      A37AA3A3A37AA2A2A57C9A9A9A4E000000010000000071717112B9BABAC9C5C6
      C7FAC6C7C8F7A8A8A9F7848484F7858686F7797979F7858686F79E9F9FF79A9A
      9BF7808181FA79797AC963636312000000000000000000000000000000000000
      00001D1DAB462A2AC1C42929C6D12828C7D02828C7D02929C7D12A2AC5CE2424
      B36B000080040000000000000000000000000000000080808014C4C4C5D2D1D1
      D2FFD0D1D2FFD0D1D2FFD0D1D2FFCBCDCDFF99B5A1FF7FAF8FFF2DAE62FF06B8
      55FF2DAC62FF6EA380E62F7C44610055000600000000404040043333330A3939
      39091717170BB9B9BAA7CCCCCDFFCCCCCDFFCCCCCDFFCCCCCDFFCCCCCDFFCCCC
      CDFFCCCCCDFFCCCDCDFFBFBFBFAE404040040000000080808014C4C4C5D2D0D1
      D2FFCDCECFFF9A9A9BFF797979FF767676FF818181FFBABBBBFFCFD0D1FFCFD0
      D1FFAFAFAFFF7E7E80D266737314000000000000000000000000000000001E1E
      A9442B2BC8DD0F0FD6FF0606D7FF0606D8FF0606D9FF0606DAFF0A0ADBFF2626
      D2F12626B36C0000550300000000000000000000000080808014C7C8C8D2D5D5
      D6FFD4D5D6FFD4D5D6FFD5D5D6FFC9CDCAFF5EAA7AFF33B86DFF1DC668FF0FCC
      63FF0FBD5CFF10A652FF1E8E49CD1B5E1B1300000001ADADAF76B7B7B8BFB7B7
      B8BCB3B5B5BDBFBFC0E7D1D1D2FFCCCCCDFFCCCCCDFFCCCCCDFFCCCCCDFFCCCC
      CDFFCFCFD0FFD2D2D3FFC4C4C6AE404040040000000080808014C8C8CAD2D2D2
      D3FFCACBCBFFBFBFBFFF9A9A9AFF747475FF929293FFCACBCBFFCCCCCDFFCFD0
      D0FFCCCCCDFF8E8F8FD2666666140000000000000000000000001F1FAA422B2B
      C5DC0C0CD1FF0000D0FF0000D1FF0000D2FF0000D3FF0000D3FF0000D4FF0505
      D6FF2626CFF12626B26A00005503000000000000000080808014CBCBCCD2D9D9
      DAFFD9D9DAFFD9D9DAFFD9D9DAFFCCD0CDFF64AD7FFF49BF7DFF41CF80FF34D3
      7BFF2AC36EFF22AC5EFF279250CD1B5E1B1300000003C3C3C4A9CDCECFFFCACB
      CCFFC8C8C9FFC8C8C9FFD6D6D7FFD1D1D2FFD1D1D2FFD1D1D2FFD1D1D2FFD1D1
      D2FFD2D2D3FFD7D7D8FFC9C9CAAE404040040000000080808014CBCBCCD2D7D7
      D8FFCFCFD0FF9F9F9FFF7F7F7FFF767676FF8F8F90FFCFCFCFFFD3D3D4FFD5D5
      D6FFC9C9CAFF8A8A8AD26666661400000000000000001C1CAA3F2A2AC2DB0C0C
      CCFF0000CAFF3434D6FF2A2AD5FF0000CDFF0000CEFF1717D3FF4242DDFF0404
      D1FF0505D3FF2626CCF02626B466000080020000000080808014CECECED2DDDD
      DEFFDDDDDEFFDDDDDEFFDDDDDEFFD7D9D8FFA5BFACFF8FB99CFF55B97DFF3EC6
      7BFF4CB577FF78AA88E6347D49620049000700000003C9C9C9A9D1D1D2FFCBCB
      CCFFC9C9C9FFCBCBCCFFD8D8D9FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFD0D0
      D0FFD3D3D4FFDADADBFFCDCDCFAE404040040000000080808014CECED0D2D8D8
      D9FFCECECFFF9A9A9AFF787878FF7D7D7DFF79797AFFA2A2A2FFC5C5C6FFC4C4
      C5FF9B9B9BFF7E7E7ED27373731400000000000080083F3FC0B31D1DCAFF0000
      C5FF3434D2FFDBDBF7FFCACAF4FF2C2CD2FF1313CDFFA4A4ECFFEFEFFCFF5D5D
      DFFF0000CDFF0606CFFF2B2BC7DC1C1C9F250000000080808014D2D2D3D2E1E1
      E2FFE1E1E2FFE1E1E2FFE0E0E1FFE1E1E2FFE3E2E4FFD5D8D5FF62AE7EFF41B4
      74FF5AAC79FFC0C5C0D2998C8C140000000000000003CCCCCCA9D8D8D9FFD3D3
      D4FFD1D1D2FFD0D0D1FFDFDFE0FFD8D8D9FFD8D8D9FFD8D8D9FFD8D8D9FFD9D9
      D9FFDADADBFFE0E0E1FFD2D2D2AE404040040000000080808014D2D2D3D2DDDD
      DEFFD4D4D5FFC1C1C2FFB5B5B6FF9B9B9BFF777777FF787878FF828282FF8080
      81FF7A7A7AFF7E7E80D2737373140000000000008B0B4D4DC6BF3E3ED1FF2323
      CAFF3838D0FFCDCDF3FFFFFFFFFFC9C9F3FFB2B2EEFFFEFEFEFFE5E5F9FF4D4D
      D8FF0000C8FF0000CAFF2626C7E52222A42D00000000808C8C14D5D5D6D2E5E5
      E6FFE5E5E6FFE5E5E6FFE5E5E6FFE5E5E6FFE5E5E6FFDEE0DFFF9FBEA8FF8FB9
      9CFF9DBDA6FFCCCECDD28C8C8C140000000000000003CFCFD0A9DBDBDCFFD4D4
      D5FFD2D2D3FFD3D4D4FFE2E2E3FFD9D9DAFFD9D9DAFFD9D9DAFFD9D9DAFFD9D9
      DAFFDDDDDEFFE5E5E6FFD6D6D7AE4040400400000000808C8C14D5D6D6D2E2E2
      E3FFDCDCDDFFDDDDDEFFCCCCCDFF858586FF7A7A7AFF8C8C8CFF7C7C7CFF8484
      84FF8A8A8AFF7E7E7ED2737373140000000000008B0B4F4FC6BF4949D1FF4343
      D0FF3B3BCEFF5B5BD6FFD7D7F5FFFFFFFFFFFFFFFFFFE8E8F9FF5353D6FF0202
      C4FF0202C4FF0303C6FF2727C5E52222A42D000000008C8C8C14D9D9D9D2E9E9
      EAFFE8E8E9FFE8E8E9FFE8E8E9FFE8E8E9FFE8E8E9FFE8E8E9FFEAE9EAFFEAE8
      EAFFEAE9EBFFD9D9DBD28C8C8C140000000000000003D3D3D5A9E0E0E1FFD9D9
      DAFFD6D6D7FFD8D8D9FFE8E8E9FFE0E0E1FFE0E0E1FFE0E0E1FFE0E0E1FFE0E0
      E1FFE4E4E5FFEBEBEBFFDADADAAE40404004000000008C8C8C14D9D9DBD2E3E3
      E4FFD8D8D8FFD8D8D8FFD4D4D4FFAFAFB0FF9C9C9CFFB7B7B8FF7B7B7BFF8F8F
      8FFFC1C1C1FF959595D2808080140000000000008B0B5151C6BF4D4DD1FF4747
      CFFF4545CFFF5252D3FFC6C6F0FFFFFFFFFFFFFFFFFFDFDFF7FF5656D6FF2F2F
      CCFF2F2FCDFF2E2ECDFF4242CAE52222A42D000000008C8C8C14DCDCDDD2EDED
      EEFFECECEDFFECECEDFFECECEDFFECECEDFFECECEDFFECECEDFFECECEDFFECEC
      EDFFEDEDEEFFDCDCDDD28C8C8C140000000000000003D6D6D8A9E6E6E7FFDFDF
      E0FFDCDCDDFFDCDCDDFFEAEAEBFFE0E0E1FFE0E0E1FFE0E0E1FFE0E0E1FFE0E0
      E0FFD5D5D5FFCACACAFFC5C5C5A800000003000000008C8C8C14DCDCDDD2EAEA
      EBFFE3E3E4FFE3E3E4FFE3E3E4FFE3E3E3FFE0E0E0FFD4D4D5FFAFAFB0FFBEBE
      BEFFE8E8E8FFD7D7D7D28C8C8C140000000000008B0B5454C6BF5252D2FF4B4B
      D0FF5A5AD4FFBEBEEEFFFEFEFEFFECECFAFFE3E3F7FFFFFFFFFFD7D7F5FF6565
      D8FF4141CFFF4242D0FF4F4FCBE52222A42D000000008C8C8C14DFDFDFD2F1F1
      F2FFF0F0F1FFF0F0F1FFF0F0F1FFF0F0F1FFF0F0F1FFF0F0F1FFF0F0F0FFE6E5
      E6FFDBDBDBFFD2D2D3D28C8C8C140000000000000003D9DBDBA9E8E8E9FFDDDD
      DEFFDADADBFFDEDEDEFFEFEFF0FFE7E7E8FFE7E7E8FFE7E7E8FFE8E8E8FFE3E3
      E3FFD7D7D7FFC5C5C5EEA8A8A85200000000000000008C8C8C14DFDFDFD2EAEA
      EBFFDCDCDDFFDCDCDDFFDCDCDDFFDCDCDDFFDDDDDDFFDDDDDDFFDDDDDEFFD8D8
      D8FFD8D8D8FFD3D3D3D28C8C8C14000000000000800A5353C5BC5959D3FF4E4E
      D1FF7E7EDDFFF3F3FBFFEDEDFAFF8383DFFF6B6BD8FFD9D9F5FFFDFDFEFF9999
      E4FF4545CFFF4747D0FF5252C9E31E1EA42A000000008C8C8C14E2E2E3D2F4F4
      F5FFF3F3F4FFF3F3F4FFF3F3F4FFF3F3F4FFF3F3F4FFF2F2F3FFE3E3E4FFC5C5
      C5FFB6B6B6FFB1B1B1A3555555060000000000000003DCDCDEA9EDEDEDFFE3E3
      E3FFE0E0E1FFE2E2E2FFF0F0F0FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
      E4FFE9E9E9F3D1D1D16F0000000200000000000000008C8C8C14E2E2E3D2F1F1
      F2FFEBEBEBFFEAEAEBFFEAEAEBFFEAEAEBFFEAEAEBFFEAEAEAFFDDDDDDFFC2C1
      C1FFB6B5B5FFB1B1B1A35555550600000000000000003939B4625E5ECDF05959
      D4FF5757D3FF9393E3FF8787DFFF5050D1FF4D4DD1FF7070D9FF9E9EE5FF5757
      D3FF4C4CD1FF5757CFFB4040B98F00008E09000000008C8C8C14E4E4E6D2F6F6
      F7FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F7FFF2F2F3FFE1E1E1FFE6E6
      E6FFD1D1D1C99A9A9A26000000000000000000000003DFDFDFA9F1F1F1FFE7E7
      E8FFE5E5E5FFE4E4E4FFF7F7F7FFF6F6F6FFF6F6F6FFF6F6F6FFF5F5F5FDE8E8
      E8E9D5D5D56E666666050000000000000000000000008C8C8C14E6E6E6D2F0F0
      F0FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFDDDDDDFFE7E7
      E6FFD3D1D1C99A9A9A26000000000000000000000000000055033838B4696060
      CEF05D5DD5FF5757D3FF5656D3FF5656D3FF5555D2FF5252D2FF5151D2FF5252
      D2FF5B5BD0FB4343BA940000890D00000000000000008C8C8C14E7E7E7D2F9F9
      F9FFF8F8F9FFF8F8F9FFF8F8F9FFF8F8F9FFF9F9F9FFF4F4F4FFEAEAEAFFE2E2
      E2D5B0B0B03700000000000000000000000000000003E2E2E2A9F9F9F9FFF6F6
      F6FFF5F5F6FFF3F3F3FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFE6E6E6BFBEBE
      BE3380808004000000000000000000000000000000008C8C8C14E7E7E7D2F3F3
      F3FFE5E5E6FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE8E8E7FFE3E3
      E2D5B0B0B0370000000000000000000000000000000000000000000055033939
      B36C6262CEF16262D6FF5E5ED5FF5C5CD5FF5B5BD5FF5A5AD4FF5A5AD4FF5F5F
      D1FC4444BA970000920E00000000000000000000000094949413E8E8E8D0FAFA
      FAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFF2F2F2FFDFDFDFCCBBBB
      BB380000000000000000000000000000000000000001DBDBDB85EFEFEFD5F2F2
      F2D1F2F2F2D1F2F2F2D1F0F2F2D1F2F2F2D1F2F2F2D1F1F1F1D4DCDEDE840000
      0000000000000000000000000000000000000000000094949413E8E8E8D0FAFA
      FAFFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF9F9F9FFF1F1F1FFDFDFDFCCBBBB
      BB38000000000000000000000000000000000000000000000000000000000000
      55033838B46D5C5CC9E85F5FCCF05F5FCCF05E5ECCF05E5ECCF05C5CCAEF4444
      BA970000990F0000000000000000000000000000000080808006D1D1D164DEDE
      DE85DCDCDC84DCDCDC84DCDCDC84DCDCDC84DCDCDC84CCCCCC7DB0B0B02A0000
      000000000000000000000000000000000000000000009D9D9D0DAAAAAA18B1B1
      B117B1B1B117B1B1B117B1B1B117B1B1B117B1B1B117B1B1B1179D9D9D0D0000
      0000000000000000000000000000000000000000000080808006D1D1D164DEDE
      DE85DCDCDC84DCDCDC84DCDCDC84DCDCDC84DCDCDC84CCCCCC7DB6B6B02A0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000800613139F351C1CA3401C1CA3401C1CA3401C1CA3401515A23C1010
      8F10000000000000000000000000000000000000000000000000000000013636
      3613333939283238382932383829323838293238382938383E2944443E294444
      3E29444444226666330500000000000000000000000055555503808080448585
      885E8686865D7676795D191B1B981A1A1AD23B3B3B79888B8B5C8686865D8686
      865D8585885E7E81814540404004000000000000000000000000000000000000
      000C6080932892C2DB2AAAD5EA0C000000000000000000000000657D8E2B91BD
      D5789BC8DE17000000000000000000000000000000003D3D3D15383838202727
      270D00000006391C1C099B909017A3999919A3999919B8ADAD19C2C2C219C2C2
      C2197A7070193333331900000002000000000000000040404004495C686C6776
      81C66F7B84D86E7A82D96E7A82D96E7A82D96E7A82D95E6C77D9445869D94358
      69D9455A6BD54859667540404004000000000000000071717112B9BABAC9C5C6
      C7FAC8C8C9F7929293F8545454FC757676FF686869FAC7C8C9F7C6C7C8F7C8C9
      CAF7C7C8C9FAB9BABAC9717171120000000000000000000000000000001F232C
      33738BA2AED685B1CAE37DB2CEBF85B8D5908CC0DB5D6380943E4D65757483B8
      D4F388B9D4A19EC2DB1500000000000000004040400C3A3A3AA83E3D3DDB7C7B
      7BBF959393B4939191B9A39893D0B1A49FD4C8BCBAD4D5CCCCD4DCD7D9D4DDD6
      D7D4969292D33A3A3ACF393939550000000000000000464F581D4E6677DDC4CB
      D1FFF0F2F3FFEDEFF0FFEDEFF0FFEDEFF0FFEEEFF1FFD9DCDFFF8596A6FF4766
      80FF466681FF476076E046555D21000000000000000080808014C4C4C5D2D1D1
      D2FFD4D4D5FF818182FF7C7C7CFF959596FF6E6E6FFFD4D4D5FFC1C1C2FF8D8E
      8EFFAEAFAFFFC4C4C5D280808014000000000000000000000011000000592634
      3C99AAAEAAF79EAFB6FF93A9B6FF85A4B5FF7CA1B6FC68899AF0607988E983BB
      D8FD7BB4D3FD81B0CBA89BBCD317000000003C3C3C11393939CB404040FFAAA7
      A7FED0CDCDFFC7C4C3FFAEA39FFFC5B8B5FFDFD6D5FFD0CBCBFFCCC9C9FFD7D2
      D2FF9D9B9BFE3B3B3BFF393939C23737370E0000000047555C244F667AE5CDD3
      D8FFF0F0F0FFE5E5E5FFE5E5E5FFE5E5E5FFE6E6E6FFE6E6E5FFE4E5E5FF8697
      A5FF466580FF476178E746536028000000000000000080808014C7C8C8D2D5D5
      D6FFD7D7D8FFA0A0A1FF474747FF575757FF6F6F6FFFD4D4D5FF6E6E6EFF6464
      64FF606060FFB3B3B3D28C8C8C1400000000000000000000001E0000005B2B38
      4288B4C4CCF6B9BDBFFFBFBEBFFFBFC0C0FFBBBDBEFF989A9BFF7E8990FF89C1
      DEFF7DB8D8FF75A8C6FC8AB3CA57000000003C3C3C11393939C9404040FFABA8
      A8FED1CECEFFCAC6C6FFC8BEBCFFE4DAD9FFEBE2E4FFCFCBCBFFCCC9C9FFD7D4
      D3FF9D9A9AFD3B3B3BFF393939C93C3C3C110000000047555C244E6679E5CAD0
      D5FFEFEEEFFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E7FFE2E2E2FFDDDDDDFFC9CB
      CCFF6C8091FF466076E748555C27000000000000000080808014CBCBCCD2D9D9
      DAFFD9D9DAFFD5D5D6FF979797FF4D4D4DFF737374FFA7A7A7FF2D2D2DFF8B8B
      8BFF666667FFB3B3B3D28C8C8C1400000000000000000000001E000000493142
      4D78B7C8D2F5C7C8C8FFCFD0D1FFCECECFFFC8C8C9FF9D9C9DFF828C92FF8EC6
      E3FF81BEDFFF78ADCBFC8AB4CC55000000003C3C3C11393939C9404040FFABA8
      A8FED1CECEFFCCC9C9FFDFD7D7FFF0E6E9FFE1D8DAFFCCC8C8FFCCC9C9FFD6D1
      D1FF9D9999FD3B3B3BFF393939C93C3C3C110000000047555C244E6679E5C8CE
      D3FFECEBECFFE3E3E3FFE3E3E4FFE3E3E4FFE3E3E4FFE2E2E3FFD6D6D6FFC9C9
      C8FFAAB1B7FF4B6478E748555C27000000000000000080808014CECECED2DDDD
      DEFFDCDCDDFFDDDDDEFFE2E2E3FFA6A6A7FF767676FF5E5E5EFF818181FF8181
      82FFA8A8A9FFCECECED280808014000000000000000500000022000000363648
      5467ACC2CDF2CACBCCFFD3D3D4FFD0D0D0FFBFBFBFFF8F8E8EFF848F96FF94CB
      E8FF86C4E4FF7CB3D1FA8FB8CF4B000000003C3C3C11393939C9404040FFACAA
      AAFED2CFCFFFD0CCCCFFE8DFE2FFE7DEE0FFDBD6D6FFCFCBCAFFCEC9C9FFD9D2
      D2FF9E9898FD3B3B3BFF393939C93C3C3C110000000047555C244F667AE5C5CB
      D0FFE8E8E8FFE0E0E1FFE0E0E1FFE0E0E1FFE0E0E1FFE0E0E1FFE3E3E3FFEBEB
      EBFFC5CAD0FF4E667BE748555C27000000000000000080808014D2D2D3D2E1E1
      E2FFE1E1E2FFE0E0E1FFE2E2E3FFB5B5B6FF7F7F7FFF8B8B8CFFDDDDDEFFE3E3
      E4FFE3E3E4FFD2D2D3D280808014000000000000000000000006000000101A26
      332896ACB9B9CED0D2FFD7D7D8FFD0D0D1FFBABABAFF888889FF92ABBAFF9CD5
      F4FF8AC8E9FF80B9D7F991BCD548000000003C3C3C11393939C93F3E3EFF9290
      90FDB0ADADFEAEABABFEB5AFB0FEB4AEAFFEB4B1B0FEB2AFAEFEB2ADADFEB5AF
      B0FE858181FD3B3B3BFF393939C93C3C3C110000000047555C24506A7DE5C2C8
      CEFFE2E2E3FFD9D9DAFFDADADAFFDADADAFFDADADAFFDADADAFFDDDDDEFFE7E7
      E8FFC1C7CDFF4E6679E748555C270000000000000000808C8C14D5D5D6D2E5E5
      E6FFE5E5E6FFE5E5E6FFDADADBFF888888FF878787FFB4B4B4FFE6E6E7FFE4E4
      E5FFE5E5E6FFD5D5D6D2808C8C14000000000000000000000000000000000000
      0000B6BCC18CD7D8D9FFDDDDDEFFD8D8D9FFC2C2C2FF8D8E8FFF9CBBCEFFA4DB
      FAFF8ECCEDFF84BEDDF995BFDC48000000003C3C3C11393939C940403FFFADAB
      AAFDD4D1D1FED2CFCFFED1CFCEFED1CFCEFED1CFCEFED1CFCFFED1CFCFFED3D1
      D1FEACAAA9FD40403FFF393939C93C3C3C110000000047555C24526D81E5BFC5
      CBFFE1E0E1FFDADADBFFDADADBFFDADADBFFDADADBFFDADADBFFDDDDDEFFE4E4
      E4FFBEC4C9FF4E6679E748555C2700000000000000008C8C8C14D9D9D9D2E9E9
      EAFFE8E8E9FFEAEAEBFFAEADAEFF666565FF8B8A8AFFBDBDBDFFEAEAEBFFE8E8
      E9FFE9E9EAFFD9D9D9D28C8C8C14000000000000000000000000000000000000
      0000D4D4D89BDEDEDFFFE1E1E2FFDBDBDCFFC4C4C4FF8F9091FF9FBCCEFFA9DE
      FCFF93D0F1FF88C3E3F997C6DF47000000003C3C3C11393939C9434242FFD1CE
      CDFEFFFCFCFFFCF9F9FFFCF9F9FFFCF9F9FFFCF9F9FFFCF9F9FFFCF8F8FFFFFB
      FBFFD1CECDFE434242FF393939C93C3C3C110000000047555C24547085E5BCC3
      C9FFD9D8D9FFD0D0D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D2FFD3D3D4FFDDDC
      DDFFBBC0C6FF4D6479E748555C2700000000000000008C8C8C14DCDCDDD2EDED
      EEFFEDEDEEFFDCDCDDFF737373FF767676FF8F8E8EFFC4C4C5FFEEEEEFFFECEC
      EDFFEDEDEEFFDCDCDDD28C8C8C14000000000000000000000000000000008E8E
      8E09E3E3E4BCE2E2E3FFE5E5E6FFE1E1E2FFC8C8C9FF919293FFA2BDCEFFAFE1
      FDFF98D4F5FF8BC6E6F898C4DA45000000003C3C3C11393939C9424242FFCFCC
      CCFEFCF9F9FFF9F6F6FFF9F6F6FFF9F6F6FFF9F6F6FFF9F6F6FFF9F6F6FFFCF9
      F9FFCFCCCBFE424242FF393939C93C3C3C110000000047555C24567387E5B9C0
      C6FFD7D6D7FFD1D1D1FFD1D1D2FFD1D1D2FFD1D1D2FFD1D1D2FFD3D3D4FFDAD9
      DAFFB7BDC2FF4D6479E748555C2700000000000000008C8C8C14DFDFDFD2F1F1
      F2FFF1F1F2FFACACACFF6E6E6FFFBBBABBFF959495FFCDCDCEFFF1F1F2FFE6E5
      E6FFDBDBDBFFD2D2D3D28C8C8C1400000000000000000000000000000000B6B6
      B61CEBEBEBDBE2E2E2FFE8E8E8FFE8E8E9FFCFCFCFFF969798FFA5BFCFFFB4E3
      FEFF9ED7F8FF8FCAEAF59ECAE33F000000003C3C3C11393939C9424242FFCFCC
      CCFEFCF9F9FFF9F6F6FFF9F6F6FFF9F6F6FFF9F6F6FFF9F6F6FFF9F6F6FFFCF9
      F9FFCFCCCBFE424242FF393939C93C3C3C11000000004755632458768AE5B6BE
      C3FFD3D3D3FFCECECFFFCECECFFFCECECFFFCECECFFFCFCFCFFFD0D0D0FFD5D5
      D6FFB3B9BFFF4D6479E748555C2700000000000000008C8C8C14E2E2E3D2F4F4
      F5FFE8E8E9FF7F7F80FFB6B6B7FFDAD9DAFF989898FFDADADBFFE5E5E5FFC5C5
      C5FFB6B6B6FFB1B1B1A35555550600000000000000000000000000000000CBCB
      CB36F3F3F3F0EAE9E9FFEAEAEAFFE8E8E9FFCBCBCBFF949495FFA7BFCEFFB8E5
      FFFFA3DAFAFF93CEEEF1A2D1E837000000003C3C3C11393939C9424241FFCFCD
      CCFEFCF9F9FFF9F6F6FFF9F6F6FFF9F6F6FFF9F6F6FFF9F6F6FFF9F6F6FFFCF9
      F9FFCFCCCCFE424242FF393939C93C3C3C110000000047556324597A8FE5B4BC
      C2FFCFCFCFFFC0C0C1FFBEBEBFFFBEBEBFFFBEBEBFFFBEBEBFFFC2C3C3FFD2D2
      D2FFB1B7BCFF4D6479E748555C2700000000000000008C8C8C14E4E4E6D2F8F8
      F9FFCFCFCFFF9C9B9CFFF1F1F2FFDADADAFFA1A1A1FFE5E5E5FFE2E2E2FFE6E6
      E6FFD1D1D1C99A9A9A260000000000000000000000000000000000000000BDBD
      BD1BCEDBE6C9D9E7F0FFE8EBEDFFF5F5F5FFDFDFDFFFA7AAABFFADC4D3FFBDE6
      FFFFA7DDFBFF98D1F2EFA3D1EB32000000003C3C3C113E3E3EC94D4D4DFFCECB
      CAFEFCF8F8FFF9F5F5FFF9F5F5FFF9F5F5FFF9F5F5FFF9F5F5FFF9F5F4FFFCF8
      F7FFCECBCAFE424242FF393939C93C3C3C110000000047525C19587789D49CA9
      B0FFABAEB0FFA8A8A9FFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFA6A7A7FFACAF
      B2FF98A1A8FF4C6375D849525B1C00000000000000008C8C8C14E7E7E7D2FAFA
      FBFFD4D4D4FFE1E1E1FFFBFBFCFFDADADAFFB4B4B4FFF1F1F1FFEAEAEAFFE2E2
      E2D5B0B0B0370000000000000000000000000000000000000000000000000000
      0002A3C7DCA9B8E1F8FFC8E2F2FFDBECF6FFD1E5F1FFA6C8DBFFACCDE1FFC2E7
      FDFFABDEFCFF9CD5F5EFA1D0EA31000000002D2D2D11505050CB737271FF9F85
      6CFFBA9571FFB89471FFB89471FFB89471FFB89471FFB89471FFB89471FFBA95
      71FF9F856CFF41403FFF393939CB3C3C3C1100000000000000014E636E48566A
      758E5E6A7190878788C5939393FE949494FD949494FD939393FC828484BA5763
      6C9052606D8F4758664B00000001000000000000000094949413E8E8E8D0FAFA
      FAFFF8F8F8FFFAFAFAFFFBFBFBFFDEDDDDFFD3D3D3FFF3F3F4FFDFDFDFCCBBBB
      BB38000000000000000000000000000000000000000000000000000000000000
      00009BB9CF45B2D7EC92B5DBF1B2C5E2F5CDCBE7F8E1B5DFF8EEA6D5F0F7AFD9
      F2FCAADBF7FFA1D7F5EEA7D5EF31000000003333330A3C3C3C90444240C27454
      34C0815528C1815529C1815529C1815529C1815529C1815529C1815529C18155
      28C1745434C03E3C3CC23A3A3A923333330A0000000000000000000000000000
      0000000000005D5D5D2C6666666E6565656F6565656F6363636C5D5D5D210000
      0000000000000000000000000000000000000000000080808006D1D1D164DEDE
      DE85DCDCDC84DCDCDC84DEDEDE84CFCFCF84D3D3D384CCCCCC7DB0B0B02A0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080AAAA06A6BFCC14AACBD827AACCE13CA3CEE953A0CD
      E76B9FC9E380A2CCE587ADD1ED1C0000000000000000404040083737370E3737
      240E3737240E3737240E3737240E3737240E3737240E3737240E3737240E3737
      240E3737240E3737370E3939390900000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008001FFFF8001F00F8001F8008001F007
      800080008001E003800000008001C00180000000800180008000000080010000
      8001000080010000800100008001000080010000800100008001000080010000
      800100018001000080010001800180008003000380038001800700078007C003
      800F001F800FE007801F801F801FF00FC0038001E1C7800180018001C0030001
      8001800180010000800180018001000080018001800100008001800100010000
      800180018001000080018001F001000080018001F001000080018001E0010000
      80018001E001000080018001E001000080018003E001000080018007E0010000
      8001800FF0010000F81F801FFC01800100000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 608
    Top = 504
  end
  object ColorDialog1: TColorDialog
    Left = 552
    Top = 504
  end
end
