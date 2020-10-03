unit Chapter02._04_TimeComplexityExperiments.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  AI.Utils;

procedure Main;

implementation

procedure Main;
var
  n: integer;
  arr: TArray_int;
  i: integer;
  startTime, endTime: cardinal;
begin
  // 数据规模倍乘测试findMax
  // O(n)
  WriteLn('Test for findMax:');
  for i := 10 to 28 do
  begin
    n := 2 ** i;

    arr := TUtils.GenerateRandomArray(n, 0, 100000000);

    startTime := TThread.GetTickCount64;
    TAlgorithmTester.FindMax(arr);
    endTime := TThread.GetTickCount64;

    WriteLn('data size 2^', i, ' = ', n, #$9, 'Time cost: ', (endTime - startTime), ' ms');
  end;
end;

end.
