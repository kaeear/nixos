#include <stdio.h>
#include <string.h>
#include <stdbool.h>

double printResult(char operation[], double number1, double number2){
  double result;
  bool isValid = 1;
  if (strcmp(operation, "add") == 0){
    result = number1 + number2;
  } else if (strcmp(operation, "subtract") == 0){
    result = number1 - number2;
  } else if (strcmp(operation, "multiply") == 0){
    result = number1 * number2;
  } else if (strcmp(operation, "divide") == 0){
    result = number1 / number2;
  } else {
    printf("Invalid operator\n");
    isValid = 0;
  }
  if (isValid == 1){
    printf("Your result is %lf\n", result);
  }
  return result;
}

int main(){
  char operation[8];
  double number1;
  double number2;
  double result;

  printf("Hello this is your Calculator!\nWhat do you want to do?\nadd, subtract, multiply, divide or exit?\n");
  scanf("%s", operation);
  printf("Ok you want to ");
  printf("%s", operation);
  printf("\nPlease type in your first number: ");
  scanf("%lf", &number1);
  printf("Please type in your second number: ");
  scanf("%lf", &number2);

  result = printResult(operation, number1, number2);
  
  return 0;
}
