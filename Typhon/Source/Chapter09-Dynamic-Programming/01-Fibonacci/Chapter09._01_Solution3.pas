unit Chapter09._01_Solution3;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

type
  TSolution = class(TObject)
  private
    _count: integer;

  public
    function fib(n: integer): integer;
    function getNum: integer;
  end;

procedure Main;

implementation

procedure Main;
var
  startTime, endTime: cardinal;
  res, n: integer;
  sl: TSolution;
begin
  n := 40;

  sl := TSolution.Create;
  startTime := GetTickCount64;
  res := sl.fib(n);
  endTime := GetTickCount64;
  WriteLn('fib(', n, ') = ', res);
  WriteLn('time : ', (endTime - startTime), ' s');
  WriteLn('run function fib() ', sl.getNum(), ' times.');
  sl.Free;

end;

{ TSolution }

function TSolution.fib(n: integer): integer;
var
  memo: TArr_int;
  i: integer;
begin
  SetLength(memo, n + 1);

  memo[0] := 0;
  memo[1] := 1;

  for i := 2 to n do
  begin
    _count += 1;
    memo[i] := memo[i - 1] + memo[i - 2];
  end;

  Result := memo[n];
end;

function TSolution.getNum: integer;
begin
  Result := _count;
end;

end.
