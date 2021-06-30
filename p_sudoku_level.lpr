program p_sudoku_level;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, f_sudoku, f_alternative_grid
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm_Sudoku_Level, Form_Sudoku_Level);
  Application.CreateForm(TForm_AlternativeGrid, Form_AlternativeGrid);
  Application.Run;
end.

