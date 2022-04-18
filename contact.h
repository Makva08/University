/*********************************************main.c******************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#include "ContactNode.h"

void removeNewline(char * string){
   for(int i=0;i<strlen(string);i++){
      if(string[i] == '\n')
         string[i] = '\0';
   }
}

int main(void) {

   /* Type code here */
   ContactNode contacts[3];
   char name[50];
   char number[50];
   
   for(int i=0;i<=2;i++){
      printf("Person %d\n",i+1);
      printf("Enter name:\n");
      fgets(name,50,stdin);
      removeNewline(name);
      printf("Enter phone number:\n");
      fgets(number,50,stdin);
      removeNewline(number);
      printf("You entered: %s, %s\n\n",name,number);
      CreateContactNode(&contacts[i],name,number,NULL);
   }
   
   printf("CONTACT LIST\n");
   for(int i=0;i<3;i++){
      printf("Name: %s\n",contacts[i].contactName);
      printf("Phone number: %s\n",contacts[i].contactPhoneNum);
      printf("\n");
   }
  
   return 0;
}

/*********************************************ContactNode.c******************************************/

/* Type code here */
#include "ContactNode.h"

void CreateContactNode(ContactNode* node,char * name,char * number,ContactNode * nextNode){
   strcpy(node->contactName,name);
   strcpy(node->contactPhoneNum,number);
   node->nextNodePtr = nextNode;
}

void InsertContactAfter(ContactNode* first,ContactNode* second){
   ContactNode * temp;
   temp = first->nextNodePtr;
   first->nextNodePtr = second;
   second->nextNodePtr = temp;
}

ContactNode * GetNextContact(ContactNode * node){
   return node->nextNodePtr;   
}

/*********************************************ContactNode.h******************************************/

/* Type code here */
#ifndef STRING_H
#include <string.h>
#endif

typedef struct ContactNode_struct{
   char contactName[50];
   char contactPhoneNum[50];
   struct ContactNode_struct * nextNodePtr;
} ContactNode;

void CreateContactNode(ContactNode* node,char * name,char * number,ContactNode*);
void InsertContactAfter(ContactNode* first,ContactNode* second);
ContactNode * GetNextContact(ContactNode * node);
