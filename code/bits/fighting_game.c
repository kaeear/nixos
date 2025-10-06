#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>


typedef struct{
  char name[50];
  float damage;
  float attackDuration;
}Weapon;

typedef struct{
  char name[50];
  Weapon weapon;
  float healthpoints;
  float attackCooldown;
  int initiative;
}Character;

void calculateAttack(Character activeCharacter, Character *pUser, Character *pOpponent);
Weapon getRandomWeapon();

Weapon cloudSlasher = {"Cloud Slasher", 10, 0.5};
Weapon bloodStalker = {"Blood Stalker", 36, 2};
Weapon chainRipper = {"Chain Ripper", 24, 1.2};


int main(){
  Character user = {"User", getRandomWeapon(rand() % 3), 100, 0, 10};
  Character opponent = {"Opponent", getRandomWeapon(rand() % 3), 100, 0, 1};
  Character *pUser = &user;
  Character *pOpponent = &opponent;
  Character activeCharacter;
  Character nullCharacter = {"", {"", 0, 0}, 0 ,0 ,0};
  int input;

  srand(time(NULL));

  printf("You have %s equipped\n", user.weapon.name);
  printf("But your Opponent got %s\n", opponent.weapon.name);
   
  while(user.healthpoints > 0 && opponent.healthpoints > 0){


    if(user.attackCooldown <= 0){
      if(opponent.attackCooldown <= 0){
        activeCharacter = (user.initiative > opponent.initiative) ? user : opponent;
      }else{
        activeCharacter = user;
      }
    }else if(opponent.attackCooldown <= 0){
      activeCharacter = opponent;
    }

    if(user.attackCooldown <= 0 || opponent.attackCooldown <= 0){
      printf("%f ACD", user.attackCooldown);
      printf("   %f Enemy ACD\n", opponent.attackCooldown);
      calculateAttack(activeCharacter, pUser, pOpponent);
      printf("%s attacks!\n", activeCharacter.name);
      activeCharacter = nullCharacter;
      printf("%f HP", user.healthpoints);
      printf("   %f Enemy HP\n", opponent.healthpoints);
      printf("%f ACD", user.attackCooldown);
      printf("   %f Enemy ACD\n", opponent.attackCooldown);
      scanf("%d", &input);
    }else{
      user.attackCooldown -= 0.1;
      opponent.attackCooldown -= 0.1;
    }
  }
  return 0;
}

Weapon getRandomWeapon(int random){
  switch(random){
    case 0:
      return cloudSlasher;
      break;
    case 1:
      return bloodStalker;
      break;
    case 2:
      return chainRipper;
      break;
  }
}

void calculateAttack(Character activeCharacter, Character *pUser, Character *pOpponent){
  if(strcmp(activeCharacter.name, pUser->name) == 0){  
    pUser->attackCooldown += pUser->weapon.attackDuration;
    pOpponent->healthpoints -= pUser->weapon.damage;
  }else if(strcmp(activeCharacter.name, pOpponent->name) == 0){
    pOpponent->attackCooldown += pOpponent->weapon.attackDuration;
    pUser->healthpoints -= pOpponent->weapon.damage;
  }else{
    printf("no working\n");
  }

}
