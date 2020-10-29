unit Chapter03._08_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils,
  DeepStar.UString;

// 3. Longest Substring Without Repeating Characters
// https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
//
// 滑动窗口
// 时间复杂度: O(len(s))
// 空间复杂度: O(len(charset))

type
  TSolution = class(TObject)
  public
    function LengthOfLongestSubstring(s: UString): integer;
  end;

procedure Main;

implementation

procedure Main;
var
  ret: integer;
begin

  with TSolution.Create do
  begin
    ret := LengthOfLongestSubstring('abcabcbb');
    Free;
  end;

  WriteLn(ret);
end;

{ TSolution }

function TSolution.LengthOfLongestSubstring(s: UString): integer;
var
  freg: TArr_int;
  l, r, ret: integer;
begin
  SetLength(freg, 256);

  //滑动窗口为s[l...r]
  l := 0;
  r := -1;

  ret := 0;

  // 整个循环从 l == 0; r == -1 这个空窗口开始
  // 到l == s.size(); r == s.size()-1 这个空窗口截止
  // 在每次循环里逐渐改变窗口, 维护freq, 并记录当前窗口中是否找到了一个新的最优值
  while l < Length(s) do
  begin
    if (r + 1 < Length(s)) and (freg[Ord(s.Chars[r + 1])] = 0) then
    begin
      r += 1;
      freg[Ord(s.Chars[r])] += 1;
    end
    else
    begin
      freg[Ord(s.Chars[l])] -= 1;
      l += 1;
    end;

    ret := Max(ret, r-l+1);
  end;

  Result := ret;
end;

end.
