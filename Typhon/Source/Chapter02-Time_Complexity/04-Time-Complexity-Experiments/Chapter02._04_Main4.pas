unit Chapter02._04_Main4;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math, DeepStar.Utils,
  AI.Utils;

procedure Main;

implementation

procedure Main;
var
  n: integer;
  arr: TArr_int;
  i: integer;
  startTime, endTime: cardinal;
begin
  // 数据规模倍乘测试selectionSort
  // O(n^2)
  WriteLn('Test for Merge Sort:');
  for i := 10 to 26 do
  begin
    n := 2 ** i;

    arr := TUtils.GenerateRandomArray(n, 0, 1 shl 30);

    startTime := TThread.GetTickCount64;
    TAlgorithmTester.MergeSort(arr);
    endTime := TThread.GetTickCount64;

    WriteLn('data size 2^', i, ' = ', n, #$9, 'Time cost: ', (endTime - startTime), ' ms');
  end;
end;

end.
