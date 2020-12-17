unit Chapter10._02_Solution1;

{$mode objfpc}{$H+}
{$ModeSwitch advancedrecords}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

/// 435. Non-overlapping Intervals
/// https://leetcode.com/problems/non-overlapping-intervals/description/
/// 动态规划
/// 时间复杂度: O(n^2)
/// 空间复杂度: O(n)
type
  TInterval = record
    Start: integer;
    End_: integer;
    constructor Create(newStart: integer; newEnd: integer);
    function Comparer(constref Left, Right: TInterval): integer;
  end;

  TArr_TInterval = array of TInterval;

  TSolution = class(TObject)
  public
    function EraseOverlapIntervals(intervals: TArr_TInterval): integer;

  end;

procedure Main;

implementation

function Comparer(constref Left, Right: integer): integer;
begin
  Result := Right - Left;
end;

procedure Main;
var
  intervals: TArr_TInterval;
  a: TArr_int;
begin
  a := [8, 4, 5, 3, 10];
  TArrayUtils_int.Sort(a, TArrayUtils_int.TCmp_T.Construct(@Comparer));


  with TSolution.Create do
  begin
    intervals := [
      TInterval.Create(1, 2),
      TInterval.Create(2, 3),
      TInterval.Create(3, 4),
      TInterval.Create(1, 3)];
    WriteLn(EraseOverlapIntervals(intervals));

    intervals := [
      TInterval.Create(1, 2),
      TInterval.Create(1, 2),
      TInterval.Create(1, 2)];
    WriteLn(EraseOverlapIntervals(intervals));

    intervals := [
      TInterval.Create(1, 2),
      TInterval.Create(2, 3)];
    WriteLn(EraseOverlapIntervals(intervals));

    Free;
  end;
end;

{ TInterval }

constructor TInterval.Create(newStart: integer; newEnd: integer);
begin
  Start := newStart;
  End_ := newEnd;
end;

function TInterval.Comparer(constref Left, Right: TInterval): integer;
begin
  if Left.Start <> Right.Start then
  begin
    Result := Left.Start - Right.Start;
    Exit;
  end;

  Result := Left.Start - Right.Start;
end;

{ TSolution }

function TSolution.EraseOverlapIntervals(intervals: TArr_TInterval): integer;
type
  TArrayUtils_TInterval = specialize TArrayUtils<TInterval>;
  TCmp = TArrayUtils_TInterval.TCmp_T;
  TCmpFunc = TArrayUtils_TInterval.TComparisonFunc_T;
var
  cmp: TCmpFunc;
  memo: TArr_int;
  res, i, j: integer;
begin
  if Length(intervals) = 0 then
    Exit(0);

  cmp := TCmpFunc(@TInterval.Comparer);
  TArrayUtils_TInterval.Sort(intervals, TCmp.Construct(cmp));

  // memo[i]表示以intervals[i]为结尾的区间能构成的最长不重叠区间序列
  SetLength(memo, Length(intervals));
  TArrayUtils_int.FillArray(memo, 1);

  for i := 1 to High(intervals) do
    // memo[i]
    for j := 0 to i - 1 do
      if intervals[i].Start >= intervals[j].End_ then
        memo[i] := Max(memo[i], 1 + memo[j]);

  res := 0;
  for i := 0 to High(memo) do
    res := Max(res, memo[i]);

  Result := Length(intervals) - res;
end;

end.




