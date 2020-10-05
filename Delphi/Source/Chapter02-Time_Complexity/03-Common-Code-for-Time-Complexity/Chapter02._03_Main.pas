unit Chapter02._03_Main;

interface

uses
  System.Classes,
  System.SysUtils;

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
    res := res + i;
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

  for i := 0 to n div 2 do
  begin
    __swap__(s[i + 1], s[n - i]);
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
var
  s, sign: UString;
  temp: UChar;
  res: UString;
begin
  s := '';
  sign := '+';

  if num < 0 then
  begin
    num := -num;
    sign := '-';
  end;

  while num <> 0 do
  begin
    temp := Chr(Ord('0') + num mod 10);
    num := num div 10;
    s := s + temp;
  end;

  if s = '' then
    Exit('0');

  Reverse(s);
  if sign = '+' then
    res := s
  else
    res := sign + s;

  Result := res;
end;

// O(nlogn)
procedure Hello(n: integer);
var
  sz, i: integer;
begin
  sz := 1;
  while sz < n do
  begin
    for i := 1 to n - 1 do
      WriteLn('Hello, Algorithm!');

    sz := sz + sz;
  end;
end;

// O(sqrt(n)) Time Complexity
function IsPrime(num: integer): boolean;
var
  x: integer;
begin
  x := 2;
  while Sqr(x) <= num do
  begin
    if num mod x = 0 then
      Exit(false);

    x := x + 1;
  end;

  Result := true;
end;

function IsPrime2(num: integer): boolean;
var
  x: integer;
begin
  if num <= 1 then
    Exit(false);
  if num = 2 then
    Exit(true);
  if num mod 2 = 0 then
    Exit(false);

  x := 3;
  while Sqr(x) <= num do
  begin
    if num mod x = 0 then
      Exit(false);

    x := x + 2;
  end;

  Result := true;
end;

procedure Main;
var
  s, i, l, r: integer;
  b, e: double;
begin
  l := 1000000;
  r := 5000000;

  s := 0;
  b := Now;
  for i := l to r do
  begin
    if IsPrime(i) then
      s := s + 1;
  end;
  e := Now;
  WriteLn('Count: ', s, ' time: ', e - b);

  s := 0;
  b := Now;
  for i := l to r do
  begin
    if IsPrime2(i) then
      s := s + 1;
  end;
  e := Now;
  WriteLn('Count: ', s, ' time: ', e - b);
end;

end.
