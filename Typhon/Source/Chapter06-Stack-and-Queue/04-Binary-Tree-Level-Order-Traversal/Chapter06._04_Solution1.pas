unit Chapter06._04_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.DSA.Linear.ArrayList,
  DeepStar.DSA.Linear.Queue,
  AI.TreeNode;

/// 102. Binary Tree Level Order Traversal
/// https://leetcode.com/problems/binary-tree-level-order-traversal/description/
/// 二叉树的层序遍历
/// 时间复杂度: O(n), n为树的节点个数
/// 空间复杂度: O(n)
type
  TList_int_int = specialize TArrayList<TList_int>;

  TSolution = class(TObject)
  public
    function levelOrder(root: TTreeNode): TList_int_int;
  end;

procedure Main;

implementation

procedure Main;
var
  a: TArr_int;
  t: TTreeNode;
  l: TList_int_int;
  i: integer;
begin
  a := [9, 3, 20, 15, 7];
  t := TTreeNode.Create(a);

  with TSolution.Create do
  begin
    l := levelOrder(t);

    for i := 0 to l.Count - 1 do
      TArrayUtils_int.Print(l[i].ToArray);

    for i := 0 to l.Count-1 do
      l[i].Free;

    l.Free;
    Free;
  end;

  t.ClearAndFree;
end;

{ TSolution }

function TSolution.levelOrder(root: TTreeNode): TList_int_int;
type
  TPair = record
    node: TTreeNode;
    level: integer;
  end;
  TQueue_pair = specialize TQueue<TPair>;

  function __Pair__(node: TTreeNode; level: integer): TPair;
  begin
    Result.node := node;
    Result.level := level;
  end;

var
  queue: TQueue_pair;
  res: TList_int_int;
  pair: TPair;
  level: integer;
  cur: TTreeNode;
begin
  if root = nil then
    Exit(nil);

  res := TList_int_int.Create;
  queue := TQueue_pair.Create;
  queue.EnQueue(__Pair__(root, 0));

  while not queue.IsEmpty do
  begin
    pair := queue.DeQueue;
    level := pair.level;
    cur := pair.node;

    if level = res.Count then
      res.AddLast(TList_int.Create);

    res[level].AddLast(cur.Val);

    if cur.Left <> nil then
      queue.EnQueue(__Pair__(cur.Left, level + 1));

    if cur.Right <> nil then
      queue.EnQueue(__Pair__(cur.Right, level + 1));
  end;

  Result := res;
  queue.Free;
end;

end.
