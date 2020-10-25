unit Chapter06._07_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Interfaces,
  DeepStar.Utils,
  DeepStar.DSA.Tree.PriorityQueue;

// 347. Top K Frequent Elements
// https://leetcode.com/problems/top-k-frequent-elements/description/
// 时间复杂度: O(nlogk)
// 空间复杂度: O(n + k)
type
  TSolution = class(TObject)
  public
    function topKFrequent(a: TArr_int; k: integer): TList_int;
  end;

procedure Main;

implementation

procedure Main;
var
  a: TArr_int;
  k: integer;
  l: TList_int;
begin
  with TSolution.Create do
  begin
    a := [1, 1, 1, 2, 2, 3];
    k := 2;
    l := topKFrequent(a, k);
    TArrayUtils_int.Print(l.ToArray);
    l.Free;

    a := [1];
    k := 1;
    l := topKFrequent(a, k);
    TArrayUtils_int.Print(l.ToArray);
    l.Free;

    Free;
  end;
end;

{ TSolution }

function TSolution.topKFrequent(a: TArr_int; k: integer): TList_int;
type
  TPair = TMap_int_int.TPair;
  TImpl_pair = specialize TImpl<TPair>;
  TPQ_pair = specialize TPriorityQueue<TPair>;

  function cmp(constref a, b: TMap_int_int.TPair): integer;
  begin
    Result := a.Value - b.Value;
  end;

var
  map: TMap_int_int;
  i: integer;
  pq: TPQ_pair;
  e: TPair;
  res: TList_int;
begin
  Assert(k > 0);

  map := TMap_int_int.Create;
  try
    for i := 0 to High(a) do
    begin
      if not map.ContainsKey(a[i]) then
        map.Add(a[i], 1)
      else
        map.Add(a[i], map.GetItem(a[i]) + 1);
    end;

    pq := TPQ_pair.Create(TImpl_pair.TCmp.Construct(TImpl_pair.TComparisonFuncs(@cmp)));
    try
      for e in map.Pairs do
      begin
        if pq.Count >= k then
        begin
          if e.Value > pq.Peek.Value then
            pq.DeQueue;
        end
        else
          pq.EnQueue(TPair.Create(e.Key, e.Value));
      end;

      res := TList_int.Create;
      while not pq.IsEmpty do
      begin
        e := pq.DeQueue;

        res.AddFirst(e.Key);
      end;

      Result := res;

    finally
      pq.Free;
    end;
  finally
    map.Free;
  end;
end;

end.
