unit Chapter02._07_AmortizedTime2.MyVector;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math;

type
  generic TMyVector<T> = class(TObject)
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
  TVector = specialize TMyVector<integer>;

procedure Main;
var
  n: integer;
  vec: TVector;
  i, num: integer;
  startTime, endTime: cardinal;
begin
  for i := 10 to 26 do
  begin
    n := 2 ** i;

    startTime := TThread.GetTickCount64;
    vec := TVector.Create;
    for num := 0 to n - 1 do
      vec.push_back(num);
    for num := 0 to n - 1 do
      vec.pop_back;
    endTime := TThread.GetTickCount64;

    Write(n, ' operations: '#9);
    WriteLn(endTime - startTime, ' ms');
  end;
end;

{ TMyVector }

constructor TMyVector.Create(n: integer);
begin
  SetLength(_data, n);
  _size := 0;
  _capacity := n;
end;

destructor TMyVector.Destroy;
begin
  inherited Destroy;
end;

function TMyVector.pop_back(): T;
var
  ret: T;
begin
  if _size <= 0 then
    raise Exception.Create('can not pop back for empty vector.');

  _size -= 1;
  ret := _data[_size];

  // 在size达到静态数组最大容量的1/4时才进行resize
  // resize的容量是当前最大容量的1/2
  // 防止复杂度的震荡
  if _size = _capacity div 4 then
    __resize(_capacity div 2);

  Result := ret;
end;

procedure TMyVector.push_back(e: T);
begin
  if _size = _capacity then
    __resize(2 * _capacity);

  _data[_size] := e;
  _size += 1;
end;

procedure TMyVector.__resize(newCapacity: integer);
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
