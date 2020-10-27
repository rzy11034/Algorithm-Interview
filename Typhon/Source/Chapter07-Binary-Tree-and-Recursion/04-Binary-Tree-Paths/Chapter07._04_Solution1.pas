unit Chapter07._04_Solution1;

{$mode objfpc}{$H+}
{$WARN 4104 off : Implicit string type conversion from "$1" to "$2"}
interface

uses
  Classes,
  SysUtils,
  AI.TreeNode,
  DeepStar.Utils;

/// 257. Binary Tree Paths
/// https://leetcode.com/problems/binary-tree-paths/description/
/// 时间复杂度: O(n), n为树中的节点个数
/// 空间复杂度: O(h), h为树的高度
type
  TSolution = class(TObject)
  public
    function binaryTreePaths(root: TTreeNode): TList_str;
  end;

procedure Main;

implementation

procedure Main;
var
  a: TArr_int;
  t: TTreeNode;
  listStr: TList_str;
  i: integer;
begin
  a := [9, 3, 20, 15, 7];
  t := TTreeNode.Create(a);

  with TSolution.Create do
  begin
    listStr := binaryTreePaths(t);

    for i := 0 to listStr.Count-1 do
      WriteLn(listStr[i]);

    listStr.Free;
    Free;
  end;

  t.ClearAndFree;
end;

{ TSolution }

function TSolution.binaryTreePaths(root: TTreeNode): TList_str;
var
  res, lstr, rstr: TList_str;
  i: integer;
begin
  res := TList_str.Create;
  if root = nil then Exit(res);

  if (root.Left = nil) and (root.Right = nil) then
    res.AddLast(root.Val.ToString);

  lstr := binaryTreePaths(root.Left);
  for i := 0 to lstr.Count - 1 do
    res.AddLast(root.Val.ToString + '->' + lstr[i]);
  lstr.Free;

  rstr := binaryTreePaths(root.Right);
  for i := 0 to rstr.Count - 1 do
    res.AddLast(root.Val.ToString + '->' + rstr[i]);
  rstr.Free;

  Result := res;
end;

end.
