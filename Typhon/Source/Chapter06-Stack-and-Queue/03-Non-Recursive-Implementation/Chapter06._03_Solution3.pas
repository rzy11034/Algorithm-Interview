unit Chapter06._03_Solution3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,AI.TreeNode,
  DeepStar.Utils,
  DeepStar.DSA.Linear.Stack;

/// 145. Binary Tree Postorder Traversal
/// https://leetcode.com/problems/binary-tree-postorder-traversal/description/
/// 非递归的二叉树的后序遍历
/// 时间复杂度: O(n), n为树的节点个数
/// 空间复杂度: O(h), h为树的高度
type
  TSolution = class(TObject)
  public
    function postorderTraversal(root: TTreeNode): TList_int;
  end;

procedure Main;

implementation

procedure Main;
var
  a: TArr_int;
  l: TList_int;
  t: TTreeNode;
begin
  a := [1,3,2];
  TArrayUtils_int.Print(a);
  t := TTreeNode.Create(a);

  with TSolution.Create do
  begin
    l := postorderTraversal(t);
    TArrayUtils_int.Print(l.ToArray);
    Free;
  end;

  l.Free;
  t.ClearAndFree;
end;

{ TSolution }

function TSolution.postorderTraversal(root: TTreeNode): TList_int;
type
  TCmdType = (go, print);
  TCmd = record
    node: TTreeNode;
    cmdType: TCmdType;
  end;

  TStack_TreeNode = specialize TStack<TCmd>;

  function __cmd__(node: TTreeNode; cmdType: TCmdType): TCmd;
  begin
    Result.node := node;
    Result.cmdType := cmdType;
  end;

var
  stack: TStack_TreeNode;
  ret: TList_int;
  cmd: TCmd;
begin
  stack := TStack_TreeNode.Create;
  ret := TList_int.Create;
  stack.Push(__cmd__(root, TCmdType.go));

  while not stack.IsEmpty do
  begin
    cmd := stack.Pop;

    if cmd.cmdType = TCmdType.print then
    begin
      ret.AddLast(cmd.node.Val);
    end
    else
    begin
      stack.Push(__cmd__(cmd.node, TCmdType.print));

      if cmd.node.Right <> nil then
        stack.Push(__cmd__(cmd.node.Right, TCmdType.go));

      if cmd.node.Left <> nil then
        stack.Push(__cmd__(cmd.node.Left, TCmdType.go));
    end;
  end;

  Result := ret;
  stack.Free;
end;

end.

