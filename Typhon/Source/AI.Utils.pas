unit AI.Utils;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math;

type
  UChar = UnicodeChar;
  UString = UnicodeString;
  TStringBuilder = TUnicodeStringBuilder;

  TArray_int = array of integer;

  TUtils = class(TObject)
  public
    class function GenerateRandomArray(n, rangeL, rangeR: integer): TArray_int;
    class function GenerateOrderedArray(n: integer): TArray_int;
  end;

  TAlgorithmTester = class(TObject)
  public
    // O(logn)
    class function BinarySearch(arr: TArray_int; target: integer): integer;

    // O(N)
    class function FindMax(arr: TArray_int): integer;

    // O(NlogN)
    class procedure MergeSort(arr: TArray_int);

    // O(N^2)
    class procedure SelectionSort(arr: TArray_int);
  end;

implementation

{ TAlgorithmTester }

class function TAlgorithmTester.BinarySearch(arr: TArray_int; target: integer): integer;
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

class function TAlgorithmTester.FindMax(arr: TArray_int): integer;
var
  res, i: integer;
begin
  Assert(Length(arr) > 0);

  res := arr[0];

  for i := 0 to High(arr) do
    if arr[i] > res then
      res := arr[i];

  Result := res;
end;

class procedure TAlgorithmTester.MergeSort(arr: TArray_int);
  function __arrayCopyOfRange__(l, r: integer): TArray_int;
  var
    res: TArray_int;
    i: integer;
  begin
    SetLength(res, r - l + 1);

    for i := l to r do
      res[i - l] := arr[i];

    Result := res;
  end;

  procedure __merge__(l, mid, r: integer);
  var
    aux: array of integer;
    i, leftIndex, rightIndex: integer;
  begin
    aux := __arrayCopyOfRange__(l, r);

    // 初始化，leftIndex 指向左半部分的起始索引位置 l；
    // rightIndex 指向右半部分起始索引位置 mid+1
    leftIndex := l;
    rightIndex := mid + 1;

    for i := l to r do
    begin
      if leftIndex > mid then // 如果左半部分元素已经全部处理完毕
      begin
        arr[i] := aux[rightIndex - l];
        rightIndex += 1;
      end
      else if rightIndex > r then // 如果右半部分元素已经全部处理完毕
      begin
        arr[i] := aux[leftIndex - l];
        leftIndex += 1;
      end
      else if aux[leftIndex - l] < aux[rightIndex - l] then // 左半部分所指元素 < 右半部分所指元素
      begin
        arr[i] := aux[leftIndex - l];
        leftIndex += 1;
      end
      else // 左半部分所指元素 >= 右半部分所指元素
      begin
        arr[i] := aux[rightIndex - l];
        rightIndex += 1;
      end;
    end;
  end;

var
  sz, i: integer;
begin
  sz := 1;
  while sz < Length(arr) do
  begin
    i := 0;
    while i < Length(arr) - sz do
    begin
      // 对 arr[i...i+sz-1] 和 arr[i+sz...i+2*sz-1] 进行归并
      __merge__(i, i + sz - 1, Min(i + sz + sz - 1, Length(arr) - 1));

      i += sz * 2;
    end;

    sz *= 2;
  end;
end;

class procedure TAlgorithmTester.SelectionSort(arr: TArray_int);
  procedure __swap__(i, j: integer);
  var
    temp: integer;
  begin
    temp := arr[i];
    arr[i] := arr[j];
    arr[j] := temp;
  end;

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

    __swap__(i, minIndex);
  end;
end;

{ TUtils }

class function TUtils.GenerateOrderedArray(n: integer): TArray_int;
var
  res: TArray_int;
  i: integer;
begin
  SetLength(res, n);
  for i := 0 to n - 1 do
    res[i] := i;

  Result := res;
end;

class function TUtils.GenerateRandomArray(n, rangeL, rangeR: integer): TArray_int;
var
  res: TArray_int;
  i: integer;
begin
  Assert((n > 0) and (rangeL <= rangeR));

  SetLength(res, n);

  Randomize;

  for i := 0 to n - 1 do
    res[i] := Random(rangeR - rangeL) + rangeL;

  Result := res;
end;

end.
