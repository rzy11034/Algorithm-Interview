unit Chapter06._01_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.UString;

// 20. Valid Parentheses
// https://leetcode.com/problems/valid-parentheses/description/
// 时间复杂度: O(n)
// 空间复杂度: O(n)
type
  TSolution = class(TObject)
  public
    function isValid(s: UString): boolean;
  end;

procedure Main;

implementation

procedure Main;
begin
  with TSolution.Create do
  begin
    WriteLn(isValid('()'));
    WriteLn(isValid('()[]{}'));
    WriteLn(isValid('(]'));
    WriteLn(isValid('([)]'));
    Free;
  end;
end;

{ TSolution }

function TSolution.isValid(s: UString): boolean;
var
  stack: TStack_chr;
  i: integer;
  match, c: UChar;
begin
  stack := TStack_chr.Create;
  try
    for i := 0 to Length(s) - 1 do
    begin
      if (s.Chars[i] = '(') or (s.Chars[i] = '[') or (s.Chars[i] = '{') then
        stack.Push(s.Chars[i])
      else
      begin
        if stack.IsEmpty then Exit(false);

        if s.Chars[i] = ')' then
          match := '('
        else if s.Chars[i] = ']' then
          match := '['
        else
          match := '{';


        c := stack.Pop;

        if c <> match then Exit(false);
      end;
    end;

    Result := stack.IsEmpty;
  finally
    stack.Free;
  end;
end;

end.
