unit Chapter08._05_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.DSA.Linear.ArrayList;

/// 77. Combinations
/// https://leetcode.com/problems/combinations/description/
/// 时间复杂度: O(n^k)
/// 空间复杂度: O(k)
type
  TList_TList_int = specialize TArrayList<TList_int>;

  TSolution = class
  public
    function combine(n, k: integer): TList_TList_int;
  end;

procedure Main;

implementation

procedure Main;
var
  res: TList_TList_int;
  r: TList_int;
  i: integer;
begin
  with TSolution.Create do
  begin
    res := combine(4, 2);

    for i := 0 to res.Count - 1 do
    begin
      r := res[i];
      TArrayUtils_int.Print(r.ToArray);
      r.Free;
    end;

    res.Free;
    Free;
  end;
end;

{ TSolution }

function TSolution.combine(n, k: integer): TList_TList_int;
var
  res: TList_TList_int;
  c: TList_int;

  // 求解 c(n,k), 当前已经找到的组合存储在c中, 需要从start开始搜索新的元素
  procedure __combine__(start: integer);
  var
    i: integer;
  begin
    if c.Count = k then
    begin
      res.AddLast(TList_int.Create(c.ToArray));
      Exit;
    end;

    // 还有k - c.size()个空位, 所以, [i...n] 中至少要有 k - c.size() 个元素
    // i最多为 n - (k - c.size()) + 1
    for i := start to n - (k - c.Count) + 1 do
    begin
      c.AddLast(i);
      __combine__(start + 1);
      c.RemoveLast;
    end;
  end;

begin
  res := TList_TList_int.Create;
  c := TList_int.Create;

  __combine__(1);

  Result := res;
  c.Free;
end;

end.
