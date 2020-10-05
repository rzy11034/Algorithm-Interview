program Algorithm_Interview;

{$APPTYPE CONSOLE}

{$R *.res}


uses
  System.SysUtils,
  DeepStar.Utils,
  AI.Main in 'Source\AI.Main.pas',
  AI.Utils in 'Source\AI.Utils.pas',
  Chapter02._02_Main in 'Source\Chapter02-Time_Complexity\02-Time-Complexity-Basic\Chapter02._02_Main.pas',
  Chapter02._02_Main2 in 'Source\Chapter02-Time_Complexity\02-Time-Complexity-Basic\Chapter02._02_Main2.pas',
  Chapter02._03_Main in 'Source\Chapter02-Time_Complexity\03-Common-Code-for-Time-Complexity\Chapter02._03_Main.pas',
  Chapter02._04_Main in 'Source\Chapter02-Time_Complexity\04-Time-Complexity-Experiments\Chapter02._04_Main.pas',
  Chapter02._04_Main2 in 'Source\Chapter02-Time_Complexity\04-Time-Complexity-Experiments\Chapter02._04_Main2.pas',
  Chapter02._04_Main3 in 'Source\Chapter02-Time_Complexity\04-Time-Complexity-Experiments\Chapter02._04_Main3.pas',
  Chapter02._04_Main4 in 'Source\Chapter02-Time_Complexity\04-Time-Complexity-Experiments\Chapter02._04_Main4.pas',
  Chapter02._05_Main in 'Source\Chapter02-Time_Complexity\05-Recursion-Time-Complexity\Chapter02._05_Main.pas',
  Chapter02._05_Main2 in 'Source\Chapter02-Time_Complexity\05-Recursion-Time-Complexity\Chapter02._05_Main2.pas',
  Chapter02._06_MyVector in 'Source\Chapter02-Time_Complexity\06-Amortized-Time\Chapter02._06_MyVector.pas',
  Chapter02._07_MyVector in 'Source\Chapter02-Time_Complexity\07-Amortized-Time-2\Chapter02._07_MyVector.pas';

begin
  try
    Run;
    DrawLineProgramEnd;
    Writeln(END_OF_PROGRAM_EN);
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
