unit Chapter04._01_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

// 349. Intersection of Two Arrays
// https://leetcode.com/problems/intersection-of-two-arrays/description/
// 时间复杂度: O(nlogn)
// 空间复杂度: O(n)
type
  TSolution = class(TObject)
  public
    function Intersection(nums1, nums2: TArr_int): TArr_int;
  end;

procedure Main;

implementation

procedure Main;
var
  ret: TArr_int;
begin

  with TSolution.Create do
  begin
    ret := Intersection([1, 2, 2, 1], [2, 2]);
    Free;
  end;

  TArrayUtils_int.Print(ret);
end;

{ TSolution }

function TSolution.Intersection(nums1, nums2: TArr_int): TArr_int;
var
  recordSet, resultSet: TSet_int;
  i: integer;
begin
  recordSet := TSet_int.Create;
  for i := 0 to High(nums1) do
    recordSet.Add(nums1[i]);

  resultSet := TSet_int.Create;
  for i := 0 to High(nums2) do
  begin
    if recordSet.Contains(nums2[i]) then
      resultSet.Add(nums2[i]);
  end;

  Result := resultSet.ToArray;
end;

end.
