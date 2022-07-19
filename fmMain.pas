unit fmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Spring.Collections, SpringTestData;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Memo2: TMemo;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure ShowOriginalData(const Data: IList<TTestData>);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  Data: IList<TTestData>;
  LastNameGrouped: IEnumerable<IGrouping<string, TTestData>>;
  TestDataGrouping: IGrouping<string, TTestData>;
  TestData: TTestData;
begin
  Memo1.Lines.Clear;

  Data := TCollections.CreateObjectList<TTestData>();
  TSpringData.AddTestData(Data);
  ShowOriginalData(Data);

  LastNameGrouped := TEnumerable.GroupBy<TTestData, string>(Data,
      function(Data: TTestData): string
      begin
        Result := Data.LastName;
      end);

  for TestDataGrouping in LastNameGrouped do
  begin
    Memo1.Lines.Add('*** New Grouping ***');
    for TestData in TestDataGrouping do
    begin
      Memo1.Lines.Add(Format('%s %s, Age: %d', [TestData.FirstName, TestData.LastName, TestData.Age]));
    end;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  Data: IList<TTestData>;
  LastNameGrouped: IEnumerable<IGrouping<string, TTestData>>;
  TestDataGrouping: IGrouping<string, TTestData>;
  TestData: TTestData;
begin
  Memo1.Lines.Clear;

  Data := TCollections.CreateObjectList<TTestData>();
  TSpringData.AddTestData(Data);
  ShowOriginalData(Data);

  // Group by LastName
  LastNameGrouped := TEnumerable.GroupBy<TTestData, string>(Data,
      function(Data: TTestData): string
      begin
        Result := Data.LastName;
      end);

  for TestDataGrouping in LastNameGrouped do
  begin
    Memo1.Lines.Add('*** New Grouping ***');

    // order the results of the group by age
    for TestData in TestDataGrouping.Ordered(function(const Left, Right: TTestData): Integer
                             begin
                                if Left.Age > Right.Age then
                                  Result := -1
                                else if Left.Age < Right.Age then
                                  Result := 1
                                else Result := 0;
                             end) do
    begin
      Memo1.Lines.Add(Format('%s %s, Age: %d', [TestData.FirstName, TestData.LastName, TestData.Age]));
    end;
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  Data: IList<TTestData>;
  TestData: TTestData;
begin
  Memo1.Lines.Clear;

  Data := TCollections.CreateObjectList<TTestData>();
  TSpringData.AddTestData(Data);
  ShowOriginalData(Data);

  //Sort the list by LastName
  Data.Sort(function(const Left, Right: TTestData): Integer
            begin
              if Left.LastName > Right.LastName then
                Result := 1
              else if Left.LastName < Right.LastName then
                Result := -1
              else Result := 0;
            end);

  for TestData in Data do
    Memo1.Lines.Add(Format('%s %s, Age: %d', [TestData.FirstName, TestData.LastName, TestData.Age]));
end;

procedure TForm2.Button4Click(Sender: TObject);
var
  Data: IList<TTestData>;
  LastNameGrouped: IEnumerable<IGrouping<string, TTestData>>;
  TestDataGrouping: IGrouping<string, TTestData>;
  TestData: TTestData;
begin
  Memo1.Lines.Clear;

  Data := TCollections.CreateObjectList<TTestData>();
  TSpringData.AddTestData(Data);
  ShowOriginalData(Data);

  //Sort the list by LastName
  Data.Sort(function(const Left, Right: TTestData): Integer
            begin
              if Left.LastName > Right.LastName then
                Result := 1
              else if Left.LastName < Right.LastName then
                Result := -1
              else Result := 0;
            end);

  // Group by LastName
  LastNameGrouped := TEnumerable.GroupBy<TTestData, string>(Data,
      function(Data: TTestData): string
      begin
        Result := Data.LastName;
      end);

  for TestDataGrouping in LastNameGrouped do
  begin
    Memo1.Lines.Add('*** New Grouping ***');

    // order the results of the group by age
    for TestData in TestDataGrouping.Ordered(function(const Left, Right: TTestData): Integer
                             begin
                                if Left.Age > Right.Age then
                                  Result := -1
                                else if Left.Age < Right.Age then
                                  Result := 1
                                else Result := 0;
                             end) do
    begin
      Memo1.Lines.Add(Format('%s %s, Age: %d', [TestData.FirstName, TestData.LastName, TestData.Age]));
    end;
  end;
end;

procedure TForm2.ShowOriginalData(const Data: IList<TTestData>);
var
  TestData: TTestData;
begin
  Memo2.Lines.Clear;
  for TestData in Data do
    Memo2.Lines.Add(Format('%s %s, Age: %d', [TestData.FirstName, TestData.LastName, TestData.Age]));
end;

end.
