unit Chapter05._01_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils, AI.ListNode;

// 206. Reverse Linked List
// https://leetcode.com/problems/reverse-linked-list/description/
// 时间复杂度: O(n)
// 空间复杂度: O(1)
type
  TSolution = class(TObject)
  public
    function reverseList(var head: TListNode): TListNode;
  end;

implementation

{ TSolution }

function TSolution.reverseList(var head: TListNode): TListNode;
var
  pre, cur, Next: TListNode;
begin
  pre := nil;
  cur := head;

  while cur <> nil do
  begin
    Next := cur.Next;

    cur.Next := pre;
    pre := cur;
    cur := Next;
  end;

  head := pre;
  Result := pre;
end;

end.
