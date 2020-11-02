unit Chapter09._01_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

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
begin
  _count += 1;

  if n = 0 then Exit(0);
  if n = 1 then Exit(1);

  Result := fib(n - 1) + fib(n - 2);
end;

function TSolution.getNum: integer;
begin
  Result := _count;
end;

end.
