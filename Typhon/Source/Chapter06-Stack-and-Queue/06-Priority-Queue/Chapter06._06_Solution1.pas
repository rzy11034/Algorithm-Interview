unit Chapter06._06_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils, DeepStar.DSA.Interfaces,
  DeepStar.DSA.Tree.PriorityQueue;

procedure Main;

implementation

type
  TImpl_int = specialize TImpl<integer>;
  TPQ_int = specialize TPriorityQueue<integer>;

function bool(constref Left, Right: integer): integer;
begin
  Result := Left mod 10 - Right mod 10;
end;

procedure Main;
var
  pq1, pq2: TPQ_int;
  num, i: integer;
begin
  Randomize;

  pq1 := TPQ_int.Create;
  for i := 0 to 9 do
  begin
    num := Random(100);
    pq1.EnQueue(num);
    WriteLn('insert ', num, ' in priority queue.');
  end;

  while not pq1.IsEmpty do
  begin
    Write(pq1.DeQueue, ' ');
  end;
  WriteLn;
  pq1.Free;

  // 使用TComparisonFuncs的priority queue, 底层是最小堆
  pq2 := TPQ_int.Create(TImpl_int.TCmp.Construct(@bool));
  for i := 0 to 9 do
  begin
    num := Random(100);
    pq2.EnQueue(num);
    WriteLn('insert ', num, ' in priority queue.');
  end;

  while not pq2.IsEmpty do
  begin
    Write(pq2.DeQueue, ' ');
  end;
  WriteLn;
  pq2.Free;
end;

end.
