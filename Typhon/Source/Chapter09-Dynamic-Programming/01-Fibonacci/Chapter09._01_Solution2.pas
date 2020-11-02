unit Chapter09._01_Solution2;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

type
  TSolution = class(TObject)
  private
    _count: cardinal;

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

  function __fib__(n: integer): integer;
  begin
    _count += 1;

    if n = 0 then Exit(0);
    if n = 1 then Exit(1);
    if memo[n] = -1 then
      memo[n] := __fib__(n - 1) + __fib__(n - 2);

    Result := memo[n];
  end;

var
  i: integer;
begin
  SetLength(memo, n + 1);
  TArrayUtils_int.FillArray(memo, -1);
  Result := __fib__(n);
end;

function TSolution.getNum: integer;
begin
  Result := _count;
end;

end.
