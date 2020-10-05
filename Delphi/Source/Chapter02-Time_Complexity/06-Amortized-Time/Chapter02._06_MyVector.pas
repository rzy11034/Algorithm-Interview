unit Chapter02._06_MyVector;

interface

uses
  System. Classes,
  System. SysUtils,
  System. Math;

type
  TMyVector<T> = class(TObject)
  private type
    TArr_T = array of T;

  private
    _data: TArr_T;
    _size: integer;
    _capacity: integer;

    // 复杂度为 O(n)
    procedure __resize(newCapacity: integer);

  public
    constructor Create(n: integer = 100);
    destructor Destroy; override;

    // 平均复杂度为 O(1)
    procedure push_back(e: T);

    // 平均复杂度为 O(1)
    function pop_back(): T;
  end;

procedure Main;

implementation

type
  TVector = TMyVector<integer>;

procedure Main;
var
  n: integer;
  vec: TVector;
  i, num: integer;
  startTime, endTime: cardinal;
begin
  for i := 10 to 26 do
  begin
    n :=Round(IntPower( 2 , i));

    startTime := TThread.GetTickCount;
    vec := TVector.Create;
    for num := 0 to n - 1 do
      vec.push_back(num);
    endTime := TThread.GetTickCount;

    Write(n, ' operations: '#9);
    WriteLn(endTime - startTime, ' ms');
  end;
end;

{ TMyVector }

constructor TMyVector<T>.Create(n: integer);
begin
  SetLength(_data, n);
  _size := 0;
  _capacity := n;
end;

destructor TMyVector<T>.Destroy;
begin
  inherited Destroy;
end;

function TMyVector<T>.pop_back(): T;
begin
  if _size <= 0 then
    raise Exception.Create('can not pop back for empty vector.');

  _size := _size -1;
  Result := _data[_size];
end;

procedure TMyVector<T>.push_back(e: T);
begin
  if _size = _capacity then
    __resize(2 * _capacity);

  _data[_size] := e;
  _size :=_size + 1;
end;

procedure TMyVector<T>.__resize(newCapacity: integer);
var
  newData: TArr_T;
  i: integer;
begin
  Assert(newCapacity >= _size);

  SetLength(newData, newCapacity);
  for i := 0 to _size - 1 do
    newData[i] := _data[i];

  _data := newData;
  _capacity := newCapacity;
end;

end.
