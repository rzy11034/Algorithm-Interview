unit Chapter02._02_TimeComplexityBasic.Main;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Math;

procedure Main;

implementation

procedure Main;
var
  x, n, i: integer;
  sum: int64;
  startTime, endTime: TDateTime;
begin
  // 数据规模每次增大10倍进行测试
  // 有兴趣的同学也可以试验一下数据规模每次增大2倍哦:)
  for x := 1 to 9 do
  begin
    n := Round(Power(10, x));

    startTime := Now;

    sum := 0;
    for i := 0 to n - 1 do
      sum := sum + i;

    endTime := Now;

    WriteLn('sum = ', sum);
    WriteLn('10^', x, ' : ', endTime - startTime, ' ms');
    WriteLn;
  end;
end;

end.
