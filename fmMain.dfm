object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Spring4D Sorting and Grouping Demo'
  ClientHeight = 293
  ClientWidth = 851
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    851
    293)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 579
    Top = 8
    Width = 79
    Height = 16
    Caption = 'Original Data:'
  end
  object Label2: TLabel
    Left = 312
    Top = 8
    Width = 96
    Height = 16
    Caption = 'Springified Data:'
  end
  object Button1: TButton
    Left = 13
    Top = 59
    Width = 129
    Height = 38
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Group by Last Name'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 312
    Top = 32
    Width = 250
    Height = 251
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button2: TButton
    Left = 13
    Top = 107
    Width = 216
    Height = 38
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Group by Last Name, Order by Age'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 13
    Top = 13
    Width = 116
    Height = 38
    Caption = 'Sort by Last Name'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Memo2: TMemo
    Left = 579
    Top = 32
    Width = 264
    Height = 251
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 4
  end
  object Button4: TButton
    Left = 13
    Top = 153
    Width = 276
    Height = 38
    Caption = 'Sort and Group by Last Name, Order by Age'
    TabOrder = 5
    OnClick = Button4Click
  end
end
