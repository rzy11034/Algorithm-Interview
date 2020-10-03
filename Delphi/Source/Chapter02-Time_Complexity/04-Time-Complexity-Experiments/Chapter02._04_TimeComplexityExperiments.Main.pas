unit Chapter02._04_TimeComplexityExperiments.Main;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Math,
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
    n := Round(Power(2, i));

    arr := TUtils.GenerateRandomArray(n, 0, 100000000);

    startTime := TThread.GetTickCount;
    TAlgorithmTester.FindMax(arr);
    endTime := TThread.GetTickCount;

    WriteLn('data size 2^', i, ' = ', n, #$9, 'Time cost: ', (endTime - startTime), ' ms');
  end;
end;

end.
