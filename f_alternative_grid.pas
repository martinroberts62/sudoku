unit f_alternative_grid;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids;

type

  { TForm_AlternativeGrid }

  TForm_AlternativeGrid = class(TForm)
    GroBox_CharacterGrid         : TGroupBox;

      GroBox_AlternativeCharacter     : TGroupBox;
        Edi_Alternative_Characters    : TEdit;
        StrGri_Alternative_Characters : TStringGrid;
        But_Alternative_OK            : TButton;

    procedure FormActivate(Sender: TObject);

    procedure RadBut_Alternative_CharactersClick (Sender: TObject);

    procedure Edi_Alternative_CharactersKeyPress (Sender: TObject ;
                                                var Key: char    );

    procedure But_Alternative_OKClick(Sender: TObject);





    procedure P_PutCharactersInToStringGrid ( PStrGri_DefaultCharacters : TStringGrid;
                                              PCha_Character            : char );

    procedure P_EmptyGrid ( PStrGri_EmptyGrid : TStringGrid );

    procedure P_WriteToTextFile ( PStr_FileName : string;
                                  PStr_FirstAndLastCharacters: String );



  private

  public
  const
  G_DEFAULT_CHARACTER = 'A';
  G_BACKSPACE = #8; G_RETURN = #13; G_ESCAPE = #27; G_SPACE = #32;

  end;

var
  Form_AlternativeGrid: TForm_AlternativeGrid;

implementation
uses f_sudoku;
{$R *.lfm}

procedure TForm_AlternativeGrid.FormActivate(Sender: TObject);
begin
  Edi_Alternative_Characters.Enabled:=true;
  Edi_Alternative_Characters.SetFocus;
end; // FormActivate //

procedure TForm_AlternativeGrid.RadBut_Alternative_CharactersClick(Sender: TObject);
begin

  Edi_Alternative_Characters.Enabled:=true;
  Edi_Alternative_Characters.SetFocus;

end; // RadBut_Alternative_Characters //


procedure TForm_AlternativeGrid.Edi_Alternative_CharactersKeyPress(Sender: TObject;
  var Key: char);
begin
    if key in [G_BACKSPACE,G_RETURN,G_ESCAPE,G_SPACE,'0'..'9','A','a']
     then
       begin
         key := #0;
         P_EmptyGrid ( StrGri_Alternative_Characters );
       end
     else
       P_PutCharactersInToStringGrid ( StrGri_Alternative_Characters, upcase(Key)) ;

   But_Alternative_OK.enabled := true;

end;

procedure TForm_AlternativeGrid.But_Alternative_OKClick(Sender: TObject);
begin

    GStr_FirstAndLastCharacters := StrGri_Alternative_Characters.Cells[1,1] +
                                   StrGri_Alternative_Characters.Cells[9,1];


    P_WriteToTextFile ( 'FirstAndLastCharacters.txt',
                         GStr_FirstAndLastCharacters);

    Edi_Alternative_Characters.Text:='';

    Form_Sudoku_level.MenuItem_Char.Caption := '( ' +
                         GStr_FirstAndLastCharacters[1] + ' - ' +
                         GStr_FirstAndLastCharacters[2] + ' )';



    Form_Sudoku_level.MenuItem_1_to_9.Checked:=true;
    Form_Sudoku_level.MenuItem_Char.Checked:=false;

    Form_Sudoku_level.Show;
end; // But_Alternative_OK //

{ ************************************* }
{                  Start                }
{ User Defined Procedures and Functions }
{ ************************************* }

procedure TForm_AlternativeGrid.P_PutCharactersInToStringGrid (
                                       PStrGri_DefaultCharacters : TStringGrid;
                                       PCha_Character            : char );
var
  LArrSinStr_Characters : array [1..9] of string;
  LByt_Ascii,LByt_AsciiLoop : byte;


begin
  with PStrGri_DefaultCharacters do
    begin
      LByt_Ascii := ord( PCha_Character )-1;

      for LByt_AsciiLoop := 1 to 9 do
        begin
          LByt_Ascii := LByt_Ascii + 1;
          LArrSinStr_Characters[LByt_AsciiLoop] := chr(LByt_Ascii);
        end; // LByt_AsciiLoop //

      for LByt_AsciiLoop := 1 to 9 do
        Cells[LByt_AsciiLoop,1] := LArrSinStr_Characters[LByt_AsciiLoop]
    end; // with PStrGri_DefaultCharacters //

end; // P_PutCharactersInToStringGrid //

procedure TForm_AlternativeGrid.P_EmptyGrid ( PStrGri_EmptyGrid : TStringGrid );
const
  L_EMPTY_CELL = '';
var
   LByt_Across, LByt_Down : byte;
begin
  with PStrGri_EmptyGrid do
    begin
      if VisibleRowCount = 1
        then
          for LByt_Across := 1 to 9 do
           cells[LByt_Across,1] := L_EMPTY_CELL
        else
           for LByt_Across := 1 to 9 do
             for LByt_Down := 1 to 9 do
               cells[LByt_Down,LByt_Across] := L_EMPTY_CELL;

    end; // with PStrGri_EmptyGrid //

end; // P_EmptyGrid //   }

procedure TForm_AlternativeGrid.P_WriteToTextFile ( PStr_FileName : string;
                                          PStr_FirstAndLastCharacters: String );
var
  LStr_FileName    : string;
  LTexFil_FileName : TextFile;
begin
  LStr_FileName := GetCurrentDir + '\First_And_Last_Char\' +PStr_FileName;

  AssignFile(LTexFil_FileName,LStr_FileName);
  ReWrite (LTexFil_FileName);
  WriteLn (LTexFil_FileName, PStr_FirstAndLastCharacters);
  CloseFile (LTexFil_FileName);

end; // P_WriteToTextFile //

end.

