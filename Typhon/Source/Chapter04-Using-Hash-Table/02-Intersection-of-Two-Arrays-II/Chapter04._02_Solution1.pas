unit Chapter04._02_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

// 350. Intersection of Two Arrays II
// https://leetcode.com/problems/intersection-of-two-arrays-ii/description/
// 时间复杂度: O(nlogn)
// 空间复杂度: O(n)
type
  TSolution = class(TObject)
  public
    function Intersect(nums1, nums2: TArr_int): TArr_int;
  end;

procedure Main;

implementation

procedure Main;
var
  ret: TArr_int;
begin

  with TSolution.Create do
  begin
    ret := Intersect([1, 2, 2, 1], [2, 2]);
    Free;
  end;

  TArrayUtils_int.Print(ret);
end;

{ TSolution }

function TSolution.Intersect(nums1, nums2: TArr_int): TArr_int;
var
  recordMap: TMap_int_int;
  resultList: TList_int;
  i,x: integer;
begin
  recordMap := TMap_int_int.Create(10);
  for i := 0 to High(nums1) do
  begin
    x := nums1[i];

    if recordMap.ContainsKey(x) then
      recordMap.SetItem(nums1[i], recordMap.GetItem(nums1[i]) + 1)
    else
      recordMap.Add(nums1[i], 1);
  end;

  resultList := TList_int.Create;
  for i := 0 to High(nums2) do
  begin
    if recordMap.ContainsKey(nums2[i]) and (recordMap.GetItem(nums2[i]) > 0) then
    begin
      recordMap.SetItem(nums2[i], recordMap.GetItem(nums2[i]) - 1);
      resultList.AddLast(nums2[i]);
    end;
  end;

  Result := resultList.ToArray;
end;

end.
