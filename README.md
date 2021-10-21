# Lab12 KnightAndWizard FunctionStruct

Note : When you create your project name it like this --> YourFirstNameYourLastName_NameOfTheLab

## Topic

This is a final beautiful fight between the most powerfull Knight Lazarus and the new Wizard master Elvin. 
They need to fight to know who is the best fighter. 

![kisspng-aion-dungeons-dragons-cleric-paladin-male-depsito-da-render-aion-elyos-man-warrior-cleri-5bd1af06a1bfd1 0042865315404684866625](https://user-images.githubusercontent.com/6766037/138175747-0109a4ab-3482-4331-9c84-b20ed9232c61.png)
![kisspng-dungeons-dragons-human-wizard-player-character-s-wizard-5ab98d36a070d5 1165621915221097506572](https://user-images.githubusercontent.com/6766037/138175904-a9953089-6bc5-433f-b968-f1ba9472aa9d.png)




### Description of the Game 

You need to create a class Hero.
A Hero got a name, a characteristic, a level and life point. 

**Lazarus got 3 special skills  - Life point : 160**

1. Heal (Lazarus recovered 10 life point)
2. Sword Attack (Lazarus uses his powerfull sword to his opponent - 10 Damage)
3. Mega Fist (Lazarus uses his Fist to beat his opponent - 30 Damage)

**Elvin got 3 special skills - Life point 140**

1. Heal (Elvin recovered 15 life point)
2. Fire Ball (Elvin uses the powerful fire spell learned centuries ago - 20 Damage)
3. Stick of the wise (Elvin uses his magical and strange stick to beat his opponent - 15 Damage)

You need to create a class for Lazarus and Elvin with their speciality. 

Each of them got some Weapon and Power. 
So you need to create 2 Struct. one for Weapon and an other for Power. 

The Weapon struc got the following information : 

	- Name 
	- Damage 
	- Attack action (apply the damage to the opponent) 

The Power struc got the following information : 

	- Name 
	- Damage
	- Attack action (apply the damage to the opponent)
	- Spécial effect (for Lazarus : +2 to Life Point - for Elvin : +10 damage)

### Logic of the game

You got a button to simulate a rolling dice. 
If the result is between 1 and 3 it's Lazarus action. 

	1 - Lazarus use Heal 
	2 - Lazarus use Sword 
	3 - Lazarus use Mega Fist
	
If the result is between 4 and 6 it's Elvin action. 
	
	4 - Elvin use Heal 
	5 - Elvin use Fire Ball 
	6 - Elvin use Stick of Wise 
	
You must apply the different actions 

Descrition for a turn :

* 	RollDice
* 	Excute actions 
* 	See if we got a winner
* 	Do it until you have a winner
	
You need to print all step on your console area. 

## DeadLine

Sunday 24 October 




 
 
