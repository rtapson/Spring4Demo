unit SpringTestData;

interface

uses
  Spring,
  Spring.Collections,
  System.SysUtils;

type
  TTestData = class
  private
    FFirstName: string;
    FLastName: string;
    FAge: Integer;
    FBirthDate: TDateTime;
  public
    constructor Create(const FirstName, LastName: string; const Age: Integer; const Birthdate: TDateTime);
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property Age: Integer read FAge write FAge;
    property BirthDate: TDateTime read FBirthDate write FBirthDate;
  end;

  TSpringData = class
  public
    class procedure AddTestData(const aList: IList<TTestData>);
  end;

  TLastNameGroupBy = TFunc<TTestData, string>;

implementation

{ TSpringData }

class procedure TSpringData.AddTestData(const aList: IList<TTestData>);
begin
  aList.Add(TTestData.Create('Jon', 'Doe', 32, StrToDate('12/12/1986')));
  aList.Add(TTestData.Create('Jan', 'Smith', 8, StrToDate('12/12/1986')));
  aList.Add(TTestData.Create('Barb', 'Carlson', 47, StrToDate('12/12/1986')));
  aList.Add(TTestData.Create('Ollie', 'Heinke', 47, StrToDate('12/12/1986')));
  aList.Add(TTestData.Create('Gunther', 'Doe', 72, StrToDate('12/12/1986')));
  aList.Add(TTestData.Create('Gretta', 'Heinke', 46, StrToDate('12/12/1986')));
  aList.Add(TTestData.Create('Thomas', 'Heinke', 17, StrToDate('12/12/1986')));
  aList.Add(TTestData.Create('Jill', 'Doe', 22, StrToDate('12/12/1986')));
  aList.Add(TTestData.Create('Debbie', 'Heinke', 19, StrToDate('12/12/1986')));
  aList.Add(TTestData.Create('Carl', 'Doe', 52, StrToDate('12/12/1986')));
end;

{ TTestData }

constructor TTestData.Create(const FirstName, LastName: string; const Age: Integer; const Birthdate: TDateTime);
begin
  FFirstName := FirstName;
  FLastName := LastName;
  FAge := Age;
  FBirthDate := Birthdate;
end;

end.
