#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#define MAX_STRING_LENGTH     70

struct lnk_node
{
    char node_String[MAX_STRING_LENGTH];
    struct lnk_node *nxt;
};

void dspl_list( struct lnk_node *first )
{
    struct lnk_node * node;
    node = first;
    printf("\nOrdered list\n");
    while(node->nxt != NULL)
    {
        node = node->nxt;
        printf("%s",node->node_String);
    }
}
int comparingTWOnodes( struct lnk_node *n1, struct lnk_node *n2 ){
    if(n1->node_String[0] > n2->node_String[0])
        return 1;
    else if(n1->node_String[0] == n2->node_String[0])
        return 0;
    else
        return -1;
}

struct lnk_node *addnode( struct lnk_node *list,struct lnk_node *node )
{
    struct lnk_node * tempor;
    if(comparingTWOnodes(list,node) == 1)
    {
        node->nxt = list;
        return node;
    }
    tempor = list;
    while(tempor->nxt != NULL)
    {
        if(comparingTWOnodes(tempor->nxt,node) == 1)
        {
            node->nxt = tempor->nxt;
            tempor->nxt = node;
            return list;
        }
        if(comparingTWOnodes(node,tempor) == 0)
        {
            node->nxt = tempor->nxt;
            tempor->nxt = node;
            return list;
        }
        tempor = tempor->nxt;
    }
    tempor->nxt = node;
    node->nxt = NULL;
    return list;
}


int main()
{
    int size=1;
    char strng[MAX_STRING_LENGTH];
    printf("Please enter strings. When you are done, enter a blank line.\n");
    struct lnk_node * node_array = (struct lnk_node *)malloc(sizeof(struct lnk_node));
    struct lnk_node * first = node_array;
    node_array[0].nxt = NULL;
    while(1)
    {
        fgets(strng,MAX_STRING_LENGTH,stdin);
        if(strcmp(strng," \n") == 0)
        {
			break;
        }

	else
	{
		size += 1;
		node_array = realloc(node_array,sizeof(struct lnk_node)*size);
	}
        for(int i=0;i<strlen(strng);i++)
            strng[i] = tolower(strng[i]);
        strcpy(node_array[size-1].node_String,strng);
        first = addnode(first,&node_array[size-1]);

    }
    dspl_list(first);
    free(node_array);
    return 0;
}

