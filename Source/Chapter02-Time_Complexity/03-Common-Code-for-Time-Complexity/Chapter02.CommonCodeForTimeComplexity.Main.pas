unit Chapter02.CommonCodeForTimeComplexity.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

uses
  AI.Utils;

// O(1)
procedure SwapTwoInts(var a, b: integer);
var
  temp: integer;
begin
  temp := a;
  a := b;
  b := temp;
end;

// O(n)
function Sum(n: integer): integer;
var
  res, i: integer;
begin
  Assert(n >= 0);
  res := 0;
  for i := 0 to n do
    res += i;
  Result := res;
end;

// O(n)
procedure Reverse(var s: UString);
  procedure __swap__(var a, b: UChar);
  var
    temp: UChar;
  begin
    temp := a;
    a := b;
    b := temp;
  end;

var
  n, i: integer;
begin
  n := Length(s);

  i := 0;
  while i < n div 2 do
  begin
    __swap__(s[i + 1], s[n - i]);

    i += 1;
  end;
end;

// O(n^2) Time Complexity
procedure SelectionSort(arr: TArray_int);
var
  i, minIndex, j: integer;
begin
  for i := 0 to High(arr) do
  begin
    minIndex := i;

    for j := i + 1 to High(arr) do
    begin
      if arr[j] < arr[minIndex] then
        minIndex := j;
    end;

    SwapTwoInts(arr[i], arr[minIndex]);
  end;
end;

// O(n) Time Complexity
procedure PrintInformation(n: integer);
var
  i, j: integer;
begin
  for i := 1 to n do
    for j := 1 to 30 do
      WriteLn('Class ', i, ' - ', 'No. ', j);
end;

// O(logn) Time Complexity
function BinarySearch(arr: TArray_int; target: integer): integer;
var
  l, r, mid: integer;
begin
  l := 0;
  r := High(arr);

  while l <= r do
  begin
    mid := l + (r - l) div 2;

    if arr[mid] = target then
      Exit(mid);

    if arr[mid] > target then
      r := mid - 1
    else
      l := mid + 1;
  end;

  Result := -1;
end;

// O(logn) Time Complexity
function IntToUString(num: integer): UString;
begin

end;

procedure Main;
var
  s: UString;
begin
  s := '123456789';
  Reverse(s);
  WriteLn(s);
end;

end.
