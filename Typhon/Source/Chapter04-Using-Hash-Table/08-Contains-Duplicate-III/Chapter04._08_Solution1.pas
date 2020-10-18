unit Chapter04._08_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Tree.TreeSet,
  DeepStar.Utils;

// 220. Contains Duplicate III
// https://leetcode.com/problems/contains-duplicate-iii/description/
// 时间复杂度: O(nlogk)
// 空间复杂度: O(k)
type
  TSolution = class(TObject)
  public
    function containsNearbyAlmostDuplicate(nums: TArr_int; k, t: integer): boolean;
  end;

  TSet_int = specialize TTreeSet<integer>;

procedure Main;

implementation

procedure Main;
begin

end;

{ TSolution }

function TSolution.containsNearbyAlmostDuplicate(nums: TArr_int; k, t: integer): boolean;
var
  recordSet: TSet_int;
  i: integer;
begin
  recordSet := TSet_int.Create;

  for i := 0 to High(nums) do
  begin
    if recordSet.Contains(nums[i]) then
      Exit(true);

    recordSet.Add(nums[i]);
    if recordSet.Count = k + 1 then
      recordSet.Remove(nums[i - k]);
  end;

  Result := false;

  recordSet.Free;
end;

end.
