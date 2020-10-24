unit Chapter06._05_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.DSA.Linear.Queue;

// 279. Perfect Squares
// https://leetcode.com/problems/perfect-squares/description/
// 时间复杂度: O(n)
// 空间复杂度: O(n)
type
  TSolution = class(TObject)
  public
    function numSquares(n: integer): integer;
  end;

procedure Main;

implementation

procedure Main;
begin
  with TSolution.Create do
  begin
    WriteLn(numSquares(12));
    WriteLn(numSquares(13));
    Free;
  end;
end;

{ TSolution }

function TSolution.numSquares(n: integer): integer;
type
  TPair = record
    a: integer;
    b: integer;
  end;
  TQueue_pair = specialize TQueue<TPair>;

  function __pair__(a, b: integer): TPair;
  begin
    Result.a := a;
    Result.b := b;
  end;

var
  q: TQueue_pair;
  p: TPair;
  visited: TArr_bool;
  num, step, i, a: integer;
begin
  if n = 0 then Exit(0);

  q := TQueue_pair.Create;
  try
    q.EnQueue(__pair__(n, 0));

    SetLength(visited, n + 1);
    visited[n] := true;

    while not q.IsEmpty do
    begin
      p := q.DeQueue;
      num := p.a;
      step := p.b;

      i := 1;
      while num - i * i >= 0 do
      begin
        a := num - i * i;
        if not visited[a] then
        begin
          if a = 0 then Exit(step);

          q.EnQueue(__pair__(a, step + 1));
          visited[a] := true;
        end;

        i += 1;
      end;
    end;

    Result := step;
  finally
    q.Free;
  end;
end;

end.
