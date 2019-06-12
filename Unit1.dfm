object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 742
  ClientWidth = 1087
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    1087
    742)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 39
    Width = 337
    Height = 138
    TabOrder = 1
  end
  object Button2: TButton
    Left = 814
    Top = 37
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object WebBrowser1: TWebBrowser
    Left = 351
    Top = 39
    Width = 457
    Height = 251
    TabOrder = 3
    OnNavigateComplete2 = WebBrowser1NavigateComplete2
    OnDocumentComplete = WebBrowser1DocumentComplete
    ControlData = {
      4C0000003B2F0000F11900000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E12620A000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object event_line: TStringGrid
    Left = 8
    Top = 296
    Width = 1071
    Height = 329
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 15
    DefaultRowHeight = 15
    FixedCols = 0
    RowCount = 500
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 4
    ColWidths = (
      64
      295
      300
      64
      188
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 864
    Top = 152
  end
end
