unit Chapter08._01_02_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.UString,
  DeepStar.Utils;

// 17. Letter Combinations of a Phone Number
// https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/
// 时间复杂度: O(2^len(s))
// 空间复杂度: O(len(s))
type
  TSolution = class(TObject)
  public
    function letterCombinations(digits: UString): TList_str;
  end;

procedure Main;

implementation

procedure Main;
var
  res: TList_str;
begin
  with TSolution.Create do
  begin
    res := letterCombinations('22');
    TArrayUtils_str.Print(res.ToArray);

    res.Free;
    Free;
  end;
end;

{ TSolution }

function TSolution.letterCombinations(digits: UString): TList_str;
const
  letterMap: TArr_str = (
    ' ',    //0
    '',     //1
    'abc',  //2
    'def',  //3
    'ghi',  //4
    'jkl',  //5
    'mno',  //6
    'pqrs', //7
    'tuv',  //8
    'wxyz');  //9
var
  res: TList_str;

  // s中保存了此时从digits[0...index-1]翻译得到的一个字母字符串
  // 寻找和digits[index]匹配的字母, 获得digits[0...index]翻译得到的解
  procedure __findCombination__(digits: UString; index: integer; s: UString);
  var
    c: UChar;
    letters: UString;
    i: integer;
  begin
    if index = digits.Length then
    begin
      res.AddLast(s);
      Exit;
    end;

    c := digits.Chars[index];
    letters := letterMap[Ord(c) - Ord('0')];

    for i := 0 to letters.Length - 1 do
    begin
      __findCombination__(digits, index + 1, s + letters.Chars[i]);
    end;
  end;

begin
  res := TList_str.Create;
  if digits = '' then
    Exit(res);

  __findCombination__(digits, 0, '');
  Result := res;
end;

end.
