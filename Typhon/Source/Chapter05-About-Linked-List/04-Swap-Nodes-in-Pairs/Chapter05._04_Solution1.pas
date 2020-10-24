unit Chapter05._04_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  AI.ListNode,
  DeepStar.Utils;

// 24. Swap Nodes in Pairs
// https://leetcode.com/problems/swap-nodes-in-pairs/description/
// 时间复杂度: O(n)
// 空间复杂度: O(1)
type
  TSolution = class(TObject)
  public
    function swapPairs(var head: TListNode): TListNode;
  end;

procedure Main;

implementation

procedure Main;
var
  head: TListNode;
  a: TArr_int;
begin
  a := [1, 2, 3, 4];
  head := TListNode.Create(a);
  WriteLn(head.ToString);

  with TSolution.Create do
  begin
    head := swapPairs(head);
    WriteLn(head.ToString);
    Free;
  end;

  head.CLearAndFree;
end;

{ TSolution }

function TSolution.swapPairs(var head: TListNode): TListNode;
var
  dummyHead: TListNode;
  p, node1, node2, Next: TListNode;
begin
  dummyHead := TListNode.Create(0);
  dummyHead.Next := head;
  p := dummyHead;

  while (p.Next <> nil) and (p.Next.Next <> nil) do
  begin
    node1 := p.Next;
    node2 := node1.Next;
    Next := node2.Next;

    node2.Next := node1;
    node1.Next := Next;
    p.Next := node2;
    p := node1;
  end;

  Result := dummyHead.Next;
  FreeAndNil(dummyHead);
end;

end.
