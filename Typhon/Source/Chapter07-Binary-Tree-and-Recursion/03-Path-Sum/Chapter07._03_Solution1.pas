unit Chapter07._03_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  AI.TreeNode;

/// 112. Path Sum
/// https://leetcode.com/problems/path-sum/description/
/// 时间复杂度: O(n), n为树的节点个数
/// 空间复杂度: O(h), h为树的高度
type
  TSolution = class(TObject)
  public
    function hasPathSum(root: TTreeNode; sum: integer): boolean;
  end;

procedure Main;

implementation

procedure Main;
begin

end;

{ TSolution }

function TSolution.hasPathSum(root: TTreeNode; sum: integer): boolean;
begin
  if root = nil then
    Exit(false);

  if (root.Left = nil) and (root.Right = nil) then
    Exit(sum = root.Val);

  Result := hasPathSum(root.Left, sum - root.Val) or
    hasPathSum(root.Right, sum - root.Val);
end;

end.
