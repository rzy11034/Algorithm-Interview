unit Chapter05.ListNode;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.Utils.UString;

type
  TListNode = class
  public
    Val: integer;
    Next: TListNode;

    constructor Create(x: integer);
    constructor Create(arr: TArr_int);
    destructor Destroy; override;

    function ToString: UString; reintroduce;
    procedure Clear;
  end;

implementation

{ TListNode }

constructor TListNode.Create(x: integer);
begin
  Val := x;
  Next := nil;
end;

constructor TListNode.Create(arr: TArr_int);
var
  cur: TListNode;
  i: integer;
begin
  Assert(arr <> nil);

  Self.Val := arr[0];

  cur := self;
  for i := 1 to High(arr) do
  begin
    cur.Next := TListNode.Create(arr[i]);
    cur := cur.Next;
  end;
end;

procedure TListNode.Clear;
var
  cur, del: TListNode;
begin
  cur := Self;
  while cur.Next <> nil do
  begin
    del := cur.Next;
    cur.Next := del.Next;
    FreeAndNil(del);
  end;
end;

destructor TListNode.Destroy;
begin
  inherited Destroy;
end;

function TListNode.ToString: UString;
var
  sb: TStringBuilder;
  cur: TListNode;
begin
  Assert(Self <> nil);
  sb := TStringBuilder.Create;

  cur := Self;
  while cur <> nil do
  begin
    sb.Append(cur.Val.ToString);

    if cur.Next <> nil then
      sb.Append(', ');

    cur := cur.Next;
  end;

  Result := UString(sb.ToString);
  sb.Free;
end;

end.
