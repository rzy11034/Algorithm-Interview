unit Chapter07._02_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  AI.TreeNode;

/// 226. Invert Binary Tree
/// https://leetcode.com/problems/invert-binary-tree/description/
/// 时间复杂度: O(n), n为树中节点个数
/// 空间复杂度: O(h), h为树的高度
type
  TSolution = class(TObject)
  public
    function invertTree(root: TTreeNode): TTreeNode;
  end;

implementation

{ TSolution }

function TSolution.invertTree(root: TTreeNode): TTreeNode;
var
  l, r: TTreeNode;
begin
  if root = nil then Exit(nil);

  l := invertTree(root.Left);
  r := invertTree(root.Right);

  root.Right := l;
  root.Left := r;

  Result := root;
end;

end.
