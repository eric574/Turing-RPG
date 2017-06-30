%Eric's RPG game 
%Class: Mrs. Young's Period 1 Class
 
import GUI %Import the GUI module
 
setscreen("nocursor") 
 
%Following variables are for the texts 
var font, font1, font2, font3, font4, font5, font6, font7, font8, font9, font10, font11, font12, font13, font14 : int
var textbox, textbox1, textbox2, textbox3, textbox4 : int
 
%Following variables are for the ButtonIDs
var InstructionsButtonID, InstructionsButton1ID, InstructionsButton2ID, PlayButtonID, PauseButtonID, ResumeButtonID, QuitButtonID, IntroButtonID, SettingsButtonID, SaveButtonID, CharactersButtonID, MenuButtonID, MenuButton1ID, RestartButtonID, ReturnButtonID, ReturnButton1ID : int 

%Following variables are for the WindowIDs
var Window1ID, Window2ID, Window3ID, Window4ID, Window5ID, Window6ID, Window7ID, Window8ID, Window9ID, Window10ID : int

var Date : string := Time.Date %Used to display the time in the main menu (depends on the date set in your PC) 
 
%Declare all of the songs and sound effects that are to be used in-game -> the PC must have the correct hardware; e.g.: sound card, speaker, etc 
%Seems to only work on school PCs 
var song : string := "RPG Music.mp3" %Used for when the user presses the play or instructions buttons
var punch : string := "Punch.wav" %Used as a sound effect for Hero1, during his punching animation  
var flame : string := "Flame.wav" %Used as a sound effect for Villain1, during his attack &/ rest animation
var flamewhip : string := "FlameWhip.wav" %Used as a sound effect for Hero3, during his whipping attack animation 
var throw1 : string := "Throw1.wav" %Is the first sound effect for Hero2, during his throwing animation
var throw2 : string := "Throw2.wav" %Is the second sound effect for Hero2, during his throwing animation
var throw3 : string := "Throw3.wav" %Is the third sound effect for Hero3, during his throwing animation
var spell1 : string := "Spell.wav" %Is the first sound effect for Villain3, during his attack animation
var spell2 : string := "Fire.wav" %Is the second sound effect for Villain3, during his attack animation
var smash : string := "Weapon Blow.wav" %Used as a sound effect for Villain2, during his axe-swinging animation 

%Following variables are used as the parameters for the sprite procedures
%Alternatively, we can use the Hero... booleans from the character screen in the menu  
var Hero1String : string := "Hero1"
var Hero2String : string := "Hero2"
var Hero3String : string := "Hero3" 
var Villain1String : string := "Villain1"
var Villain2String : string := "Villain2" 
var Villain3String : string := "Villain3" 

%Used in the settings and menu 
var cnt : int := 0
 
%Following booleans are for the collision detection procedure
var limit, MonsterHit, FailtoGenerate : boolean := false
 
%Alternatively, we can use GUI.CreateLabelledFrame and use Mouse.Where to locate mouse coordinates
 
%Following variables are for the character sprites 
%For the first playable character
var Hero1sprite1, Hero1sprite1ID, Hero1sprite2, Hero1sprite2ID, Hero1sprite3, Hero1sprite3ID, Hero1sprite4, Hero1sprite4ID, Hero1sprite5, Hero1sprite5ID, Hero1sprite6, Hero1sprite6ID, Hero1sprite7, Hero1sprite7ID, Hero1sprite8, Hero1sprite8ID, Hero1sprite9, Hero1sprite9ID, Hero1sprite10, Hero1sprite10ID, Hero1sprite11, Hero1sprite11ID, Hero1sprite12, Hero1sprite12ID, Hero1sprite13, Hero1sprite13ID, Hero1sprite14, Hero1sprite14ID, Hero1sprite15, Hero1sprite15ID, Hero1sprite16, Hero1sprite16ID,
Hero1sprite17ID, Hero1sprite17, Hero1sprite18ID, Hero1sprite18, Hero1sprite19ID, Hero1sprite19, Hero1sprite20ID, Hero1sprite20, Hero1sprite21ID, Hero1sprite21, Hero1sprite22ID, Hero1sprite22, Hero1sprite23ID, Hero1sprite23, Hero1sprite24ID, Hero1sprite24, Hero1sprite25ID, Hero1sprite25 : int
 
%For the second playable character
var Hero2sprite1, Hero2sprite1ID, Hero2sprite2, Hero2sprite2ID, Hero2sprite3, Hero2sprite3ID, Hero2sprite4, Hero2sprite4ID, Hero2sprite5, Hero2sprite5ID, Hero2sprite6, Hero2sprite6ID, Hero2sprite7, Hero2sprite7ID, Hero2sprite8, Hero2sprite8ID, Hero2sprite9, Hero2sprite9ID, Hero2sprite10, Hero2sprite10ID, Hero2sprite11, Hero2sprite11ID, Hero2sprite12, Hero2sprite12ID, Hero2sprite13, Hero2sprite13ID,
Hero2sprite14, Hero2sprite14ID, Hero2sprite15, Hero2sprite15ID, Hero2sprite16, Hero2sprite16ID, Hero2sprite17, Hero2sprite17ID, Hero2sprite18, Hero2sprite18ID, Hero2sprite19, Hero2sprite19ID, Hero2sprite20, Hero2sprite20ID, Hero2sprite21, Hero2sprite21ID,
Hero2sprite22, Hero2sprite22ID, Hero2sprite23, Hero2sprite23ID, Hero2sprite24ID, Hero2sprite24, Hero2sprite25, Hero2sprite25ID, Hero2sprite26, Hero2sprite26ID, Hero2sprite27, Hero2sprite27ID, Hero2sprite28, Hero2sprite28ID, Hero2sprite29, Hero2sprite29ID : int 
 
%For the third playable character
var Hero3sprite1, Hero3sprite1ID, Hero3sprite2, Hero3sprite2ID, Hero3sprite3, Hero3sprite3ID, Hero3sprite4, Hero3sprite4ID, Hero3sprite5, Hero3sprite5ID, Hero3sprite6, Hero3sprite6ID, Hero3sprite7, Hero3sprite7ID, Hero3sprite8, Hero3sprite8ID, Hero3sprite9, Hero3sprite9ID, Hero3sprite10, Hero3sprite10ID, Hero3sprite11, Hero3sprite11ID, Hero3sprite12, Hero3sprite12ID,
Hero3sprite13ID, Hero3sprite13, Hero3sprite14ID, Hero3sprite14, Hero3sprite15ID, Hero3sprite15, Hero3sprite16ID, Hero3sprite16, Hero3sprite17ID, Hero3sprite17, Hero3sprite18ID, Hero3sprite18, Hero3sprite19ID, Hero3sprite19, Hero3sprite20ID, Hero3sprite20, Hero3sprite21ID, Hero3sprite21 : int

%For the first level villain 
var Villain1sprite1, Villain1sprite1ID, Villain1sprite2, Villain1sprite2ID, Villain1sprite3, Villain1sprite3ID, Villain1sprite4, Villain1sprite4ID, Villain1sprite5, Villain1sprite5ID, Villain1sprite6, Villain1sprite6ID, Villain1sprite7, Villain1sprite7ID, Villain1sprite8, Villain1sprite8ID, Villain1sprite9, Villain1sprite9ID : int 
 
%For the second level villain 
var Villain2sprite1, Villain2sprite1ID, Villain2sprite2, Villain2sprite2ID, Villain2sprite3, Villain2sprite3ID, Villain2sprite4, Villain2sprite4ID, Villain2sprite5, Villain2sprite5ID, Villain2sprite6, Villain2sprite6ID, Villain2sprite7, Villain2sprite7ID, Villain2sprite8, Villain2sprite8ID, Villain2sprite9, Villain2sprite9ID, Villain2sprite10, Villain2sprite10ID : int
 
%For the third level villain
var Villain3sprite1, Villain3sprite1ID, Villain3sprite2, Villain3sprite2ID, Villain3sprite3, Villain3sprite3ID, Villain3sprite4, Villain3sprite4ID, Villain3sprite5, Villain3sprite5ID, Villain3sprite6, Villain3sprite6ID, Villain3sprite7, Villain3sprite7ID, Villain3sprite8, Villain3sprite8ID, Villain3sprite9, Villain3sprite9ID, Villain3sprite10, Villain3sprite10ID, Villain3sprite11, Villain3sprite11ID, Villain3sprite12, Villain3sprite12ID : int 
 
%For the background sprites
var backgroundGameCover, backgroundGameCoverID, backgroundGameover, backgroundGameoverID, background1, background1ID, background2, background2ID, background3, background3ID, background4, background4ID, background5, background5ID, background6, background6ID, background7, background7ID, background8, background8ID, background9, background9ID, backgroundMenu, backgroundMenuID : int

%Declare all variables that are to be used in the animations and recycled again in the animations
var sprite, sprite1, sprite2, sprite3, sprite4, sprite5, sprite6, sprite7, sprite8, sprite9, sprite10, sprite11, sprite12, sprite13, sprite14, sprite15, sprite16, sprite17, sprite18, sprite19, sprite20, Hero1PicID, Hero1Pic, Hero2PicID, Hero2Pic, Hero3PicID, Hero3Pic : int 

%Used for the Settings and Characters procedures
var characters : boolean

%Declare the 2 sprites for the cover photos 
var HerospritesID, Herosprites, VillainspritesID, Villainsprites : int

%Declare the arrays to be used for the animations 
var Hero1arrMoveR, Hero1arrMoveL, Hero1arrRest, Hero1arrContinue : array 0 .. 10 of int %There are about 5 sprites in total 
var Hero2arrMoveR, Hero2arrMoveL, Hero2arrRest, Hero2arrContinue : array 0 .. 10 of int %There are about 11 sprites in total 
var Hero3arrMoveR, Hero3arrMoveL, Hero3arrRest, Hero3arrContinue : array 0 .. 10 of int %There are about 12 sprites in total 
var Hero1attackarr, Hero2attackarr, Hero3attackarr : array 0 .. 15 of int %For when the hero decides to attack 
var Hero1Upgradesarr, Hero2arrUpgrade, Hero3upgradesarr : array 0 .. 15 of int %For when the hero upgrades 
var Hero1Damagearr, Hero2Damagearr, Hero3Damagearr : array 0 .. 15 of int %For when the villain inflicts damage onto the hero 
var Villain1Larr, Villain2attackLarr, Villain3attackLarr : array 0 .. 15 of int 
var Villain1Rarr, Villain2attackRarr, Villain3attackRarr : array 0 .. 12 of int 
 
%Used for randomizing the sequence of boss battles (in the event that the user chooses to play again) 
var Restartarr : array 0 .. 5 of int 
 
%For parameter
var ytemp : int := 100

%Declare the input variables...
var input : array char of boolean %Declare the input char boolean
var charinput : string (1) %Represents the input string (used along with 'getch' to get the keyboard letter inputs)
var name : string %Used to store the user's name 
var option1 : string %Used for when the user receives four options at each scene
var option2 : string %Used for when the user receives two options when approaching a monster 

%Following string variables are to be used in the windows 
var response, response1, response2, response3, response4, response5 : string

%Declare the variables to be used for the Character features of the first hero
var Hero1Level, Hero1Exp, Hero1NextExp, Hero1Strength, Hero1Vitality, Hero1Dexterity, Hero1Intelligence, Hero1HP, Hero1Stamina, Hero1Damage, Hero1MinDamage, Hero1MaxDamage, Hero1Defence, Hero1StatPoints, Hero1SkillPoints : int
 
%Declare the variables to be used for the Character features of the second hero
var Hero2Level, Hero2Exp, Hero2NextExp, Hero2Strength, Hero2Vitality, Hero2Dexterity, Hero2Intelligence, Hero2HP, Hero2Stamina, Hero2Damage, Hero2MinDamage, Hero2MaxDamage, Hero2Defence, Hero2StatPoints, Hero2SkillPoints : int
 
%Declare the variables to be used for the Character features of the third hero
var Hero3Level, Hero3Exp, Hero3NextExp, Hero3Strength, Hero3Vitality, Hero3Dexterity, Hero3Intelligence, Hero3HP, Hero3Stamina, Hero3Damage, Hero3MinDamage, Hero3MaxDamage, Hero3Defence, Hero3StatPoints, Hero3SkillPoints : int
 
%Declare the variables to be used for the Character features of the first villain
var Villain1HP, Villain1Exp, Villain1Damage, Villain1MinDamage, Villain1MaxDamage : int
 
%Declare the variables to be used for the Character features of the second villain
var Villain2HP, Villain2Exp, Villain2Damage, Villain2MinDamage, Villain2MaxDamage : int
 
%Declare the variables to be used for the Character features of the third villain
var Villain3HP, Villain3Exp, Villain3Damage, Villain3MinDamage, Villain3MaxDamage : int
 
%Declare the variables for the total damage dealt by the heros 
var TotalDamageHero1, TotalDamageHero2, TotalDamageHero3 : int 

%Declare the variables for the net damage dealt by the heros
var NetDamageHero1, NetDamageHero2, NetDamageHero3 : int

%Declare the variables for the total damage dealt by the villains
var TotalDamageVillain1, TotalDamageVillain2, TotalDamageVillain3 : int

%Declare the variables for the net damage dealt by the villains 
var NetDamageVillain1, NetDamageVillain2, NetDamageVillain3 : int 

%Declares the x and y coordinates of the playable characters as int variables and initializes both of them to 0.0
var Hero1x : int := 0 
var Hero1y : int := 0 
var Hero2x : int := 0
var Hero2y : int := 0
var Hero3x : int := 0
var Hero3y : int := 0
var Villain1x : int := 0
var Villain1y : int := 0
var Villain2x : int := 0
var Villain2y : int := 0
var Villain3x : int := 0
var Villain3y : int := 0
 
var Hero1Name, Hero2Name, Hero3Name : string %Used for the user input in the menu screen
 
%Following boolean variables are used for when the user chooses the hero and for other features
    %Upgrade is used for the Upgrade animations, Defend is used to activate Defence
var Hero1, Hero2, Hero3, Villain1, Villain1Defeat, Villain2, Villain2Defeat, Villain3, Villain3Defeat, AtackHero, AttackVillain, Upgrades, Defend : boolean
 
%Used to correctly position the sprites at the start of each scene -> in the SetVillain procedure (the monsters have to face the hero)
%leftof means left of the centre, rightof means right of the centre
var left, right, leftof, rightof : boolean 

%Used for when the user presses the buttons
var clickintro, clickplay, clickpause, clickinstructions, clickquit : boolean := false

%Used for when the monstera appears -> give the user 2 options in that case
var MonsterAppear, attack, decline : boolean

%Following boolean variables are for when the user decides to switch in-between scenes
    %introscene is for the StoryPlot, while scene10 & scene11 are for the GameOver and FinishedGame screens
var introscene, scene1, scene2, scene3, scene4, scene5, scene6, scene7, scene8, scene9, scene10, scene11 : boolean

%Following variables are used when the user decides to restart and/or dies 
    %E.g: Redirect the user to the previous scene
var restart, levelup, ZeroHPHero, ZeroHPVillain : boolean := false
var checkpoint1, checkpoint2, checkpoint3, checkpoint4, checkpoint5, checkpoint6, checkpoint7, checkpoint8, checkpoint9, checkpoint10, checkpoint11 : boolean
 
%Following boolean variables are used for each of the 4 options for the user 
var movel, mover, rest, continue : boolean 
 
%Declare the set of x and y coordinates for the centre of the screen
var centrex : int := maxx div 2
var centrey : int := maxy div 2 

%Constants are used for the collision detection procedure
const limitMinx := 0 %Min x coordinate
const limitMiny := 0 %Min y coordinate
const limitMaxx := maxx %Max x coordinate
const limitMaxy := maxy %Max y coordinate

%Declare the x and y coordinates for the backgrounds
var backgroundGameCoverx, backgroundGameoverx, backgroundMenux, background1x, background2x, background3x, background4x, background5x, background6x,
background7x, background8x, background9x : int
var backgroundGameCovery, backgroundGameovery, backgroundMenuy, background1y, background2y, background3y, background4y, background5y, background6y, background7y, background8y, background9y : int

%Initialize all of the x and y coordinates for the backgrounds
backgroundGameCoverx := centrex + 5
backgroundGameCovery := centrey
backgroundGameoverx := centrex - 20
backgroundGameovery := centrey 
background1x := 30
background1y := 100
background2x := centrex 
background2y := centrey - 3
background3x := centrex 
background3y := centrey
background4x := centrex
background4y := centrey + 5
background5x := centrex
background5y := centrey
background6x := centrex
background6y := centrey
background7x := centrex 
background7y := centrey
background8x := centrex
background8y := centrey + 10 
background9x := centrex
background9y := centrey
backgroundMenux := centrex
backgroundMenuy := centrey

%Forward all procedures that are to be used later in the game 
    %Restart game procedure
forward procedure PlayAgain () 

    %Intro screen procedure
forward procedure IntroScreen()

    %Menu screen procedure
forward procedure MenuScreen()

    %Game cover screen procedure
forward procedure GameCover()

    %Pause screen procedure
forward procedure PauseScreen()

    %Pause screen button procedure
forward procedure PauseButton(var x : int, var y : int)

    %Restart button procedure -> used in the GameOver scene or GameFinished scene
forward procedure RestartButton(var x : int, var y : int)

    %Settings screen procedure
forward procedure Settings()

    %Characters screen procedure
forward procedure Characters()

    %Return procedure -> used to return to the GameCover screen while on the menu 
forward procedure Return()

    %Go back/return procedure -> used to go back to the previous scenes 
forward procedure ReturnPrev()

    %Play screen procedure
forward procedure Play()

    %Instructions procedure
forward procedure Instructions()

    %Resume game procedure
forward procedure Resume()

    %Level up procedure
forward procedure LevelUp()

    %Level-updating procedure
forward procedure Levelupdate()

    %Save progress procedure
forward procedure Save()

    %Quit game procedure 
forward procedure Quit() 

    %Set Hero procedure
forward procedure SetHero(var whichhero : string, var x : int, var y : int) %whichhero determines which hero sprite to set, x and y = integer coordinates

    %Set Villain procedure
forward procedure SetVillain(var whichvillain : string, var y : int) %spriteID = ID of hero sprite, x and y = integer coordinates

    %Play game procedure 
forward procedure PlayGame()

    %Calc Damage hero procedure
forward procedure CalcDamageHero()

    %Calc Damage villain procedure
forward procedure CalcDamageVillain()

    %Calc exp procedure
forward procedure CalcExp()

    %Calc defence procedure
forward procedure CalcDefence()

    %Gain HP procedure
forward procedure GainHP()

    %Get Hero HP procedure
forward procedure GetHeroHP()

    %Get Villain HP procedure
forward procedure GetVillainHP()

    %Health bar Hero animation procedure
forward procedure HealthBarHero()

    %Health bar Villain animation procedure
forward procedure HealthBarVillain()

    %Move Right animation procedure
forward procedure MoveRight()

    %Move Left animation procedure
forward procedure MoveLeft()

    %Rest procedure 
forward procedure Resting()

    %Continue procedure
forward procedure Continue()

    %Upgrade procedure
forward procedure Upgrade()

%Following x and y coordinate parameters are for setting the standing sprites or the coordinates of the playable characters 
    %Scene1 procedure
forward procedure Scene1()

    %Scene2 procedure
forward procedure Scene2()

    %Scene3 procedure
forward procedure Scene3()

    %Scene4 procedure 
forward procedure Scene4()
    
    %Scene5 procedure
forward procedure Scene5()

    %Scene6 procedure
forward procedure Scene6()

    %Scene7 procedure
forward procedure Scene7()

    %Scene8 procedure 
forward procedure Scene8()

    %Scene9 procedure
forward procedure Scene9()

    %Gameover procedure
forward procedure GameOver()

    %FinishedGame procedure 
forward procedure FinishedGame()

    %Collision detection procedure
forward procedure CollisionDetection()

    %Battle 1 procedure
forward procedure Battle1()

    %Battle 2 procedure
forward procedure Battle2()

    %Battle 3 procedure
forward procedure Battle3()

    %Story plot procedure
forward procedure StoryPlot()

    %Four options procedure
forward procedure FourOptions()

    %Two options procedure
forward procedure TwoOptions()

    %User input procedure
forward procedure UserInput()


%Initialize the Play game procedure
body procedure PlayGame
%Unnecessary to start on the introductory screen
%First run the storyplot procedure, then play scenes 
Scene1()
Scene2()
Scene3()
Scene4()
Scene5()
Scene6()
Scene7()
Scene8()
Scene9()
GameOver()
FinishedGame()


end PlayGame


%Initialize all sprites to be used in the game (make sure to save it in a folder for it to appear) 
%may need updating...
procedure InitializeSprites()
%Initialize all of the sprites for the first hero
%Fix all of the strings in the Pic.FileNew() function later
Hero1sprite1ID := Pic.FileNew("Hero1.0.bmp") %Is the standing sprite 
Hero1sprite1 := Sprite.New(Hero1sprite1ID) 
Hero1sprite2ID := Pic.FileNew("Hero1MoveL1.bmp") %Is the first sprite of the walk left animation 
Hero1sprite2 := Sprite.New(Hero1sprite2ID) 
Hero1sprite3ID := Pic.FileNew("Hero1MoveL2.bmp") %Is the second sprite of the walk left animation 
Hero1sprite3 := Sprite.New(Hero1sprite3ID)
Hero1sprite4ID := Pic.FileNew("Hero1MoveL3.bmp") %Is the third sprite of the walk left animation 
Hero1sprite4 := Sprite.New(Hero1sprite4ID) 
Hero1sprite5ID := Pic.FileNew("Hero1MoveL4.bmp") %Is the fourth sprite of the walk left animation 
Hero1sprite5 := Sprite.New(Hero1sprite5ID) 
Hero1sprite6ID := Pic.FileNew("Hero1MoveL5.bmp") %Is the fifth sprite of the walk left animation 
Hero1sprite6 := Sprite.New(Hero1sprite6ID) 
Hero1sprite7ID := Pic.FileNew("Hero1MoveL6.bmp") %Is the sixth sprite of the walk left animation 
Hero1sprite7 := Sprite.New(Hero1sprite7ID) 
Hero1sprite8ID := Pic.FileNew("Hero1MoveL7.bmp") %Is the seventh sprite of the walk left animation 
Hero1sprite8 := Sprite.New(Hero1sprite8ID) 
Hero1sprite9ID := Pic.FileNew("Hero1MoveL8.bmp") %Is the eighth sprite of the walk left animation 
Hero1sprite9 := Sprite.New(Hero1sprite9ID) 
Hero1sprite10ID := Pic.FileNew("Hero1MoveL9.bmp") %Is the ninth sprite of the walk left animation 
Hero1sprite10 := Sprite.New(Hero1sprite10ID)

Hero1sprite11ID := Pic.FileNew("Hero1MoveR1.bmp") %Is the first sprite of the walk right animation 
Hero1sprite11 := Sprite.New(Hero1sprite11ID)
Hero1sprite12ID := Pic.FileNew("Hero1MoveR2.bmp") %Is the second sprite of the walk right animation 
Hero1sprite12 := Sprite.New(Hero1sprite12ID)
Hero1sprite13ID := Pic.FileNew("Hero1MoveR3.bmp") %Is the third sprite of the walk right animation 
Hero1sprite13 := Sprite.New(Hero1sprite13ID)
Hero1sprite14ID := Pic.FileNew("Hero1MoveR4.bmp") %Is the fourth sprite of the walk right animation 
Hero1sprite14 := Sprite.New(Hero1sprite14ID)
Hero1sprite15ID := Pic.FileNew("Hero1MoveR5.bmp") %Is the fifth sprite of the walk right animation 
Hero1sprite15 := Sprite.New(Hero1sprite15ID) 
Hero1sprite16ID := Pic.FileNew("Hero1MoveR6.bmp") %Is the sixth sprite of the walk right animation 
Hero1sprite16 := Sprite.New(Hero1sprite16ID)
Hero1sprite17ID := Pic.FileNew("Hero1MoveR7.bmp") %Is the seventh sprite of the walk right animation 
Hero1sprite17 := Sprite.New(Hero1sprite17ID)
Hero1sprite18ID := Pic.FileNew("Hero1MoveR8.bmp") %Is the eighth sprite of the walk right animation 
Hero1sprite18 := Sprite.New(Hero1sprite18ID) 
Hero1sprite19ID := Pic.FileNew("Hero1MoveR9.bmp") %Is the ninth sprite of the walk right animation 
Hero1sprite19 := Sprite.New(Hero1sprite19ID) 

Hero1sprite20ID := Pic.FileNew("Hero1Rest.bmp") %Is the resting sprite 
Hero1sprite20 := Sprite.New(Hero1sprite20ID) 
Hero1sprite21ID := Pic.FileNew("Hero1Upgrade.bmp") %Is the upgrade/attack sprite 
Hero1sprite21 := Sprite.New(Hero1sprite21ID) 
Hero1sprite22ID := Pic.FileNew("Hero1.1.bmp") %Is the first sprite of the punching attack animation
Hero1sprite22 := Sprite.New(Hero1sprite22ID) 
Hero1sprite23ID := Pic.FileNew("Hero1.2.bmp") %Is the second sprite of the punching attack animation
Hero1sprite23 := Sprite.New(Hero1sprite23ID) 
Hero1sprite24ID := Pic.FileNew("Hero1.3.bmp") %Is the third sprite of the punching attack animation 
Hero1sprite24 := Sprite.New(Hero1sprite24ID)
Hero1sprite25ID := Pic.FileNew("Hero1.4.bmp") %Is the fourth sprite of the punching attack animation
Hero1sprite25 := Sprite.New(Hero1sprite25ID) 
Hero1PicID := Pic.FileNew("Hero1.1.bmp") %Is a picture of Hero1 used in the Characters procedure 
Hero1Pic := Sprite.New(Hero1PicID)

%Initialize all of the sprites for the second hero
Hero2sprite1ID := Pic.FileNew("Hero2.1.bmp") %Is the right standing sprite
Hero2sprite1 := Sprite.New(Hero2sprite1ID) 
Hero2sprite2ID := Pic.FileNew("Hero2.2.bmp") %Is the first sprite of the throwing attack animation
Hero2sprite2 := Sprite.New(Hero2sprite2ID) 
Hero2sprite3ID := Pic.FileNew("Hero2.3.bmp") %Is the second sprite of the throwing attack animation
Hero2sprite3 := Sprite.New(Hero2sprite3ID)
Hero2sprite4ID := Pic.FileNew("Hero2.4.bmp") %Is the third sprite of the throwing attack animation
Hero2sprite4 := Sprite.New(Hero2sprite4ID)
Hero2sprite5ID := Pic.FileNew("Hero2.5.bmp") %Is the fourth sprite of the throwing attack animation
Hero2sprite5 := Sprite.New(Hero2sprite5ID)
Hero2sprite6ID := Pic.FileNew("Hero2.6.bmp") %Is the fifth sprite of the throwing attack animation
Hero2sprite6 := Sprite.New(Hero2sprite6ID)
Hero2sprite8ID := Pic.FileNew("Hero2.7.bmp") %Is a picture of an enlarged knife 
Hero2sprite8 := Sprite.New(Hero2sprite8ID)
Hero2sprite9ID := Pic.FileNew("Hero2.8.bmp") %Is the small picture of the knife 
Hero2sprite9 := Sprite.New(Hero2sprite9ID)
Hero2sprite10ID := Pic.FileNew("Hero2Upgrade1.bmp") %Is the first sprite of the upgrade animation
Hero2sprite10 := Sprite.New(Hero2sprite10ID)
Hero2sprite11ID := Pic.FileNew("Hero2Upgrade2.bmp") %Is the second sprite of the upgrade animation
Hero2sprite11 := Sprite.New(Hero2sprite11ID)
Hero2sprite12ID := Pic.FileNew("Hero2Upgrade3.bmp") %Is the third sprite of the upgrade animation
Hero2sprite12 := Sprite.New(Hero2sprite12ID) 
Hero2sprite13ID := Pic.FileNew("Hero2Damage.bmp") %Is the sprite of the damage animation
Hero2sprite13 := Sprite.New(Hero2sprite13ID) 

Hero2sprite14ID := Pic.FileNew("Hero2MoveL1.bmp") %Is the first sprite of the move left animation 
Hero2sprite14 := Sprite.New(Hero2sprite14ID)
Hero2sprite15ID := Pic.FileNew("Hero2MoveL2.bmp") %Is the second sprite of the move left animation
Hero2sprite15 := Sprite.New(Hero2sprite15ID) 
Hero2sprite16ID := Pic.FileNew("Hero2MoveL3.bmp") %Is the third sprite of the move left animation
Hero2sprite16 := Sprite.New(Hero2sprite16ID) 
Hero2sprite17ID := Pic.FileNew("Hero2MoveL4.bmp") %Is the fourth sprite of the move left animation
Hero2sprite17 := Sprite.New(Hero2sprite17ID)
Hero2sprite18ID := Pic.FileNew("Hero2MoveL5.bmp") %Is the fifth sprite of the move left animation
Hero2sprite18 := Sprite.New(Hero2sprite18ID)
Hero2sprite19ID := Pic.FileNew("Hero2MoveL6.bmp") %Is the sixth sprite of the move left animation
Hero2sprite19 := Sprite.New(Hero2sprite19ID)
Hero2sprite20ID := Pic.FileNew("Hero2MoveL7.bmp") %Is the seventh sprite of the move left animation
Hero2sprite20 := Sprite.New(Hero2sprite20ID)
Hero2sprite21ID := Pic.FileNew("Hero2MoveL8.bmp") %Is the eighth sprite of the move left animation
Hero2sprite21 := Sprite.New(Hero2sprite21ID)
Hero2sprite22ID := Pic.FileNew("Hero2MoveR1.bmp") %Is the first sprite of the move right animation
Hero2sprite22 := Sprite.New(Hero2sprite22ID)
Hero2sprite23ID := Pic.FileNew("Hero2MoveR2.bmp") %Is the second sprite of the move right animation
Hero2sprite23 := Sprite.New(Hero2sprite23ID)
Hero2sprite24ID := Pic.FileNew("Hero2MoveR3.bmp") %Is the third sprite of the move right animation
Hero2sprite24 := Sprite.New(Hero2sprite24ID)
Hero2sprite25ID := Pic.FileNew("Hero2MoveR4.bmp") %Is the fourth sprite of the move right animation
Hero2sprite25 := Sprite.New(Hero2sprite25ID) 
Hero2sprite26ID := Pic.FileNew("Hero2MoveR5.bmp") %Is the fifth sprite of the move right animation
Hero2sprite26 := Sprite.New(Hero2sprite26ID) 
Hero2sprite27ID := Pic.FileNew("Hero2MoveR6.bmp") %Is the sixth sprite of the move right animation
Hero2sprite27 := Sprite.New(Hero2sprite27ID)
Hero2sprite28ID := Pic.FileNew("Hero2MoveR7.bmp") %Is the seventh sprite of the move right animation
Hero2sprite28 := Sprite.New(Hero2sprite28ID) 
Hero2sprite29ID := Pic.FileNew("Hero2MoveR8.bmp") %Is the eighth sprite of the move right animation
Hero2sprite29 := Sprite.New(Hero2sprite29ID) 

Hero2PicID := Pic.FileNew("Hero2.1.bmp") %Is a picture of Hero2 used in the Characters procedure 
Hero2Pic := Sprite.New(Hero2PicID)

%Initialize all of the sprites for the third hero
Hero3sprite1ID := Pic.FileNew("Hero3.1.bmp") %Is the right standing sprite
Hero3sprite1 := Sprite.New(Hero3sprite1ID)
Hero3sprite2ID := Pic.FileNew("Hero3RunR1.bmp") %Is the first sprite of the run right animation
Hero3sprite2 := Sprite.New(Hero3sprite2ID)
Hero3sprite3ID := Pic.FileNew("Hero3RunR2.bmp") %Is the second sprite of the run right animation
Hero3sprite3 := Sprite.New(Hero3sprite3ID)
Hero3sprite4ID := Pic.FileNew("Hero3RunR3.bmp") %Is the third sprite of the run right animation
Hero3sprite4 := Sprite.New(Hero3sprite4ID)
Hero3sprite5ID := Pic.FileNew("Hero3RunR4.bmp") %Is the fourth sprite of the run right animation
Hero3sprite5 := Sprite.New(Hero3sprite5ID)
Hero3sprite6ID := Pic.FileNew("Hero3RunR5.bmp") %Is the fifth sprite of the run right animation
Hero3sprite6 := Sprite.New(Hero3sprite6ID)
Hero3sprite7ID := Pic.FileNew("Hero3RunR6.bmp") %Is the sixth sprite of the run right animation
Hero3sprite7 := Sprite.New(Hero3sprite7ID)

Hero3sprite8ID := Pic.FileNew("Hero3RunL1.bmp") %Is the first sprite of the run left animation
Hero3sprite8 := Sprite.New(Hero3sprite8ID)
Hero3sprite9ID := Pic.FileNew("Hero3RunL2.bmp") %Is the second sprite of the run left animation
Hero3sprite9 := Sprite.New(Hero3sprite9ID)
Hero3sprite10ID := Pic.FileNew("Hero3RunL3.bmp") %Is the third sprite of the run left animation
Hero3sprite10 := Sprite.New(Hero3sprite10ID)
Hero3sprite11ID := Pic.FileNew("Hero3RunL4.bmp") %Is the fourth sprite of the run left animation
Hero3sprite11 := Sprite.New(Hero3sprite11ID)
Hero3sprite12ID := Pic.FileNew("Hero3RunL5.bmp") %Is the fifth sprite of the run left animation
Hero3sprite12 := Sprite.New(Hero3sprite12ID)
Hero3sprite13ID := Pic.FileNew("Hero3RunL6.bmp") %Is the sixth sprite of the run left animation
Hero3sprite13 := Sprite.New(Hero3sprite13ID)

Hero3sprite14ID := Pic.FileNew("Hero3.8.bmp") %Is the first sprite of the whipping attack animation
Hero3sprite14 := Sprite.New(Hero3sprite14ID)
Hero3sprite15ID := Pic.FileNew("Hero3.9.bmp") %Is the second sprite of the whipping attack animation 
Hero3sprite15:= Sprite.New(Hero3sprite15ID)
Hero3sprite16ID := Pic.FileNew("Hero3.10.bmp") %Is the third sprite of the whipping attack animation 
Hero3sprite16 := Sprite.New(Hero3sprite16ID)
Hero3sprite17ID := Pic.FileNew("Hero3.11.bmp") %Is the fourth sprite of the whipping attack animation 
Hero3sprite17 := Sprite.New(Hero3sprite17ID)
Hero3sprite18ID := Pic.FileNew("Hero3.12.bmp") %Is the sprite of the damage animation
Hero3sprite18 := Sprite.New(Hero3sprite18ID) 

Hero3sprite19ID := Pic.FileNew("Hero3Rest.1.bmp") %Is the first sprite of the resting animation
Hero3sprite19 := Sprite.New(Hero3sprite19ID)
Hero3sprite20ID := Pic.FileNew("Hero3Rest.2.bmp") %Is the second sprite of the resting animation
Hero3sprite20 := Sprite.New(Hero3sprite20ID)
Hero3sprite21ID := Pic.FileNew("Hero3LeftStand.bmp") %Is the left standing sprite
Hero3sprite21 := Sprite.New(Hero3sprite21ID)

Hero3PicID := Pic.FileNew("Hero3Pic.bmp") %Is a picture of Hero3 used in the Characters procedure 
Hero3Pic := Sprite.New(Hero3PicID) 

%Initialize all of the villain1 sprites 
Villain1sprite1ID := Pic.FileNew("Villain1.1.bmp") %Is the resting sprite/first sprite of the facing-left flying animation
Villain1sprite1 := Sprite.New(Villain1sprite1ID)
Villain1sprite2ID := Pic.FileNew("Villain1.2.bmp") %Is the first sprite of the facing-left flying animation
Villain1sprite2 := Sprite.New(Villain1sprite2ID) 
Villain1sprite3ID := Pic.FileNew("Villain1.3.bmp") %Is the second sprite of the facing-left flying animation
Villain1sprite3 := Sprite.New(Villain1sprite3ID)
Villain1sprite4ID := Pic.FileNew("Villain1.4.bmp") %Is the third sprite of the facing-left flying animation
Villain1sprite4 := Sprite.New(Villain1sprite4ID) 

Villain1sprite5ID := Pic.FileNew("Villain1.5.bmp") %Is the sprite for the attack animation (two clouds of flames) 
Villain1sprite5 := Sprite.New(Villain1sprite5ID)

Villain1sprite6ID := Pic.FileNew("Villain1.6.bmp") %Is the resting sprite/first sprite of the facing-right flying animation
Villain1sprite6 := Sprite.New(Villain1sprite6ID)
Villain1sprite7ID := Pic.FileNew("Villain1.7.bmp") %Is the first sprite of the right-flying flying animation
Villain1sprite7 := Sprite.New(Villain1sprite7ID) 
Villain1sprite8ID := Pic.FileNew("Villain1.8.bmp") %Is the second sprite of the right-flying flying animation
Villain1sprite8 := Sprite.New(Villain1sprite8ID)
Villain1sprite9ID := Pic.FileNew("Villain1.9.bmp") %Is the third sprite of the right-flying flying animation
Villain1sprite9 := Sprite.New(Villain1sprite9ID)  

%Initialize all of the villain2 sprites 
Villain2sprite1ID := Pic.FileNew("Villain2.0.bmp") %Is the resting facing-right sprite
Villain2sprite1 := Sprite.New(Villain2sprite1ID)
Villain2sprite2ID := Pic.FileNew("Villain2.1.bmp") %Is the first sprite of the facing-right thrusting down attack animation
Villain2sprite2 := Sprite.New(Villain2sprite2ID)
Villain2sprite3ID := Pic.FileNew("Villain2.2.bmp") %Is the second sprite of the facing-right thrusting down attack animation
Villain2sprite3 := Sprite.New(Villain2sprite3ID)
Villain2sprite4ID := Pic.FileNew("Villain2.3.bmp") %Is the third sprite of the facing-right thrusting down attack animation
Villain2sprite4 := Sprite.New(Villain2sprite4ID)
Villain2sprite5ID := Pic.FileNew("Villain2.4.bmp") %Is the fourth sprite of the facing-right thrusting down attack animation
Villain2sprite5 := Sprite.New(Villain2sprite5ID) 

Villain2sprite6ID := Pic.FileNew("Villain2.5.bmp") %Is the resting facing-left sprite
Villain2sprite6 := Sprite.New(Villain2sprite6ID)
Villain2sprite7ID := Pic.FileNew("Villain2.6.bmp") %Is the first sprite of the facing-left thrusting down attack animation
Villain2sprite7 := Sprite.New(Villain2sprite7ID)
Villain2sprite8ID := Pic.FileNew("Villain2.7.bmp") %Is the second sprite of the facing-left thrusting down attack animation
Villain2sprite8 := Sprite.New(Villain2sprite8ID)
Villain2sprite9ID := Pic.FileNew("Villain2.8.bmp") %Is the third sprite of the facing-left thrusting down attack animation
Villain2sprite9 := Sprite.New(Villain2sprite9ID)
Villain2sprite10ID := Pic.FileNew("Villain2.9.bmp") %Is the fourth sprite of the facing-left thrusting down attack animation
Villain2sprite10 := Sprite.New(Villain2sprite10ID)

%Initialize all of the villain3 sprites 
Villain3sprite1ID := Pic.FileNew("Villain3.1.bmp") %Is the facing-left resting sprite
Villain3sprite1 := Sprite.New(Villain3sprite1ID) 
Villain3sprite2ID := Pic.FileNew("Villain3.2.bmp") %Is the first sprite of the facing-left attacking animation
Villain3sprite2 := Sprite.New(Villain3sprite2ID) 
Villain3sprite3ID := Pic.FileNew("Villain3.3.bmp") %Is the second sprite of the facing-left attacking animation
Villain3sprite3 := Sprite.New(Villain3sprite3ID) 
Villain3sprite4ID := Pic.FileNew("Villain3.4.bmp") %Is the third sprite of the facing-left attacking animation
Villain3sprite4 := Sprite.New(Villain3sprite4ID) 
Villain3sprite5ID := Pic.FileNew("Villain3.5.bmp") %Is the fourth sprite of the facing-left attacking animation
Villain3sprite5 := Sprite.New(Villain3sprite5ID) 
Villain3sprite6ID := Pic.FileNew("Villain3.6.bmp") %Is the fifth sprite of the facing-left attacking animation
Villain3sprite6 := Sprite.New(Villain3sprite6ID) 
 
Villain3sprite7ID := Pic.FileNew("Villain3.7.bmp") %Is the facing-right resting sprite
Villain3sprite7 := Sprite.New(Villain3sprite7ID)
Villain3sprite8ID := Pic.FileNew("Villain3.8.bmp") %Is the first sprite of the facing-right attacking animation
Villain3sprite8 := Sprite.New(Villain3sprite8ID)
Villain3sprite9ID := Pic.FileNew("Villain3.9.bmp") %Is the second sprite of the facing-right attacking animation
Villain3sprite9 := Sprite.New(Villain3sprite9ID)
Villain3sprite10ID := Pic.FileNew("Villain3.10.bmp") %Is the third sprite of the facing-right attacking animation
Villain3sprite10 := Sprite.New(Villain3sprite10ID)
Villain3sprite11ID := Pic.FileNew("Villain3.11.bmp") %Is the fourth sprite of the facing-right attacking animation
Villain3sprite11 := Sprite.New(Villain3sprite11ID)
Villain3sprite12ID := Pic.FileNew("Villain3.12.bmp") %Is the fifth sprite of the facing-right attacking animation
Villain3sprite12 := Sprite.New(Villain3sprite12ID)

%Initialize all of the background sprites 
    %Following 12 backgrounds are to be used in the scenes 
backgroundGameCoverID := Pic.FileNew("RPGCover.jpg")
backgroundGameCover := Sprite.New(backgroundGameCoverID)
backgroundGameoverID := Pic.FileNew("Gameover.jpg")
backgroundGameover := Sprite.New(backgroundGameoverID)
background1ID := Pic.FileNew("Background1.bmp") 
background1 := Sprite.New(background1ID) 
background2ID := Pic.FileNew("Background2.bmp")
background2 := Sprite.New(background2ID) 
background3ID := Pic.FileNew("Background3.bmp")
background3 := Sprite.New(background3ID) 
background4ID := Pic.FileNew("Background4.bmp") 
background4 := Sprite.New(background4ID)
background5ID := Pic.FileNew("Background5.bmp")
background5 := Sprite.New(background5ID)
background6ID := Pic.FileNew("Background6.bmp")
background6 := Sprite.New(background6ID)
background7ID := Pic.FileNew("Background7.bmp")
background7 := Sprite.New(background7ID)
background8ID := Pic.FileNew("Background8.bmp")
background8 := Sprite.New(background8ID) 
background9ID := Pic.FileNew("Background9.bmp")
background9 := Sprite.New(background9ID) 
 
%Used for the background for the menu screen (supposed to be a gradient blue background) 
backgroundMenuID := Pic.FileNew("GradientBlue.jpg")
backgroundMenu := Sprite.New(backgroundMenuID) 

%Initialize the 2 RPG cover sprites
HerospritesID := Pic.FileNew("RPGHeros.bmp")
Herosprites := Sprite.New(HerospritesID)
VillainspritesID := Pic.FileNew("RPGVillains.bmp")
Villainsprites := Sprite.New(VillainspritesID)
end InitializeSprites 
 
%Following procedure hides all of the possible sprites -> used for when the user decides to place the sprites 
procedure HideHeroSprites() 
%Hide the hero sprites 
Sprite.Hide(Hero1sprite1) 
Sprite.Hide(Hero1sprite2) 
Sprite.Hide(Hero1sprite3) 
Sprite.Hide(Hero1sprite4) 
Sprite.Hide(Hero1sprite5) 
Sprite.Hide(Hero1sprite6)
Sprite.Hide(Hero1sprite7)
Sprite.Hide(Hero1sprite8)
Sprite.Hide(Hero1sprite9)
Sprite.Hide(Hero1sprite10) 
Sprite.Hide(Hero1sprite11) 
Sprite.Hide(Hero1sprite12) 
Sprite.Hide(Hero1sprite13) 
Sprite.Hide(Hero1sprite14) 
Sprite.Hide(Hero1sprite15)
Sprite.Hide(Hero1sprite16)
Sprite.Hide(Hero1sprite17) 
Sprite.Hide(Hero1sprite18) 
Sprite.Hide(Hero1sprite19) 
Sprite.Hide(Hero1sprite20) 
Sprite.Hide(Hero1sprite21) 
Sprite.Hide(Hero1sprite22) 
Sprite.Hide(Hero1sprite23)
Sprite.Hide(Hero1sprite24)
Sprite.Hide(Hero1sprite25)
Sprite.Hide(Hero1Pic)
 
Sprite.Hide(Hero2sprite1) 
Sprite.Hide(Hero2sprite2) 
Sprite.Hide(Hero2sprite3) 
Sprite.Hide(Hero2sprite4) 
Sprite.Hide(Hero2sprite5) 
Sprite.Hide(Hero2sprite6) 
Sprite.Hide(Hero2sprite7) 
Sprite.Hide(Hero2sprite8) 
Sprite.Hide(Hero2sprite9) 
Sprite.Hide(Hero2sprite10) 
Sprite.Hide(Hero2sprite11) 
Sprite.Hide(Hero2sprite12)
Sprite.Hide(Hero2sprite13)
Sprite.Hide(Hero2sprite14) 
Sprite.Hide(Hero2sprite15) 
Sprite.Hide(Hero2sprite16) 
Sprite.Hide(Hero2sprite17) 
Sprite.Hide(Hero2sprite18) 
Sprite.Hide(Hero2sprite19) 
Sprite.Hide(Hero2sprite20) 
Sprite.Hide(Hero2sprite21) 
Sprite.Hide(Hero2sprite22) 
Sprite.Hide(Hero2sprite23) 
Sprite.Hide(Hero2sprite24) 
Sprite.Hide(Hero2sprite25)
Sprite.Hide(Hero2sprite26)
Sprite.Hide(Hero2sprite27)
Sprite.Hide(Hero2sprite28)
Sprite.Hide(Hero2sprite29)
Sprite.Hide(Hero2Pic) 

Sprite.Hide(Hero3sprite1) 
Sprite.Hide(Hero3sprite2) 
Sprite.Hide(Hero3sprite1) 
Sprite.Hide(Hero3sprite2) 
Sprite.Hide(Hero3sprite3) 
Sprite.Hide(Hero3sprite4) 
Sprite.Hide(Hero3sprite5) 
Sprite.Hide(Hero3sprite6) 
Sprite.Hide(Hero3sprite7) 
Sprite.Hide(Hero3sprite8) 
Sprite.Hide(Hero3sprite9) 
Sprite.Hide(Hero3sprite10) 
Sprite.Hide(Hero3sprite11) 
Sprite.Hide(Hero3sprite12) 
Sprite.Hide(Hero3sprite13)
Sprite.Hide(Hero3sprite14)
Sprite.Hide(Hero3sprite15)
Sprite.Hide(Hero3sprite16)
Sprite.Hide(Hero3sprite17)
Sprite.Hide(Hero3sprite18)
Sprite.Hide(Hero3sprite19)
Sprite.Hide(Hero3sprite20)
Sprite.Hide(Hero3sprite21)
Sprite.Hide(Hero3Pic)

Sprite.Hide(Herosprites)
end HideHeroSprites 
 
%Hide the villain sprites 
procedure HideVillainSprites() 
Sprite.Hide(Villain1sprite1) 
Sprite.Hide(Villain1sprite2) 
Sprite.Hide(Villain1sprite3) 
Sprite.Hide(Villain1sprite4) 
Sprite.Hide(Villain1sprite5) 
Sprite.Hide(Villain1sprite6) 
Sprite.Hide(Villain1sprite7) 
Sprite.Hide(Villain1sprite8) 
Sprite.Hide(Villain1sprite9) 
 
Sprite.Hide(Villain2sprite1) 
Sprite.Hide(Villain2sprite2) 
Sprite.Hide(Villain2sprite3) 
Sprite.Hide(Villain2sprite4) 
Sprite.Hide(Villain2sprite5) 
Sprite.Hide(Villain2sprite6) 
Sprite.Hide(Villain2sprite7) 
Sprite.Hide(Villain2sprite8) 
Sprite.Hide(Villain2sprite9) 
Sprite.Hide(Villain2sprite10) 
 
Sprite.Hide(Villain3sprite1) 
Sprite.Hide(Villain3sprite2) 
Sprite.Hide(Villain3sprite3) 
Sprite.Hide(Villain3sprite4) 
Sprite.Hide(Villain3sprite5) 
Sprite.Hide(Villain3sprite6) 
Sprite.Hide(Villain3sprite7) 
Sprite.Hide(Villain3sprite8) 
Sprite.Hide(Villain3sprite9) 
Sprite.Hide(Villain3sprite10) 
Sprite.Hide(Villain3sprite11) 
Sprite.Hide(Villain3sprite12) 

Sprite.Hide(Villainsprites)
end HideVillainSprites
 
%Hide the background sprites
procedure HideBackgroundSprites()
Sprite.Hide(backgroundGameCover) 
Sprite.Hide(backgroundGameover)
Sprite.Hide(backgroundMenu)
Sprite.Hide(background1)
Sprite.Hide(background2)
Sprite.Hide(background3)
Sprite.Hide(background4)
Sprite.Hide(background5)
Sprite.Hide(background6)
Sprite.Hide(background7)
Sprite.Hide(background8)
Sprite.Hide(background9)
end HideBackgroundSprites

%Set the background for the RPG Game cover 
procedure SetBackgroundGameCover(var x : int, var y : int) % x & y = centrex + 5 & centrey
HideBackgroundSprites()
Sprite.SetHeight(backgroundGameCover, -1) %Set the height of the sprite to a negative integer
Sprite.SetPosition(backgroundGameCover, x, y, true)
Sprite.Show(backgroundGameCover)
end SetBackgroundGameCover

%Set the background for the RPG game-over scene 
procedure SetBackgroundGameover(var x : int, var y : int) % x & y = centrex - 20 & centrey
HideBackgroundSprites()
Sprite.SetHeight(backgroundGameover, -1) %Set the height of the sprite to a negative integer
Sprite.SetPosition(backgroundGameover, x, y, true)
Sprite.Show(backgroundGameover)
end SetBackgroundGameover

%Set the background for the first scene
procedure SetBackground1(var x : int, var y : int) %x & y = centrex & centrey
HideBackgroundSprites()
Sprite.SetHeight(background1, -1) %Set the height of the sprite to a negative integer
%May need to fix the coordinates later
Sprite.SetPosition(background1, x, y, true)
Sprite.Show(background1)
end SetBackground1
 
%Set the background for the second scene
procedure SetBackground2(var x : int, var y : int) %x & y = centrex & centrey - 3
HideBackgroundSprites()
Sprite.SetHeight(background2, -1) %Set the height of the sprite to a negative integer
Sprite.SetPosition(background2, x, y, true)
Sprite.Show(background2)
end SetBackground2
 
%Set the background for the third scene
procedure SetBackground3(var x : int, var y : int) %x & y = centrex & centrey
HideBackgroundSprites()
Sprite.SetHeight(background3, -1) %Set the height of the sprite to a negative integer
Sprite.SetPosition(background3, x, y, true)
Sprite.Show(background3)
end SetBackground3
 
%Set the background for the fourth scene
procedure SetBackground4(var x : int, var y : int) %x & y = centrex & centrey + 5
HideBackgroundSprites()
Sprite.SetHeight(background4, -1) %Set the height of the sprite to a negative integer
Sprite.SetPosition(background4, x, y, true)
Sprite.Show(background4)
end SetBackground4
 
%Set the background for the fifth scene
procedure SetBackground5(var x : int, var y : int) %x & y = centrex & centrey
HideBackgroundSprites()
Sprite.SetHeight(background5, -1) %Set the height of the sprite to a negative integer
Sprite.SetPosition(background5, x, y, true)
Sprite.Show(background5)
end SetBackground5
 
%Set the background for the sixth scene
procedure SetBackground6(var x : int, var y : int) %x & y = centrex & centrey
HideBackgroundSprites()
Sprite.SetHeight(background6, -1) %Set the height of the sprite to a negative integer
Sprite.SetPosition(background6, x, y, true)
Sprite.Show(background6)
end SetBackground6

%Set the background for the seventh scene
procedure SetBackground7(var x : int, var y : int) %x & y = centrex & centrey
HideBackgroundSprites()
Sprite.SetHeight(background7, -1) %Set the height of the sprite to a negative integer
Sprite.SetPosition(background7, x, y, true)
Sprite.Show(background7)
end SetBackground7

%Set the background for the eighth scene
procedure SetBackground8(var x : int, var y : int) %x & y = centrex & centrey + 10
HideBackgroundSprites()
Sprite.SetHeight(background8, -1) %Set the height of the sprite to a negative integer
Sprite.SetPosition(background8, x, y, true)
Sprite.Show(background8)
end SetBackground8

%Set the background for the ninth scene 
procedure SetBackground9(var x : int, var y : int) %x & y = centrex & centrey
HideBackgroundSprites()
Sprite.SetHeight(background9, -1) %Set the height of the sprite to a negative integer
Sprite.SetPosition(background9, x, y, true)
Sprite.Show(background9)
end SetBackground9

procedure SetBackgroundMenu(var x : int, var y : int) %x & y = centrex & centrey
HideBackgroundSprites()
Sprite.SetHeight(backgroundMenu, -1) %Set the height of the sprite to a negative integer
Sprite.SetPosition(backgroundMenu, x, y, true)
Sprite.Show(backgroundMenu)
end SetBackgroundMenu

%Set the position of the starting sprites of the hero(s) 
body procedure SetHero
%whichhero determines which hero to put 
if not limit then
if whichhero = "Hero1" then
HideHeroSprites() 

%Use Hero1sprite1 for left starting sprite & Hero1sprite11 for right standing sprite
Sprite.SetPosition(Hero1sprite11, x, y, true)
Sprite.Show(Hero1sprite11)
 
%Initialize the x and y coordinates, after setting the sprite
Hero1x := x
Hero1y := y

%Determine if the character is left or right of the centre
if Hero1x < centrex then
leftof := true
elsif Hero1x >= centrex then
rightof := true 
end if 
end if 
 
if whichhero = "Hero2" then
HideHeroSprites() 

%Use Hero2sprite1 for right starting sprite & Hero2sprite14 for left standing sprite
Sprite.SetPosition(Hero2sprite1, x, y, true)
Sprite.Show(Hero1sprite2)
 
%Initialize the x and y coordinates, after setting the sprite
Hero2x := x
Hero2y := y

%Determine if the character is left or right of the centre
if Hero2x < centrex then
leftof := true
elsif Hero2x >= centrex then
rightof := true 
end if 
end if 
 
if whichhero = "Hero3" then
HideHeroSprites() 
%Use Hero3sprite1 for right starting sprite & Hero3sprite21 for left standing sprite 
Sprite.SetPosition(Hero3sprite1, x, y, true)
Sprite.Show(Hero3sprite1)
 
%Initialize the x and y coordinates, after setting the sprite
Hero3x := x
Hero3y := y

%Determine if the character is left or right of the centre
if Hero3x < centrex then
leftof := true
elsif Hero3x >= centrex then
rightof := true 
end if 
end if 
end if 
end SetHero

%Set the position of the starting sprites of the villain(s)
body procedure SetVillain
if not limit then %If the villain is within bounds
%Have to randomize the position of the villains as the game progresses 
if whichvillain = "Villain1" then 
HideVillainSprites() 
if left & leftof then %If the hero is facing the left and is left of the centre 
Villain1x := Rand.Int(100, 230) %Randomize the x coordinate of the villain to between 100 and 200  
Villain1y := y %Make sure the villain is on the background floor 

%Use Villain1sprite1 for facing-left sprite & Villain1sprite6 for facing-right sprite
Sprite.SetPosition(Villain1sprite6, Villain1x, Villain1y, true)
Sprite.Show(Villain1sprite6) 

elsif right & rightof then %If the hero is facing the right and is right from the centre
Villain1x := Rand.Int(270, 400) %Randomize the x coordinate of the villain to between 300 and 400  
Villain1y := y 

Sprite.SetPosition(Villain1sprite1, Villain1x, Villain1y, true) 
Sprite.Show(Villain1sprite1)  
end if 
MonsterAppear := true
end if 
 
if whichvillain = "Villain2" then 
HideVillainSprites() 
if left & leftof then %If the hero is facing the left and is left of the centre 
Villain2x := Rand.Int(100, 230) %Randomize the x coordinate of the villain to between 100 and 200  
Villain2y := y %Make sure the villain is on the background floor 
 
%Use Villain2sprite1 for facing-left sprite & Villain2sprite6 for facing-right sprite
Sprite.SetPosition(Villain2sprite6, Villain2x, Villain2y, true)
Sprite.Show(Villain2sprite6) 

elsif right & rightof then %If the hero is facing the right and is right from the centre
Villain2x := Rand.Int(270, 400) %Randomize the x coordinate of the villain to between 300 and 400  
Villain2y := y 

Sprite.SetPosition(Villain2sprite1, Villain2x, Villain2y, true) 
Sprite.Show(Villain2sprite1)  
end if 
MonsterAppear := true
end if 
 
if whichvillain = "Villain3" then
HideVillainSprites() 
if left then %If the hero is facing the left 
Villain3x := Rand.Int(100, 230) %Randomize the x coordinate of the villain to between 100 and 200  
Villain3y := y %Make sure the villain is on the background floor 

%Use Villain3sprite1 for facing-left sprite & Villain3sprite7 for facing-right sprite
Sprite.SetPosition(Villain3sprite7, Villain3x, Villain3y, true)
Sprite.Show(Villain3sprite7) 

else %If the hero is facing the right 
Villain1x := Rand.Int(270, 400) %Randomize the x coordinate of the villain to between 300 and 400  
Villain1y := y 

Sprite.SetPosition(Villain3sprite1, Villain3x, Villain3y, true) 
Sprite.Show(Villain3sprite1)  
end if 
MonsterAppear := true
end if 
end if 
end SetVillain
 
%Process is used when the user decides to press the play button or the instructions button
process PlayMusic 
Music.PlayFileLoop(song) %Play the song all throughout the game 
end PlayMusic

%Process is used for the punch sound effect 
process SoundEffect1 
Music.PlayFile(punch)
end SoundEffect1 

%Process is used for the flame sound effect 
process SoundEffect2
Music.PlayFile(flame) 
end SoundEffect2

%Process is used for the flamewhip sound effect
process SoundEffect3
Music.PlayFile(flamewhip)
end SoundEffect3 

%Process is used for the throw1 sound effect 
process SoundEffect4
Music.PlayFile(throw1)
end SoundEffect4

%Process is used for the throw2 sound effect
process SoundEffect5
Music.PlayFile(throw2)
end SoundEffect5

%Process is used for the throw3 sound effect
process SoundEffect6
Music.PlayFile(throw3)
end SoundEffect6

%Process is used for the spell1 sound effect
process SoundEffect7
Music.PlayFile(spell1)
end SoundEffect7 

%Process is used for the spell2 sound effect 
process SoundEffect8
Music.PlayFile(spell2)
end SoundEffect8

%Process is used for the smash sound effect 
process SoundEffect9 
Music.PlayFile(smash) 
end SoundEffect9

body procedure Play
cls
clickplay := true
PlayGame() %Run the game 
end Play 

body procedure GameCover
cls
if not clickintro then 
fork PlayMusic %Play the RPG music, upon displaying the screen for the first time
end if 
    var x : int := centrex + 5
    SetBackgroundGameCover(x, centrey) 
    PlayButtonID := GUI.CreateButton(centrex - 150, centrey - 50, 100, "Play", Play) 
    MenuButtonID := GUI.CreateButton (centrex - 150, centrey - 100, 100, "Menu", MenuScreen)
    InstructionsButtonID := GUI.CreateButton (centrex - 150, centrey - 150, 100, "Instructions", Instructions) 
    clickintro := true
    loop
	exit when GUI.ProcessEvent
    end loop
end GameCover

body procedure IntroScreen %Introduces the name and date the program was finished, then displays the instructions and play buttons
GUI.SetBackgroundColour(yellow)
drawbox(centrex - 100, centrey - 70, centrex + 250, centrey + 100, black)
font1 := Font.New ("Palatino:12:Bold,Italic")
Font.Draw ("Welcome to Eric's RPG Game!", centrex - 70, centrey + 50, font1, black)

font2 := Font.New ("Palatino:12:Bold,Italic")
%Make sure to include the date after finishing the program
Font.Draw ("This program was finished: [Insert date]", centrex - 70, centrey, font2, black)

%Draw the intro button that redirects the user to the game cover 
IntroButtonID := GUI.CreateButton (centrex - 50, centrey - 100, 50, "Click to toggle the introductory screen", GameCover)
loop
    exit when GUI.ProcessEvent
end loop
end IntroScreen 

body procedure Instructions
cls 
%Open a separate window for the instructions 
Window1ID := Window.Open("position:200;500,graphics:1000;1000") 
Window.Select(Window1ID) 

%Set background to light blue
GUI.SetBackgroundColour(77)
%Fills the screen with yellow with each new line of output 
colourback(yellow) 
put "You will be playing the role of a hero. \n"
Time.Delay(1000) 
put "Over the course of this game, you will encounter bosses. \n"
Time.Delay(1000) 
put "These bosses are essentially monsters and may appear in an moment during the game, depending on the position of the player. \n" 
Time.Delay(1000) 
put "Additionally, at each scene, you will be given the 4 options of continuing, resting, going left, or going right. \n"
Time.Delay(1000) 
put "These movements are represented by the 4 arrow keys... \n" 
Time.Delay(1000) 
put "Up = continue, Down = rest, Left = left, Right = right... \n" 
Time.Delay(1000) 
put "Resting will restore the character's stamina, continuing will redirect the character to the next scene, and \n"
Time.Delay(1000) 
put "Going left will redirect the character to the previous scene"  
Time.Delay(1000) 
put "There is also a menu screen which you could access via the pause button or the menu button at the beginning of the game. \n" 
Time.Delay(1000) 
put "This menu screen provides in-game features such as settings, characters, and finally, upgrades. \n" 
Time.Delay(1000) 
put "Pressing the settings button will allow you to toggle in-game features such as music, sound, etc. \n"
Time.Delay(1000) 
put "Pressing the characters button will allow you to view all of the character features and stats. You will also be able to "
put "input and save the hero's name, etc. \n" 
Time.Delay(1000) 
put "Pressing the upgrades button will allow you to upgrade certain character features such as HP, Strength, Vitality, Dexterity "
put ",Intelligence, Defence, current StatPoints and SkillPoints. \n" 
Time.Delay(1000) 
put "Finally, after defeating each boss, the player will gain certain stats such as Exp, SkillPoints, and StatPoints. \n" 
Time.Delay(1000) 
put "In the event that the character dies, the player can restart the game at certain checkpoints in the game. \n" 
Time.Delay(1000) 
put "The restart screen will show up, immediately after the player dies, giving the player the option to restart the game. \n" 
Time.Delay(1000) 
put "There will also be a pause button at each scene for the player to press to have a break from playing the game. \n" 
Time.Delay(1000) 
put "Press any key to go to the next tab: \n" 
getch(charinput)
if hasch then 
Window.Hide(Window1ID) %Close the instructions window after the user presses any key 
end if 

Window2ID := Window.Open("position:300;500,graphics:1000;1000")
Window.Select(Window2ID)

%Set background to light blue
GUI.SetBackgroundColour(77)
%Fills the screen with yellow with each new line of output 
colourback(yellow) 
put "In total there are six characters in the game - three of them are playable characters or the heros! \n"
Time.Delay(500)
put "The remaining three characters are the villains! \n"
Time.Delay(1000)
put "Press 'GoBack' if you want to revisit the previous instructions \n"
Time.Delay(1000)

get response
if response = "GoBack" then
Window.Hide(Window2ID)
Window.Show(Window1ID) %Go back to the previous window
Window.Select(Window1ID)
Time.Delay(1000)
put "Press 'GoForward' if you want to revisit the next set of instructions \n"
Time.Delay(1000)

get response1 
if response1= "GoForward" then
Window.Hide(Window1ID)
Window.Show(Window2ID)
Window.Select(Window2ID)
Time.Delay(1000)
put "To continue, type 'Exit' to exit the instructions page \n" 
Time.Delay(1000)
get response 
if response = "Exit" then
Window.Close(Window1ID)
Window.Close(Window2ID)
end if
end if

elsif response not= "GoBack" then
Window.Show(Window2ID)
Window.Hide(Window1ID)
Window.Select(Window2ID)
put "To continue, type 'Exit' to exit the instructions page \n"
Time.Delay(1000)
get response
if response = "Exit" then
Window.Close(Window1ID)
Window.Close(Window2ID)
cls
end if  
end if 
end Instructions

body procedure Quit
%Hide all windows
Window.Hide(Window1ID)
Window.Hide(Window2ID)
Window.Hide(Window3ID)
Window.Hide(Window4ID)
Window.Hide(Window5ID)
Window.Hide(Window6ID)
Window.Hide(Window7ID)
Window.Hide(Window8ID)
Window.Hide(Window9ID)
Window.Hide(Window10ID)

%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

cls 
put "You have decided to quit! \n"
Time.Delay(1000)
put "To restart, run the program again. \n" 
Time.Delay(1000)
put "The program will now close. \n"
Time.Delay(1000)
cls 
end Quit

body procedure PauseScreen
Window3ID := Window.Open("position:top;centre,graphics:1000;1000")
Window.Select(Window3ID)
MenuButton1ID := GUI.CreateButton(centrex - 70, centrey - 50, 50, "Menu", MenuScreen)
ReturnButton1ID := GUI.CreateButton(centrex - 70, centrey - 75, 50, "Return to previous scene", ReturnPrev)
loop
exit when GUI.ProcessEvent
end loop
end PauseScreen
 
%Display the pause button during game in each scene
body procedure PauseButton
PauseButtonID := GUI.CreateButton(x, y, 50, "Pause", PauseScreen) 
loop
exit when GUI.ProcessEvent 
end loop
end PauseButton

body procedure Resume
%Hide all windows
Window.Hide(Window1ID)
Window.Hide(Window2ID)
Window.Hide(Window3ID)
Window.Hide(Window4ID)
Window.Hide(Window5ID)
Window.Hide(Window6ID)
Window.Hide(Window7ID)
Window.Hide(Window8ID)
Window.Hide(Window9ID)
Window.Hide(Window10ID)

%Close all windows 
Window.Close(Window1ID)
Window.Close(Window2ID)
Window.Close(Window3ID)
Window.Close(Window4ID)
Window.Close(Window5ID)
Window.Close(Window6ID)
Window.Close(Window7ID)
Window.Close(Window8ID)
Window.Close(Window9ID)
Window.Close(Window10ID)

%Now, the user should only see the Run Window, which features the scenes 
end Resume


%Displays the page when the user decides to click on the settings button
body procedure Settings
Window4ID := Window.Open("position:top;centre,graphics:400;300")
Window.Select(Window4ID)
%Display the music button and the number of sessions (based off of the number of times the save button was pressed) 

%Declare the variables: mousex = x coor of mouse, mousey = y coor of mouse, cnt = num of sessions
var mousex, mousey, button, flag : int := 0

%Outputs this string to the screen: number of saved sessions
var num : string := "Number of saved sessions: " + intstr(cnt)
var title : string 
if characters then
title := "This is " + name + "'s current session: "
elsif not characters then
title := "Press the Characters button to input your name. "
end if 
var music : boolean 

View.Set("offscreenonly")
music := true
flag := 0
drawfillbox(0, 0, 400, 300, 77)
drawfillbox(290, 250, 390, 290, white)
var font3 : int := Font.New("Palatino:10:Bold")
Font.Draw("Music: On", 310, 270, font3, black) 
Font.Draw(num, 50, 250, font3, white) %Outputs the num string to the screen
Font.Draw(title, 50, 120, font3, white) %Outputs the title string to the screen
View.Update

loop 
Mouse.Where(mousex, mousey, button) 
if mousex >= 290 & mousex <= 390 & mousey >= 250 & mousey <= 290 & button = 0 then
drawfillbox(290, 250, 390, 290, black)
Font.Draw("Music: On", 310, 270, font3, white)
View.Update

else
drawfillbox(290, 250, 390, 290, white)
Font.Draw("Music: On", 310, 270, font3, black)
View.Update
end if 


if mousex >= 290 & mousex <= 390 & mousey >= 250 & mousey <= 290 & button = 1 & music = true then
music := false 
Music.PlayFileStop
drawfillbox(290, 250, 390, 290, white)
Font.Draw("Music: Off", 310, 270, font3, black)
delay(200) 

elsif mousex >= 290 & mousex <= 390 & mousey >= 250 & mousey <= 290 & button = 1 & music = false then
music := true
drawfillbox(290, 250, 390, 290, white)
Font.Draw("Music: On", 310, 270, font3, black)
delay(200)
end if 

if mousex >= 290 & mousex <= 390 & mousey >= 250 & mousey <= 290 & button = 1 then
flag := 1
end if 
exit when flag not= 0
end loop

Font.Draw("Type GoBack to exit", 200, 150, font3, white)
View.Update
Time.Delay(1000)
get response
View.Update
if response = "GoBack" then
Window.Hide(Window4ID)
end if 
end Settings

%Executes when the user decides to click on the Save button 
body procedure Save
%Once executed, the current session will be saved
Window6ID := Window.Open("position:top;centre,graphics:1000;1000")
Window.Select(Window6ID)
put "Your current session will now be saved. \n" 

%Initialize checkpoints based on which scene the user is currently in  
if scene1 then 
checkpoint1 := true %Used for scene1

elsif scene2 then
checkpoint2 := true %Used for scene2

elsif scene3 then
checkpoint3 := true %Used for scene3

elsif scene4 then
checkpoint4 := true %Used for scene4

elsif scene5 then
checkpoint5 := true %Used for scene5

elsif scene6 then
checkpoint6 := true %Used for scene6

elsif scene7 then
checkpoint7 := true %Used for scene7

elsif scene8 then
checkpoint8 := true %Used for scene8

elsif scene9 then
checkpoint9 := true %Used for scene9

elsif scene10 then
checkpoint10 := true %Used for scene10

elsif scene11 then
checkpoint11 := true %Used for scene11
end if 
cnt := cnt + 1 %Increment counter by 1
Window.Close(Window6ID)
end Save
 
%Displays the page containing the character stats and sprites (will need to improve graphics) 
body procedure Characters
Window7ID := Window.Open("position:top;centre,graphics:1000;1000") %Creates a separate window that displays the stats of the characters
%Command is used to send the output to the newly-created window 
Window.Select(Window7ID)

%Set the sprites
put "There are three characters to choose from. \n"
Time.Delay(1000)
put "1. Jonathan Morris. \n"
Time.Delay(1000)
put "Pros: Good character for users who want to challenge themselves. \n"
Time.Delay(1000)
put "Cons: Not as good as the other two characters \n"
Time.Delay(1000)

put "2. Richter Belmont. \n"
put "Pros: Good character for users who are somewhat used to the game. \n"
Time.Delay(1000)
put "Cons: Not as good as the other two characters \n"
Time.Delay(1000)

put "3. Simon Belmont. \n"
Time.Delay(1000)
put "Pros: Good character for users who are new to the game. \n"
Time.Delay(1000)
put "Cons: Not as good as the other two characters \n"
Time.Delay(1000)

put "If you want to delve deeper, type 'Stats' to view the features for each character, based off of their current levels. \n" 
Time.Delay(1000)
get response
if response = "Stats" then
cls
Time.Delay(500)
put "Now generating a list of stats for each character... \n" 
Time.Delay(1000)

put "1. Jonathan Morris Stats: \n"
Time.Delay(500)
put "Hero Level: "
Time.Delay(500)
put "Hero Exp: "
Time.Delay(500)
put "Hero Next Exp: "
Time.Delay(500)
put "Hero Strength: "
Time.Delay(500)
put "Hero Vitality: "
Time.Delay(500)
put "Hero Dexterity: "
Time.Delay(500)
put "Hero Intelligence: "
Time.Delay(500)
put "Hero HP: "
Time.Delay(500)
put "Hero Stamina: "
Time.Delay(500)
put "Hero Damage: "
Time.Delay(500)
put "HeroDefence: "
Time.Delay(500)
put "Hero Stat Points: "
Time.Delay(500)
put "Hero Skill Points: "
Time.Delay(500)

put "\nPress any key to view Richter's stats: \n"
getch(charinput) 
cls
put "2. Richter Belmont Stats: \n"
Time.Delay(500)
put "Hero Level: "
Time.Delay(500)
put "Hero Exp: "
Time.Delay(500)
put "Hero Next Exp: "
Time.Delay(500)
put "Hero Strength: "
Time.Delay(500)
put "Hero Vitality: "
Time.Delay(500)
put "Hero Dexterity: "
Time.Delay(500)
put "Hero Intelligence: "
Time.Delay(500)
put "Hero HP: "
Time.Delay(500)
put "Hero Stamina: "
Time.Delay(500)
put "Hero Damage: "
Time.Delay(500)
put "HeroDefence: "
Time.Delay(500)
put "Hero Stat Points: "
Time.Delay(500)
put "Hero Skill Points: "
Time.Delay(500)

put "\nPress any key to view Richter's stats: \n"
getch(charinput) 
cls
put "3. Simon Belmont Stats: \n"
Time.Delay(500)
put "Hero Level: "
Time.Delay(500)
put "Hero Exp: "
Time.Delay(500)
put "Hero Next Exp: "
Time.Delay(500)
put "Hero Strength: "
Time.Delay(500)
put "Hero Vitality: "
Time.Delay(500)
put "Hero Dexterity: "
Time.Delay(500)
put "Hero Intelligence: "
Time.Delay(500)
put "Hero HP: "
Time.Delay(500)
put "Hero Stamina: "
Time.Delay(500)
put "Hero Damage: "
Time.Delay(500)
put "HeroDefence: "
Time.Delay(500)
put "Hero Stat Points: "
Time.Delay(500)
put "Hero Skill Points: "
Time.Delay(500)
end if 

put "\nPress any key to choose your character. \n"
getch(charinput)
cls

put "Press 1, 2, or 3 to choose your character: 1 = Jonathan, 2 = Richter, 3 = Simon. \n"
Time.Delay(1000)
get response 
if response = "1" then
put "You have chosen wisely! \n"
Time.Delay(1000)
put "Please input your name. \n"
Time.Delay(1000)
get name 
Time.Delay(1000)
put "Okay. ", name, ". Now that you selected your character, type 'GoBack' to go back. \n"
get response 
if response = "GoBack" then
cls
Window.Close(Window7ID)
end if 
end if 

if response = "2" then
put "Not bad of a choice! \n"
Time.Delay(1000)
put "Please input your name. \n"
Time.Delay(1000)
get name 
Time.Delay(1000)
put "Okay. ", name, ". Now that you selected your character, type 'GoBack' to go back. \n"
get response 
if response = "GoBack" then
cls
Window.Close(Window7ID)
end if 
end if 

if response = "3" then
put "Very good choice! \n"
Time.Delay(1000)
put "Please input your name. \n"
Time.Delay(1000)
get name 
Time.Delay(1000)
put "Okay. ", name, ". Now that you selected your character, type 'GoBack' to go back. \n"
get response 
if response = "GoBack" then
cls
Window.Close(Window7ID)
end if 
end if 
end Characters

body procedure MenuScreen
%Draws the menu screen containing the animation buttons 
    cls()
    SetBackgroundMenu(centrex, centrey) 
    CharactersButtonID := GUI.CreateButton(centrex, centrey + 75, 50, "Characters", Characters)
    SettingsButtonID := GUI.CreateButton(centrex, centrey + 25, 50, "Settings", Settings)
    ResumeButtonID := GUI.CreateButton(centrex, centrey, 50, "Resume", Resume) %Button is used once the user presses the pause button and wants to resume playing game
    SaveButtonID := GUI.CreateButton(centrex, centrey - 25, 50, "Save", Save)
    QuitButtonID := GUI.CreateButton(centrex, centrey - 50, 50, "Quit", Quit)
    ReturnButtonID := GUI.CreateButton(centrex, centrey - 75, 50, "Go Back", Return)
    loop
    exit when GUI.ProcessEvent
    end loop
    
%Display date -> use built-in Time.Date function
locatexy(centrex, centrey - 150) 
put Date
end MenuScreen 
 

 
%Initialize all features for the characters...
%Increase each applicable character feature (e.g.: HP, damage, defence, etc) by a constant of 5 from players 1-3 
procedure InitializeCharacterFeatures()
%Initialize all of the features for the first playable character
%The first hero has good HP, stamina, and strength, however, does not have very good intelligence and vitality 
if Hero1 then
Hero1Level := 1
Hero1Exp := 0 
Hero1NextExp := 10
Hero1Strength := 10 
Hero1Vitality := 3 
Hero1Dexterity := 5
Hero1Intelligence := 5 %The hero intelligence affects the damage that he gets 
Hero1HP := 100
Hero1Stamina := 10
Hero1Damage := 10

%Use Rand.Int() function to ranodmize the damage
Hero1MinDamage := 1
Hero1MaxDamage := 5
Hero1Defence := 5
 
%The folloing two stats are increased whenever the character defeats a villain (display them at the end of the game) 
    %The constant is relatively greater than the previous two characters 
Hero1StatPoints := 0
Hero1SkillPoints := 0
end if 
 
%Initialize all of the features for the second playable character
if Hero2 then
%The second hero has even better HP, stamina, strength, Starting Exp, however, does not have as good of a vitality and dexterity as the first character 
Hero2Level := 1
Hero2Exp := 5
Hero2NextExp := 15
Hero2Strength := 15
Hero2Vitality := 5
Hero2Dexterity := 8
Hero2Intelligence := 8
Hero2HP := 120
Hero2Stamina := 15
Hero2Damage := 20

%Use Rand.Int() function to ranodmize the damage
Hero2MinDamage := 1
Hero2MaxDamage := 10
Hero2Defence := 8
 
%The folloing two stats are increased whenever the character defeats a villain (display them at the end of the game) 
    %The constant is relatively greater than the previous two characters 
Hero2StatPoints := 0
Hero2SkillPoints := 5
end if 
 
%Initialize all of the features for the third playable character
%The second hero has even better HP, stamina, strength, Starting Exp, however, does not have as good of a vitality and dexterity as the first character 
if Hero3 then
Hero3Level := 1
Hero3Exp := 8
Hero3NextExp := 20
Hero3Strength := 20
Hero3Vitality := 8
Hero3Dexterity := 10
Hero3Intelligence := 10
Hero3HP := 130
Hero3Stamina := 20
Hero3Damage := 30

%Use Rand.Int() function to ranodmize the damage
Hero3MinDamage := 1
Hero3MaxDamage := 15
Hero3Defence := 10
 
%The folloing two stats are increased whenever the character defeats a villain (display them at the end of the game) 
    %The constant is relatively greater than the previous two characters 
Hero3StatPoints := 0
Hero3SkillPoints := 10
end if 
 
%Initialize all of the features for the first boss 
if Villain1 then
Villain1HP := 150
 
%The villain exp is added to the hero's after defeat
Villain1Exp := 100
 
Villain1Damage := 15

%Use Rand.Int() function to ranodmize the damage
Villain1MinDamage := 5
Villain1MaxDamage := 9
end if 
 
%Initialize all of the features for the second boss 
if Villain2 then
Villain2HP := 200
 
%The villain exp is added to the hero's after defeat
Villain2Exp := 150
 
Villain2Damage := 25

%Use Rand.Int() function to ranodmize the damage
Villain2MinDamage := 9
Villain2MaxDamage := 12
end if 
 
%Initialize all of the features for the third boss
if Villain3 then
Villain3HP := 200
 
%The villain exp is added to the hero's after defeat
Villain3Exp := 20

Villain3Damage := 35
 
%Use Rand.Int() function to randomize the damage
Villain3MinDamage := 12
Villain3MaxDamage := 15
end if 
end InitializeCharacterFeatures
 
 
%Calculate the exp of the hero (should increase after each battle)
%May depend on the boss difficulty as well 
%Not completely necessary 
body procedure CalcExp
if Villain1Defeat then %If Villain1 is defeated
if Hero1 then
Hero1Exp := Hero1Exp + Villain1Exp + Rand.Int(1, 50) %Add a randomizer 
end if  

if Hero2 then
Hero2Exp := Hero2Exp + Villain1Exp + Rand.Int(1, 50) %Add a randomizer
end if 

if Hero3 then
Hero3Exp := Hero3Exp + Villain1Exp + Rand.Int(1, 50) %Add a randomizer
end if 
end if 

if Villain2Defeat then %If Villain2 is defeated
if Hero1 then
Hero1Exp := Hero1Exp + Villain2Exp + Rand.Int(1, 50) %Add a randomizer 
end if  

if Hero2 then
Hero2Exp := Hero2Exp + Villain2Exp + Rand.Int(1, 50) %Add a randomizer
end if 

if Hero3 then
Hero3Exp := Hero3Exp + Villain2Exp + Rand.Int(1, 50) %Add a randomizer
end if 
end if 

if Villain3Defeat then %If Villain3 is defeated
if Hero1 then
Hero1Exp := Hero1Exp + Villain3Exp + Rand.Int(1, 50) %Add a randomizer 
end if  

if Hero2 then
Hero2Exp := Hero2Exp + Villain3Exp + Rand.Int(1, 50) %Add a randomizer
end if 

if Hero3 then
Hero3Exp := Hero3Exp + Villain3Exp + Rand.Int(1, 50) %Add a randomizer
end if 
end if 
end CalcExp
 

body procedure Levelupdate
%If the character has already levelled up (used after the LevelUp procedure), then upgrade the NextExp, Strength, Vitality, Dexterity, Statpoints, SkillPoints, Intelligence, etc 
%The maximum level is 3 
if levelup then
if Hero1 then
if Hero1Level = 2 then 
Hero1Strength := Hero1Strength + 2
Hero1Vitality := Hero1Vitality + 3
Hero1Dexterity := Hero1Dexterity + 3
Hero1Stamina := Hero1Stamina + 5 
Hero1Damage := Hero1Damage + 25
Hero1MinDamage := Hero1MinDamage + 2 
Hero1MaxDamage := Hero1MaxDamage + 3 
Hero1Intelligence := Hero1Intelligence + 2 
Hero1SkillPoints := Hero1SkillPoints + 5
Hero1StatPoints := Hero1StatPoints + 10 
 
elsif Hero1Level = 3 then
Hero1Strength := Hero1Strength + 4
Hero1Vitality := Hero1Vitality + 5
Hero1Dexterity := Hero1Dexterity + 5
Hero1Stamina := Hero1Stamina + 7 
Hero1Damage := Hero1Damage + 50
Hero1MinDamage := Hero1MinDamage + 4
Hero1MaxDamage := Hero1MaxDamage + 5
Hero1Intelligence := Hero1Intelligence + 5
Hero1SkillPoints := Hero1SkillPoints + 8
Hero1StatPoints := Hero1StatPoints + 13
end if 
end if 
 
if Hero2 then
if Hero2Level = 2 then 
Hero2Strength := Hero2Strength + 5
Hero2Vitality := Hero2Vitality + 6
Hero2Dexterity := Hero2Dexterity + 6
Hero2Stamina := Hero2Stamina + 8 
Hero2Damage := Hero2Damage + 25
Hero2MinDamage := Hero2MinDamage + 5
Hero2MaxDamage := Hero2MaxDamage + 6
Hero2Intelligence := Hero2Intelligence + 5
Hero2SkillPoints := Hero2SkillPoints + 8 
Hero2StatPoints := Hero2StatPoints + 13 
 
elsif Hero2Level = 3 then 
Hero2Strength := Hero2Strength + 7
Hero2Vitality := Hero2Vitality + 8
Hero2Dexterity := Hero2Dexterity + 8
Hero2Stamina := Hero2Stamina + 10
Hero2Damage := Hero2Damage + 50
Hero2MinDamage := Hero2MinDamage + 7 
Hero2MaxDamage := Hero2MaxDamage + 8
Hero2Intelligence := Hero2Intelligence + 7 
Hero2SkillPoints := Hero2SkillPoints + 10 
Hero2StatPoints := Hero2StatPoints + 15 
end if
end if 
 
if Hero3 then
if Hero3Level = 2 then 
Hero3Strength := Hero3Strength + 6
Hero3Vitality := Hero3Vitality + 8
Hero3Dexterity := Hero3Dexterity + 8
Hero3Stamina := Hero3Stamina + 10 
Hero3Damage := Hero3Damage + 25
Hero3MinDamage := Hero3MinDamage + 6 
Hero3MaxDamage := Hero3MaxDamage + 10 
Hero3Intelligence := Hero3Intelligence + 8 
Hero3SkillPoints := Hero3SkillPoints + 10 
Hero3StatPoints := Hero3StatPoints + 15 
 
elsif Hero3Level = 3 then  
Hero3Strength := Hero3Strength + 8 
Hero3Vitality := Hero3Vitality + 10
Hero3Dexterity := Hero3Dexterity + 10
Hero3Stamina := Hero3Stamina + 12 
Hero3Damage := Hero3Damage + 50
Hero3MinDamage := Hero3MinDamage + 8 
Hero3MaxDamage := Hero3MaxDamage + 12 
Hero3Intelligence := Hero3Intelligence + 10 
Hero3SkillPoints := Hero3SkillPoints + 12 
Hero3StatPoints := Hero3StatPoints + 17 
end if
end if 
end if 
end Levelupdate
 
%Used to level up the hero, based off of their current exp and calculates the value of the next exp
body procedure LevelUp
%Following algorithm returns the next exp of the hero and is intended to make it more difficult for the hero to level up, every time it is run
%Level 3 is the max level...
if Hero1 & Hero1Exp >= Hero1NextExp & Hero1Level < 3 then 
Hero1Level := Hero1Level + 1
levelup := true 
Levelupdate() 
Hero1NextExp := (50 div 3) * ((Hero1Level ** 3) - 6 * (Hero1Level ** 2) + 17 * Hero1Level - 12)
end if 
 
%Level 3 is the max level...
if Hero2 & Hero2Exp >= Hero2NextExp & Hero2Level < 3 then 
Hero2Level := Hero2Level + 1
levelup := true 
Levelupdate() 
Hero2NextExp := (50 div 3) * ((Hero2Level ** 3) - 6 * (Hero2Level ** 2) + 17 * Hero2Level - 12)
end if 
 
%Level 3 is the max level...
if Hero3 & Hero3Exp >= Hero3NextExp & Hero3Level < 3 then 
Hero3Level := Hero3Level + 1
levelup := true 
Levelupdate() 
Hero3NextExp := (50 div 3) * ((Hero3Level ** 3) - 6 * (Hero3Level ** 2) + 17 * Hero3Level - 12)
end if 
end LevelUp


%Need to declare these procedures before declaring the procedures associated with the scenes 
%Used after an attack from the hero
body procedure CalcDamageHero
if not limit or not ZeroHPHero then %If Hero is not dead 
if Hero1 then 
TotalDamageHero1 := Hero1Damage + Rand.Int(Hero1MinDamage, Hero1MaxDamage) 
end if 

if Hero2 then 
TotalDamageHero2 := Hero2Damage + Rand.Int(Hero2MinDamage, Hero2MaxDamage)
end if
 
if Hero3 then
TotalDamageHero3 := Hero3Damage + Rand.Int(Hero3MinDamage, Hero3MaxDamage) 
end if 
end if 
end CalcDamageHero


%Used after an attack from the villain
body procedure CalcDamageVillain
if not limit & not ZeroHPVillain then %If Villain is not dead
if Villain1 then
TotalDamageVillain1 := Villain1Damage + Rand.Int(Villain1MinDamage, Villain1MaxDamage)
end if 

if Villain2 then
TotalDamageVillain2 := Villain2Damage + Rand.Int(Villain2MinDamage, Villain2MaxDamage)
end if  

if Villain3 then 
TotalDamageVillain3 := Villain3Damage + Rand.Int(Villain3MinDamage, Villain3MaxDamage)
end if 
end if
end CalcDamageVillain
 
%Used after the player decides to use his defense 
body procedure CalcDefence
if not limit & not ZeroHPHero then
if Villain1 then 
if Hero1 then 
NetDamageHero1 := TotalDamageVillain1 - Hero1Defence
end if 

if Hero2 then
NetDamageHero2 := TotalDamageVillain1 - Hero2Defence
end if 

if Hero3 then
NetDamageHero3 := TotalDamageVillain1 - Hero3Defence
end if 
end if 

if Villain2 then
if Hero1 then 
NetDamageHero1 := TotalDamageVillain2 - Hero1Defence
end if 

if Hero2 then
NetDamageHero2 := TotalDamageVillain2 - Hero2Defence
end if 

if Hero3 then
NetDamageHero3 := TotalDamageVillain2 - Hero3Defence
end if 
end if 

if Villain3 then
if Hero1 then 
NetDamageHero1 := TotalDamageVillain3 - Hero1Defence
end if 

if Hero2 then
NetDamageHero2 := TotalDamageVillain3 - Hero2Defence
end if 

if Hero3 then
NetDamageHero3 := TotalDamageVillain3 - Hero3Defence
end if 
end if 
end if 
end CalcDefence 
 
%Implements an algorithm that restores the hero's HP, used when the user decides to rest 
body procedure GainHP
if rest & not ZeroHPHero & not limit then
loop
if Hero1 then
Hero1HP := Hero1HP + 10 %Increment by 10 each time the loop is run
end if 

if Hero2 then
Hero2HP := Hero2HP + 10 %Increment by 10 each time the loop is run
end if

if Hero3 then
Hero3HP := Hero3HP + 10 %Increment by 10 each time loop is run
end if

exit when Hero1HP >= 100 or Hero2HP >= 100 or Hero3HP >= 100 
end loop

if Hero1 then
put "Jonathan's HP has been restored. \n"
end if

if Hero2 then
put "Richter's HP has been restored. \n"
end if 

if Hero3 then
put "Simon's HP has been restored. \n"
end if 
end if 
end GainHP

%Get the remaining HP of the hero, based off of the CalcDamage...() procedures
body procedure GetHeroHP
if not ZeroHPHero & not limit then
CalcDamageVillain() 
if Defend then %If the user chooses to use defence...
CalcDefence()
if Hero1 then
Hero1HP := Hero1HP - NetDamageHero1
end if 
if Hero2 then
Hero2HP := Hero2HP - NetDamageHero2
end if 
if Hero3 then
Hero3HP := Hero3HP - NetDamageHero3
end if 
end if 

%Assume that user has not used Defence
if Villain1 then
if Hero1 then
Hero1HP := Hero1HP - TotalDamageVillain1
end if 
if Hero2 then
Hero2HP := Hero2HP - TotalDamageVillain1
end if
if Hero3 then
Hero3HP := Hero3HP - TotalDamageVillain1
end if 
end if 

if Villain2 then
if Hero1 then
Hero1HP := Hero1HP - TotalDamageVillain2
end if 
if Hero2 then
Hero2HP := Hero2HP - TotalDamageVillain2
end if
if Hero3 then
Hero3HP := Hero3HP - TotalDamageVillain2
end if 
end if 

if Villain3 then
if Hero1 then
Hero1HP := Hero1HP - TotalDamageVillain3
end if 
if Hero2 then
Hero2HP := Hero2HP - TotalDamageVillain3
end if
if Hero3 then
Hero3HP := Hero3HP - TotalDamageVillain3
end if 
end if 
end if 
end GetHeroHP
 
%Get the remaining HP of the villain, based off of the CalcDamage...() procedures
body procedure GetVillainHP
if not ZeroHPVillain & not limit then
CalcDamageHero()
if Hero1 then
if Villain1 then
Villain1HP := Villain1HP - TotalDamageHero1
end if 
if Villain2 then
Villain2HP := Villain2HP - TotalDamageHero1
end if 
if Villain3 then
Villain3HP := Villain3HP - TotalDamageHero1
end if 
end if 

if Hero2 then
if Villain1 then
Villain1HP := Villain1HP - TotalDamageHero2
end if 
if Villain2 then
Villain2HP := Villain2HP - TotalDamageHero2
end if 
if Villain3 then
Villain3HP := Villain3HP - TotalDamageHero2
end if 
end if 

if Hero3 then
if Villain3 then
Villain1HP := Villain1HP - TotalDamageHero3
end if 
if Villain2 then
Villain2HP := Villain2HP - TotalDamageHero3
end if 
if Villain3 then
Villain3HP := Villain3HP - TotalDamageHero3
end if 
end if 
end if 
end GetVillainHP

%HealthBarHero animation
body procedure HealthBarHero
if clickplay & attack then 
var Health : int := 100
CalcDamageVillain()
GetHeroHP()
var x, y : int := 0
 
View.Set("offscreenonly")
loop
if Hero1 then
Health := Hero1HP
end if 

if Hero2 then
Health := Hero2HP
end if 

if Hero3 then
Health := Hero3HP
end if 

drawbox(150, 350, 250, 370, black)
if Health + 150 >= 216 then 
drawfillbox(150, 350, Health + 150, 370, brightgreen)
View.Update()
delay(500)
cls

elsif Health + 150 < 216 & Health + 150 >= 183 then
drawfillbox(150, 350, Health + 150, 370, yellow)
View.Update()
delay(500)
cls
elsif Health + 150 < 183 & Health + 150 > 150 then 
drawfillbox(150, 350, Health + 150, 370, brightred)
View.Update()
delay(500)
cls
end if 
exit when Health <= 0
end loop
end if 
end HealthBarHero

%HealthBarVillain animation
body procedure HealthBarVillain
if clickplay & attack then 
var Health1 : int := 100
CalcDamageVillain()
GetHeroHP()
var x, y : int := 0
 
View.Set("offscreenonly")
loop
if Hero1 then
Health1 := Hero1HP
end if 

if Hero2 then
Health1 := Hero2HP
end if 

if Hero3 then
Health1 := Hero3HP
end if 

drawbox(350, 350, 450, 370, black)
if Health1 + 350 >= 416 then 
drawfillbox(350, 350, Health1 + 350, 370, brightgreen)
View.Update()
delay(500)
cls

elsif Health1 + 350 < 416 & Health1 + 350 >= 383 then
drawfillbox(350, 350, Health1 + 350, 370, yellow)
View.Update()
delay(500)
cls

elsif Health1 + 350 < 383 & Health1 + 350 > 350 then 
drawfillbox(350, 350, Health1 + 350, 370, brightred)
View.Update()
delay(500)
cls
end if 
exit when Health1 <= 0
end loop
end if 
end HealthBarVillain
 
 
%Store and pre-process all of the sprites into the respective arrays for the animation
%We can also use GIF files (maybe for the beginning of the game)  
procedure StoreSprites()
%Still may need to find more sprites for the Hero1MoveL, Hero2MoveL, Hero3MoveL, Hero1arrContinue, Hero1arrRest animation 
 
for i : 1 .. 3
Hero2arrUpgrade(i - 1) := Pic.FileNew("Hero2Upgrade." + intstr(i) + ".bmp")
if Error.Last not = 0 then
   put "Error loading image: ", Error.LastMsg
   FailtoGenerate := true
    return
    end if
end for 
sprite := Hero2arrUpgrade(0)

for i : 1 .. 9 
Hero1arrMoveL(i - 1) := Pic.FileNew("Hero1MoveL." + intstr(i) + ".bmp")  
if Error.Last not = 0 then
   put "Error loading image: ", Error.LastMsg
   FailtoGenerate := true
    return
    end if
end for 
sprite1 := Hero1arrMoveL(0) 
 
for i : 1 .. 9 
Hero1arrMoveR(i - 1) := Pic.FileNew("Hero1MoveR." + intstr(i) + ".bmp")  
if Error.Last not = 0 then
   put "Error loading image: ", Error.LastMsg
   FailtoGenerate := true
    return
    end if
end for 
sprite2 := Hero1arrMoveR(0) 

for i : 1 .. 4
Hero1attackarr(i - 1) := Pic.FileNew("Hero1." + intstr(i + 1) + ".bmp")
if Error.Last not = 0 then
   put "Error loading image: ", Error.LastMsg
   FailtoGenerate := true
    return
    end if
end for 
sprite3 := Hero1attackarr(0) 


for i : 2 .. 6 
Hero2attackarr(i - 2) := Pic.FileNew("Hero2." + intstr(i) + ".bmp") 
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for
sprite4 := Hero2attackarr(0) 

for i : 1 .. 3
Hero2arrUpgrade(i - 1) := Pic.FileNew("Hero2." + intstr(i + 8) + ".bmp")
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for
sprite5 := Hero2arrUpgrade(0)

for i : 1 .. 8 
Hero2arrMoveL(i - 1) := Pic.FileNew("Hero2MoveL." + intstr(i) + ".bmp")
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for
sprite6 := Hero2arrMoveL(0)

for i : 1 .. 8
Hero2arrMoveR(i - 1) := Pic.FileNew("Hero2MoveR." + intstr(i) + ".bmp")
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for
sprite7 := Hero2arrMoveR(0)

for i : 1 .. 6 
Hero3arrMoveR(i - 1) := Pic.FileNew("Hero3." + intstr(i + 1) + ".bmp")
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for 
sprite8 := Hero3arrMoveR(0)

for i : 1 .. 6 
Hero3arrMoveL(i - 1) := Pic.FileNew("Hero3RunL." + intstr(i) + ".bmp")
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for 
sprite9 := Hero3arrMoveL(0)

for i : 1 .. 4
Hero3attackarr(i - 1) := Pic.FileNew("Hero3." + intstr(i + 7) + ".bmp")
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for
sprite10 := Hero3attackarr(0)
 
for i : 1 .. 2 
Hero3arrRest(i - 1) := Pic.FileNew("Hero3Rest." + intstr(i) + ".bmp")
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for
sprite11 := Hero3arrRest(0)


for i : 1 .. 4
Villain1Rarr(i - 1) := Pic.FileNew("Villain1." + intstr(i) + ".bmp")
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for
sprite12 := Villain1Rarr(0)

for i : 1 .. 4
Villain1Larr(i - 1) := Pic.FileNew("Villain1." + intstr(i + 5) + ".bmp")
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for 
sprite13 := Villain1Larr(0)

for i : 1 .. 4
Villain2attackRarr(i - 1) := Pic.FileNew("Villain2." + intstr(i) + ".bmp")
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for 
sprite14 := Villain2attackLarr(0)

for i : 1 .. 4
Villain2attackLarr(i - 1) := Pic.FileNew("Villain2." + intstr(i + 5) + ".bmp")
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for
sprite15 := Villain2attackRarr(0)

for i : 1 .. 6 
Villain3attackRarr(i - 1) := Pic.FileNew("Villain3." + intstr(i) + ".bmp")
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for 
sprite16 := Villain3attackRarr(0)

for i : 1 .. 6 
Villain3attackLarr(i - 1) := Pic.FileNew("Villain3." + intstr(i + 6) + ".bmp")
if Error.Last not = 0 then
put "Error loading image: ", Error.LastMsg 
FailtoGenerate := true
return
end if 
end for
sprite17 := Villain3attackLarr(0)
end StoreSprites
 

body procedure Upgrade
if Hero1 then
Sprite.SetPosition(Hero1sprite21, Hero1x, Hero1y, true)
Sprite.Show(Hero1sprite21)
end if 

if Hero2 then
for i : 1 .. 3
Sprite.ChangePic(sprite, Hero2arrUpgrade(i mod 3))
Sprite.SetPosition(sprite, Hero2x, Hero2y, true)
Sprite.Show(sprite)
delay(100)
end for 
Sprite.Free(sprite)
SetHero(Hero2String, Hero2x, Hero2y)
end if 
end Upgrade 


%Used for when the user decides to move right -> used along with "mover"
body procedure MoveRight
right := true
CollisionDetection()
if not limit & not MonsterHit then
if Hero1 then
for i : 1 .. 9
Hero1x := Hero1x + 10 
Sprite.ChangePic(sprite2, Hero1arrMoveR(i mod 9)) 
Sprite.SetPosition(sprite2, Hero1x, Hero1y, true)
Sprite.Show(sprite2)
delay(100)
end for
Sprite.Free(sprite2)
SetHero(Hero1String, Hero1x, Hero1y)
end if 

if Hero2 then
for i : 1 .. 8 
Hero2x := Hero2x + 11
Sprite.ChangePic(sprite7, Hero2arrMoveR(i mod 8))
Sprite.SetPosition(sprite7, Hero2x, Hero2y, true)
Sprite.Show(sprite7)
delay(100)
end for 
Sprite.Free(sprite7)
SetHero(Hero2String, Hero2x, Hero2y)
end if 

if Hero3 then
for i : 1 .. 6 
Hero3x := Hero3x + 15
Sprite.ChangePic(sprite8, Hero3arrMoveR(i mod 6))
Sprite.SetPosition(sprite8, Hero3x, Hero3y, true)
Sprite.Show(sprite8)
delay(100)
end for 
Sprite.Free(sprite8)
SetHero(Hero3String, Hero3x, Hero3y)
end if 
end if 
end MoveRight

%Used for when the user chooses to do MoveLeft as an option -> go back to previous scene
body procedure MoveLeft
left := true
CollisionDetection() 
if not limit & not MonsterHit then
if Hero1 then
for i : 1 .. 9
Hero1x := Hero1x - 10
Sprite.ChangePic(sprite1, Hero1arrMoveL(i mod 9)) 
Sprite.SetPosition(sprite1, Hero1x, Hero1y, true)
Sprite.Show(sprite1)
delay(100)
end for
Sprite.Free(sprite1)
SetHero(Hero1String, Hero1x, Hero1y)
end if 

if Hero2 then
for i : 1 .. 8 
Hero2x := Hero2x - 11
Sprite.ChangePic(sprite6, Hero2arrMoveL(i mod 8))
Sprite.SetPosition(sprite6, Hero2x, Hero2y, true)
Sprite.Show(sprite6)
delay(100)
end for 
Sprite.Free(sprite6)
SetHero(Hero2String, Hero2x, Hero2y)
end if

if Hero3 then
for i : 1 .. 6 
Hero3x := Hero3x - 15
Sprite.ChangePic(sprite9, Hero3arrMoveL(i mod 6))
Sprite.SetPosition(sprite9, Hero3x, Hero3y, true)
Sprite.Show(sprite9)
delay(100)
end for 
Sprite.Free(sprite9)
SetHero(Hero3String, Hero3x, Hero3y)
end if 
end if 
end MoveLeft
 
%Used for when the user decides to continue -> go to next scene 
body procedure Continue
put "To continue, you must defeat the villain in the scene \n"
end Continue
 
%Used for when the uaer decides to rest -> the HP should increase; use an algorithm that should not be linear 
body procedure Resting %Used along with "rest" 
GainHP()
end Resting

%Procedure implements most of the collision detection for this game
%Used for when the player comes into contact with the villain 
%If so, the player loses all HP, if not, then continue
%Procedure also allows the player to keep moving until the boolean is true 
body procedure CollisionDetection
%May need to optimize procedure because of all of the loops 
%Implement the actual if statement for the booleans 
if Hero1x = Villain1x or Hero1x = Villain2x or Hero1x = Villain3x or Hero2x = Villain1x or Hero2x = Villain2x or Hero2x = Villain3x 
or Hero3x = Villain1x or Hero3x = Villain2x or Hero3x = Villain3x then 
MonsterHit := true
end if 
if Hero1y >= limitMaxy or Hero1y <= limitMiny or Hero1x <= limitMinx or Hero1x >= limitMaxx 
or Hero2y >= limitMaxy or Hero2y <= limitMiny or Hero2x <= limitMinx or Hero2x >= limitMaxx 
or Hero3y >= limitMaxy or Hero3y <= limitMiny or Hero3x <= limitMinx or Hero3x >= limitMaxx then
limit := true
end if 
end CollisionDetection

%Following procedures rely on the booleans - Fight, Decline
%Used for the first boss battle
body procedure Battle1
 
end Battle1 
 
%Used for the second boss battle
body procedure Battle2
 
end Battle2
 
%Used for the third boss battle
body procedure Battle3
 
end Battle3
 
body procedure UserInput 
loop
%Arrow keys are used for the Four Options procedure
Input.KeyDown(input) 
%Right arrow is for moving right or if the user chooses move right as an option
if input (KEY_RIGHT_ARROW) or mover then
put "You have chosen to move right! \n"
Time.Delay(1000)
MoveRight() %Execute the moveright animation...
 
%Left arrow is for moving left or if the user chooses move left as an option
if input (KEY_LEFT_ARROW) or movel then 
put "You have chosen to move left! \n"
Time.Delay(1000)
MoveLeft() %Execute the moveleft animation...

%Up arrow is for continuing or if the user chooses continue as an option
if input (KEY_UP_ARROW) or continue then
put "You have chosen to continue! \n"
Time.Delay(1000)
Continue() 
%Execute the continue animation...
 
%Down arrow is for resting or if the user chooses rest as an option
if input (KEY_DOWN_ARROW) or rest then
put "You have chosen to rest! \n"
Time.Delay(1000)
Resting() %Execute the resting animation...

else
%Used for the Two Options procedure 
%Following char input is for attacking options, which will be displayed onto the screen during battles  
getch(charinput)

%For the attack option
%If the user presses 'A' or 'a' or types 'attack' 
if charinput = "A" or charinput = "a" or attack then
if Villain1 then 
Battle1() %Run animation
end if 

if Villain2 then
Battle2() %Run animation
end if 

if Villain3 then
Battle3() %Run animation
end if 

%For the decline action 
%If the user presses 'W' or 'w' or types 'decline'
elsif charinput = "W" or charinput = "w" or decline then
put "You have chosen to decline! \n"
Time.Delay(500)
put "You now could use Upgrades and/or Defence \n"
Time.Delay(500)
put "Press the U character to use upgrades. Note that upgrades only apply for Jonathan and Simon. \n"
Time.Delay(500)
getch(charinput)
if charinput = "U" or charinput = "u" then 
Upgrade()
elsif charinput = "D" or charinput = "d" then
Defend := true %Set boolean equal to true
end if 
end if 
end if 
end if 
end if 
end if 
%Exit the user-input loop when the player crosses the boundaries or comes into contact with the monster 
exit when limit or MonsterHit 
end loop
end UserInput 
 
%Give the user the main storyline in the first scene
body procedure StoryPlot
introscene := true
Window10ID := Window.Open("position:top;centre,graphics:1000;1000")
Window.Select(Window10ID)
put "Welcome to the game ", name, " ! \n"
Time.Delay(500)
put "For decades, the spirits of darkness have terrorized the Kingdom of Dragon Age. \n"
Time.Delay(500)
put "In particular, these spirits of darkness come in the form of 3 monsters or villains which you have to defeat \n"
Time.Delay(500)
put "As the role of the protagonist, the fate of the Kingdom of Dragon Age lies in your hands. \n"
Time.Delay(500)
put "Upon finishing this game, if you are not successful in defeating the monsters, then the Kingdom will be lost forever. \n"
Time.Delay(500)
put "However, if you do manage to, then hoorah! You are the true hero! \n"
Time.Delay(500)
put "Remember, if you fail at first, feel free to keep on trying! \n"
Time.Delay(500)
put "Without any further ado, good luck young valiant one! \n"
Time.Delay(500)
end StoryPlot

%For the first scene after the beginning frame (introduce the main storyline or the plot)
%Change the coodinates later 
body procedure Scene1
scene1 := true
%Initailize all sprites
InitializeSprites()

%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

var temp, temp1 : int 
temp := 550
temp1 := 370
%Pause button
PauseButton(temp, temp1) 

%Health bar
HealthBarHero()
HealthBarVillain()

%Four Options
FourOptions()

%Two Options
TwoOptions()

%Clears the screen
cls
%Set background picture
SetBackground1(background1x, background1y)
 
%Set the standinghero sprites, based from the character the user chose in the menu screen
if Hero1 then 
SetHero(Hero1String, ytemp, ytemp) 
Time.Delay(100) 
end if 

if Hero2 then
SetHero(Hero2String, ytemp, ytemp) 
Time.Delay(100) 
end if 
 
if Hero3 then
SetHero(Hero3String, ytemp, ytemp) 
Time.Delay(100) 
end if 
 
%Declare the storyline to the user 
StoryPlot() 
UserInput() 
end Scene1 

body procedure Scene2 
scene2 := true
%Initailize all sprites
InitializeSprites()

%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

var temp, temp1 : int 
temp := 550
temp1 := 370
%Pause button
PauseButton(temp, temp1) 

%Health bar
HealthBarHero()
HealthBarVillain()

%Four Options
FourOptions()

%Two Options
TwoOptions()

%Clears the screen
cls
%Set background picture
SetBackground2(background2x, background2y)

%Set the standinghero sprites, based from the character the user chose in the menu screen
if Hero1 then 
SetHero(Hero1String, ytemp, ytemp)   
Time.Delay(100) 
end if 
 
if Hero2 then
SetHero(Hero2String, ytemp, ytemp) 
Time.Delay(100) 
end if 
 
if Hero3 then
SetHero(Hero3String, ytemp, ytemp) 
Time.Delay(100) 
end if 

UserInput()
end Scene2

body procedure Scene3 
scene3 := true
%Initailize all sprites
InitializeSprites()

%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

var temp, temp1 : int 
temp := 550
temp1 := 370
%Pause button
PauseButton(temp, temp1) 

%Health bar
HealthBarHero()
HealthBarVillain()

%Four Options
FourOptions()

%Two Options
TwoOptions()

%Clears the screen
cls
%Set background picture
SetBackground3(background3x, background3y)
%Set the standinghero sprites, based from the character the user chose in the menu screen
if Hero1 then 
SetHero(Hero1String, ytemp, ytemp) 
Time.Delay(100) 
end if 
 
if Hero2 then
SetHero(Hero2String, ytemp, ytemp) 
Time.Delay(100) 
end if 
 
if Hero3 then
SetHero(Hero3String, ytemp, ytemp) 
Time.Delay(100) 
end if 

UserInput()
end Scene3
 

body procedure Scene4
scene4 := true
%Initailize all sprites
InitializeSprites()

%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

var temp, temp1 : int 
temp := 550
temp1 := 370
%Pause button
PauseButton(temp, temp1) 

%Health bar
HealthBarHero()
HealthBarVillain()

%Four Options
FourOptions()

%Two Options
TwoOptions()

%Clears the screen
cls
%Set background picture
SetBackground4(background4x, background4y)
%Set the standinghero sprites, based from the character the user chose in the menu screen
if Hero1 then 
SetHero(Hero1String, ytemp, ytemp)  
Time.Delay(100) 
end if 
 
if Hero2 then
SetHero(Hero2String, ytemp, ytemp) 
Time.Delay(100) 
end if 
 
if Hero3 then
SetHero(Hero3String, ytemp, ytemp) 
Time.Delay(100) 
end if 

%Set Villain1
SetVillain(Villain1String, ytemp) 
UserInput()
end Scene4 
 
%Make sure to conclude the hero's journey by stating the ending 
body procedure Scene5
scene5 := true
%Initailize all sprites
%Initailize all sprites
InitializeSprites()

%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

var temp, temp1 : int 
temp := 550
temp1 := 370
%Pause button
PauseButton(temp, temp1) 

%Health bar
HealthBarHero()
HealthBarVillain()

%Four Options
FourOptions()

%Two Options
TwoOptions()

%Clears the screen
cls
%Set background picture
SetBackground5(background5x, background5y)
%Set the standinghero sprites, based from the character the user chose in the menu screen
if Hero1 then 
SetHero(Hero1String, ytemp, ytemp) 
Time.Delay(100) 
end if 
 
if Hero2 then
SetHero(Hero2String, ytemp, ytemp)  
Time.Delay(100) 
end if 
 
if Hero3 then
SetHero(Hero3String, ytemp, ytemp)   
Time.Delay(100) 
end if 

SetVillain(Villain2String, ytemp) 
UserInput()
end Scene5
 
body procedure Scene6
scene6 := true
%Initailize all sprites
%Initailize all sprites
InitializeSprites()

%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

var temp, temp1 : int 
temp := 550
temp1 := 370
%Pause button
PauseButton(temp, temp1) 

%Health bar
HealthBarHero()
HealthBarVillain()

%Four Options
FourOptions()

%Two Options
TwoOptions()

%Clears the screen
cls
%Set background picture
SetBackground6(background6x, background6y)
%Set the standinghero sprites, based from the character the user chose in the menu screen
if Hero1 then 
SetHero(Hero1String, ytemp, ytemp) 
Time.Delay(100) 
end if 
 
if Hero2 then
SetHero(Hero2String, ytemp, ytemp) 
Time.Delay(100) 
end if 
 
if Hero3 then
SetHero(Hero3String, ytemp, ytemp) 
Time.Delay(100) 
end if 

%Set Villain3
SetVillain(Villain3String, ytemp) 
UserInput()
end Scene6

body procedure Scene7
scene7 := true
%Initailize all sprites
%Initailize all sprites
InitializeSprites()

%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

var temp, temp1 : int 
temp := 550
temp1 := 370
%Pause button
PauseButton(temp, temp1) 

%Health bar
HealthBarHero()
HealthBarVillain()

%Four Options
FourOptions()

%Two Options
TwoOptions()

%Clears the screen
cls
SetBackground7(background7x, background7y) 
%Set the standinghero sprites, based from the character the user chose in the menu screen
if Hero1 then 
SetHero(Hero1String, ytemp, ytemp) 
Time.Delay(100) 
end if 
 
if Hero2 then
SetHero(Hero2String, ytemp, ytemp) 
Time.Delay(100) 
end if 
 
if Hero3 then
SetHero(Hero3String, ytemp, ytemp) 
Time.Delay(100) 
end if 

%Set Villain2
SetVillain(Villain2String, ytemp) 
UserInput()
end Scene7 
 
body procedure Scene8
scene8 := true 
%Initailize all sprites
%Initailize all sprites
InitializeSprites()

%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

var temp, temp1 : int 
temp := 550
temp1 := 370
%Pause button
PauseButton(temp, temp1) 

%Health bar
HealthBarHero()
HealthBarVillain()
%Four Options
FourOptions()

%Two Options
TwoOptions()

%Clears the screen
cls 
SetBackground8(background8x, background8y) 
%Set the standinghero sprites, based from the character the user chose in the menu screen
if Hero1 then 
SetHero(Hero1String, ytemp, ytemp)  
Time.Delay(100) 
end if 
 
if Hero2 then
SetHero(Hero2String, ytemp, ytemp)   
Time.Delay(100) 
end if 
 
if Hero3 then
SetHero(Hero3String, ytemp, ytemp) 
Time.Delay(100) 
end if 

%Set Villain3
SetVillain(Villain3String, ytemp) 
UserInput()
end Scene8

body procedure Scene9
scene9 := true 
%Initailize all sprites
%Initailize all sprites
InitializeSprites()

%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

var temp, temp1 : int 
temp := 550
temp1 := 370
%Pause button
PauseButton(temp, temp1) 

%Health bar
HealthBarHero()
HealthBarVillain()

%Clears the screen
cls 
SetBackground9(background9x, background9y) 
if not ZeroHPHero then
%Set the standinghero sprites, based from the character the user chose in the menu screen
if Hero1 then 
SetHero(Hero1String, ytemp, ytemp) 
Time.Delay(100) 
end if 
 
if Hero2 then
SetHero(Hero2String, ytemp, ytemp) 
Time.Delay(100) 
end if 
 
if Hero3 then
SetHero(Hero3String, ytemp, ytemp) 
Time.Delay(100) 
end if 
put "Congratulations! You have been defeated all of the monsters! \n"
Time.Delay(500)
FinishedGame()
end if 
end Scene9 

%Used for when the player dies 
body procedure GameOver
%Initailize all sprites
InitializeSprites()

%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

var temp, temp1 : int 
temp := 550
temp1 := 370
%Pause button
PauseButton(temp, temp1) 

%Health bar
HealthBarHero()
HealthBarVillain()

Music.PlayFileStop
scene10 := true
%Clears the screen
cls
SetBackgroundGameover(backgroundGameoverx, backgroundGameovery)
RestartButton(centrex, centrey) 

font8 := Font.New("Palatino:12:Bold,Italic")
Font.Draw("Nice try valiant one, but the hero has died", centrex - 100, centrey - 50, font8, black)

font9 := Font.New("Palatino:12:Bold,Italic")
Font.Draw("To restart, press the Restart button", centrex - 100, centrey - 75, font9, black) 
end GameOver

%Used for when the player finishes the game
body procedure FinishedGame
%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

Music.PlayFileStop
scene11 := true
%Clears the screen
cls
GUI.SetBackgroundColour(yellow)
put "Congratulations! You have finished the game! \n"
Time.Delay(1000)
put "You will now be redirected to a restarting screen. \n"
Time.Delay(1000)
PlayAgain()
end FinishedGame

%Return to the GameCover screen
body procedure Return
%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

cls
GameCover()
end Return

%Displayed on the pause button 
body procedure ReturnPrev
%Hide all sprites
HideHeroSprites()
HideVillainSprites()
HideBackgroundSprites()

if scene1 then
StoryPlot()
end if 
if scene2 then
Scene1()
end if 
if scene3 then
Scene2()
end if 
if scene4 then
Scene3()
end if 
if scene5 then
Scene4()
end if 
if scene6 then
Scene5()
end if 
if scene7 then
Scene6()
end if 
if scene8 then
Scene7()
end if 
if scene9 then
Scene8()
end if 
if scene10 then
Scene9()
end if 
if scene11 then
GameOver()
end if 
end ReturnPrev

%Give the user 4 options for the scenes -> create a separate window to display  the options 
body procedure FourOptions
Window8ID := Window.Open("position:top;centre.graphics:1000;1000")
Window.Select(Window8ID) 
put "You have 4 options in total. \n" 
Time.Delay(1000)
put "1. Type 'MoveR' or press the right arrow key to move right. \n" 
Time.Delay(1000)
put "2. Type 'MoveL' or press the left arrow key to move left. \n"
Time.Delay(1000) 
put "3. Type 'Rest' or press the down arrow key to rest. \n" 
Time.Delay(1000) 
put "4. Type 'Continue' or press the up arrow key to continue playing. \n"
Time.Delay(1000)
put "In the event that the user decides to rest, the HP will be eventually restored. \n" 
Time.Delay(1000)
put "Choose either one of these options to continue \n" 
Time.Delay(1000) 

%Initialize the boolean variables, then do the user input procedure 
get response 
if response = "MoveR" then
mover := true
end if 

if response = "MoveL" then
movel := true
end if 

if response = "Rest" then
rest := true
end if 

if response = "Continue" then
continue := true
end if 

%Run the user input loop
UserInput()
Window.Close(Window8ID) 
end FourOptions 

%Give the user 2 options for when the mosnter appears
body procedure TwoOptions
%If the absolute distance between the hero and the villain is less than 100...
if abs(Hero1x - Villain1x) <= 100 or abs(Hero2x - Villain2x) <= 100 or abs(Hero3x - Villain3x) <= 100 then
Window9ID := Window.Open("position:top;centre,graphics:1000;1000")
Window.Select(Window9ID)
put "You have 2 options in total. \n"
Time.Delay(1000)
put "1. Type 'Attack' or press 'A' or 'a' to attack the monster. \n"
Time.Delay(1000)
put "2. Type 'Decline' or press 'D' or 'd' to back away from the monster. \n"
Time.Delay(1000)
put "You must choose either one of these options to continue. \n"
Time.Delay(1000)

%Initialize the boolean variables, then do the user input procedure 
get response
if response = "Attack" then 
attack := true
decline := false
end if 

if response = "Decline" then
attack := false 
decline := true
end if 

%Run the user input loop
UserInput()
end if 
end TwoOptions
 

%Used to restart or redirect the user back to the main screen -> uses the checkpoints 
    %This body procedure refers to the procedure that was forwarded previously
body procedure PlayAgain %We can use the Window module from Turing -> Window.Open() and Window.Close() to optimize a bit 
SetBackgroundMenu(centrex, centrey)
cls
colour(yellow) 
put "You have chosen to restart the game! \n" 
Time.Delay(1000)
 
put "Press yes to start on the very first scene \n"
get response 
if response = "Yes" then
cls
IntroScreen() %Redirect back to the intro scene
end if 
var xcoor3, ycoor3 : int
xcoor3 := centrex
ycoor3 := centrey - 300 
put "Press yes or no to confirm answer \n"
 
%Press any key to continue 
%Begin input from user  
get response
if response = "Yes" then
cls 
Time.Delay(500)
put "You will now restart on the intro screen. \n"
IntroScreen()

elsif response = "No" then
cls
Time.Delay(500)
put "You will now restart on the Game Cover. \n"
%Directly skip over intro screen
GameCover() 
end if 
end PlayAgain 
 
%Button is displayed when the hero dies or when the user pauses 
body procedure RestartButton
RestartButtonID := GUI.CreateButton(x, y, 0, "Press to restart the game.", PlayAgain)
loop
exit when GUI.ProcessEvent
end loop
end RestartButton

InitializeSprites() 
IntroScreen()
