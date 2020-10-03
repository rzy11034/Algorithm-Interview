unit Chapter02.TimeComplexityExperiments.Main;

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
  MaxValue: integer;
  startTime, endTime: cardinal;
begin
  // 数据规模倍乘测试findMax
  // O(n)
  WriteLn('Test for findMax:');
  for i := 10 to 28 do
  begin
    n := 2 ** i;

    arr := TUtils.GenerateRandomArray(n, 0, 100000000);

    startTime := GetTickCount64;
    MaxValue := TAlgorithmTester.FindMax(arr);
    endTime := GetTickCount64;

    WriteLn('data size 2^', i, ' = ', n, );
  end;
end;

end.
