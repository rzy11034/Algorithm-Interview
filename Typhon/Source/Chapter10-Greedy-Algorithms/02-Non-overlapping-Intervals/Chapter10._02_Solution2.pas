unit Chapter10._02_Solution2;

{$mode objfpc}{$H+}
{$ModeSwitch advancedrecords}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

/// 435. Non-overlapping Intervals
/// https://leetcode.com/problems/non-overlapping-intervals/description/
/// 贪心算法
/// 时间复杂度: O(n)
/// 空间复杂度: O(n)
type
  TInterval = record
    Start: integer;
    End_: integer;
    constructor Create(newStart: integer; newEnd: integer);
    class function Comparer(constref Left, Right: TInterval): integer; static;
  end;

  TArr_TInterval = array of TInterval;

  TSolution = class(TObject)
  public
    function EraseOverlapIntervals(intervals: TArr_TInterval): integer;
  end;

procedure Main;

implementation

procedure Main;
var
  intervals: TArr_TInterval;
begin
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

{ TSolution }

function TSolution.EraseOverlapIntervals(intervals: TArr_TInterval): integer;
type
  TArrayUtils_TInterval = specialize TArrayUtils<TInterval>;
  TCmp = TArrayUtils_TInterval.TCmp_T;
  TCmpFunc = TArrayUtils_TInterval.TComparisonFunc_T;
var
  cmp: TCmpFunc;
  res, i, pre: integer;
begin
  if Length(intervals) = 0 then
    Exit(0);

  cmp := TCmpFunc(@TInterval.Comparer);
  TArrayUtils_TInterval.Sort(intervals, TCmp.Construct(cmp));

  res := 1;
  pre := 0;
  for i := 1 to High(intervals) do
  begin
    if intervals[i].Start >= intervals[pre].End_ then
    begin
      res += 1;
      pre := i;
    end;
  end;

  Result := Length(intervals) - res;
end;

{ TInterval }

constructor TInterval.Create(newStart: integer; newEnd: integer);
begin
  Start := newStart;
  End_ := newEnd;
end;

class function TInterval.Comparer(constref Left, Right: TInterval): integer;
begin
  Result := Left.End_ - Right.End_;

  if Result = 0 then
    Result := Left.Start - Right.Start;
end;

end.
