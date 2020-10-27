unit Chapter07._06_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  AI.TreeNode,
  DeepStar.Utils;

//235. Lowest Common Ancestor of a Binary Search Tree
//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/description/
//时间复杂度: O(lgn), 其中n为树的节点个数
//空间复杂度: O(h), 其中h为树的高度
type
  TSolution = class(TObject)
  public
    function lowestCommonAncestor(root, p, q: TTreeNode): TTreeNode;
  end;

procedure Main;

implementation

procedure Main;
var
  a: TArr_int;
  root, p, q, res: TTreeNode;
begin
  a := [6, 2, 8, 0, 4, 7, 9, 3, 5];

  with TSolution.Create do
  begin
    root := TTreeNode.Create(a);

    p := TTreeNode.Create(2);
    q := TTreeNode.Create(8);
    res := lowestCommonAncestor(root, p, q);
    WriteLn(res.Val);
    q.Free;
    p.Free;

    p := TTreeNode.Create(2);
    q := TTreeNode.Create(4);
    res := lowestCommonAncestor(root, p, q);
    WriteLn(res.Val);

    q.Free;
    p.Free;
    root.ClearAndFree;
    Free;
  end;
end;

{ TSolution }

function TSolution.lowestCommonAncestor(root, p, q: TTreeNode): TTreeNode;
begin
  if (p = nil) or (q = nil) then
    raise Exception.Create('p or q can not be null.');

  if root = nil then
    Exit(nil);

  if (p.Val < root.Val) and (q.Val < root.Val) then
    Exit(lowestCommonAncestor(root.Left, p, q));
  if (p.Val > root.Val) and (q.Val > root.Val) then
    Exit(lowestCommonAncestor(root.Right, p, q));

  Result := root;
end;

end.
