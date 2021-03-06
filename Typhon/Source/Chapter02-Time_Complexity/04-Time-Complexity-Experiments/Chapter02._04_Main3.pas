﻿unit Chapter02._04_Main3;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils,
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
  WriteLn('Test for Binary Search:');
  for i := 10 to 28 do
  begin
    n := 2 ** i;

    arr := TUtils.GenerateOrderedArray(n);

    startTime := TThread.GetTickCount64;
    TAlgorithmTester.BinarySearch(arr, 0);
    endTime := TThread.GetTickCount64;

    WriteLn('data size 2^', i, ' = ', n, #$9, 'Time cost: ', (endTime - startTime), ' ms');
  end;
end;

end.
