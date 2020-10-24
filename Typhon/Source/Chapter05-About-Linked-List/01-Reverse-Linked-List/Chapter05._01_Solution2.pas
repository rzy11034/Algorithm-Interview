unit Chapter05._01_Solution2;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  AI.ListNode;

// 206. Reverse Linked List
// https://leetcode.com/problems/reverse-linked-list/description/
// 时间复杂度: O(n)
// 空间复杂度: O(1)
type
  TSolution = class(TObject)
  public
    function reverseList(head: TListNode): TListNode;
  end;

implementation

{ TSolution }

function TSolution.reverseList(head: TListNode): TListNode;
var
  ret: TListNode;
begin
  if (head = nil) or (head.Next = nil) then
  begin
    Result := head;
    Exit;
  end;

  ret := reverseList(head.Next);

  // head->next 此刻指向 head 后面的链表的尾节点
  // head->next->next = head 把 head 节点放在了尾部
  head.Next.Next := head;
  head.Next := nil;

  Result := ret;
end;

end.
