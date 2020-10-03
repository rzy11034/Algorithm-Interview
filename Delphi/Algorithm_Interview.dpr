program Algorithm_Interview;

{$APPTYPE CONSOLE}

{$R *.res}


uses
  System.SysUtils,
  AI.Main in 'Source\AI.Main.pas',
  AI.Utils in 'Source\AI.Utils.pas',
  Chapter02._02_TimeComplexityBasic.Main in 'Source\Chapter02-Time_Complexity\02-Time-Complexity-Basic\Chapter02._02_TimeComplexityBasic.Main.pas',
  Chapter02._02_TimeComplexityBasic.Main2 in 'Source\Chapter02-Time_Complexity\02-Time-Complexity-Basic\Chapter02._02_TimeComplexityBasic.Main2.pas',
  Chapter02._03_CommonCodeForTimeComplexity.Main in 'Source\Chapter02-Time_Complexity\03-Common-Code-for-Time-Complexity\Chapter02._03_CommonCodeForTimeComplexity.Main.pas',
  Chapter02._04_TimeComplexityExperiments.Main in 'Source\Chapter02-Time_Complexity\04-Time-Complexity-Experiments\Chapter02._04_TimeComplexityExperiments.Main.pas',
  Chapter02._04_TimeComplexityExperiments.Main2 in 'Source\Chapter02-Time_Complexity\04-Time-Complexity-Experiments\Chapter02._04_TimeComplexityExperiments.Main2.pas',
  Chapter02._04_TimeComplexityExperiments.Main3 in 'Source\Chapter02-Time_Complexity\04-Time-Complexity-Experiments\Chapter02._04_TimeComplexityExperiments.Main3.pas',
  Chapter02._04_TimeComplexityExperiments.Main4 in 'Source\Chapter02-Time_Complexity\04-Time-Complexity-Experiments\Chapter02._04_TimeComplexityExperiments.Main4.pas';

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
